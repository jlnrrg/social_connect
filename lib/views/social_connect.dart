import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:social_connect/domain/core/exceptions.dart';
import 'package:social_connect/domain/social_account.dart';
import 'package:social_connect/domain/value_unions.dart';
import 'package:url_launcher/url_launcher.dart';

/// [SocialShare.show] allows the user on tap to be forwarded to the according app or link in the web browser.
/// it is best to catch for [LaunchAppException]
class SocialShare extends StatefulWidget {
  SocialShare({
    Key key,
    this.socialShareWidget = const SocialShareWidget.show(),
    @required this.initialSocialAccount,
    this.isEdit = false,
    @required this.onChanged,
    @required this.onSwitchChanged,
    @required this.onTap,
    this.asIcon,
  }) : super(key: key);

  factory SocialShare.show({
    Key key,

    /// shows the widget in a IconButton format
    bool dense = false,
    @required SocialAccount socialAccount,
    Future<void> Function(String url) onTap = _launchUrl,
  }) =>
      SocialShare(
        key: key,
        initialSocialAccount: socialAccount,
        socialShareWidget: SocialShareWidget.show(),
        isEdit: false,
        asIcon: dense,
        onChanged: (_) => null,
        onSwitchChanged: (_) => null,
        onTap: onTap,
      );

  factory SocialShare.edit({
    Key key,
    @required SocialAccount socialAccount,
    Function(SocialAccount) onTextChanged,
    Function(bool) onSwitchChanged,
  }) =>
      SocialShare(
        key: key,
        initialSocialAccount: socialAccount,
        socialShareWidget: SocialShareWidget.edit(),
        isEdit: true,
        asIcon: false,
        onChanged: onTextChanged ?? (_) => null,
        onSwitchChanged: onSwitchChanged ?? (_) => null,
        onTap: (_) => null,
      );

  final SocialShareWidget socialShareWidget;
  final SocialAccount initialSocialAccount;
  final bool isEdit;
  final bool asIcon;
  final Function(SocialAccount) onChanged;
  final Function(bool) onSwitchChanged;
  final Future<void> Function(String url) onTap;

  static Future<void> _launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw LaunchAppException(url);
    }
  }

  @override
  SocialShareState createState() => SocialShareState(initialSocialAccount);
}

class SocialShareState extends State<SocialShare> {
  SocialShareState(this.socialAccount)
      : controller = TextEditingController(text: socialAccount.identifier),
        switchController = AdvancedSwitchController(true),
        super();
  SocialAccount socialAccount;
  TextEditingController controller;
  final AdvancedSwitchController switchController;

  double get radius => 20;

  @override
  void initState() {
    /// everytime the switch changes, call [setSocialAccountVisibility]
    switchController.addListener(() {
      widget.onSwitchChanged(switchController.value);
    });
    super.initState();
  }

  Widget _buildTextFormField(BuildContext context) {
    return InkWell(
        onTap: () => widget.onTap(socialAccount.link),
        child: TextFormField(
            controller: controller,
            enabled: widget.isEdit,
            // onTap: () => _startWebSelect(),
            decoration: InputDecoration(
                prefixIcon: socialAccount.icon,
                labelText: socialAccount.name,
                isDense: true,
                contentPadding: EdgeInsets.zero,
                disabledBorder: InputBorder.none
                // hintText: 'hint',
                ),
            inputFormatters: [
              ToIdentifierInputFormatter(socialAccount),
              FilteringTextInputFormatter.deny(
                RegExp('\\s'),
              )
            ],
            onChanged: (String value) {
              setState(() {
                socialAccount = socialAccount.copyWith(identifier: value);
              });
              widget.onChanged(socialAccount);
            }));
  }

  Widget _buildSwitch(BuildContext context) {
    return Tooltip(
        message: switchController.value ? 'Public' : 'on Request',
        child: AdvancedSwitch(
          controller: switchController,
          borderRadius: BorderRadius.all(const Radius.circular(5)),
          activeChild: Icon(
            FontAwesomeIcons.users,
            color: Theme.of(context).accentColor,
          ),
          activeColor: Theme.of(context).dividerColor,
          inactiveChild: Icon(
            FontAwesomeIcons.usersSlash,
            color: Theme.of(context).accentColor,
          ),
          inactiveColor: Theme.of(context).dividerColor,
          width: 70,
        ));
  }

  Widget _buildRow(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Flexible(child: _buildTextFormField(context)),
        if (widget.isEdit)
          Padding(
              padding: EdgeInsets.only(left: 10), child: _buildSwitch(context))
      ],
    );
  }

  Widget _buildIcon(BuildContext context) {
    return Material(
        shape: CircleBorder(),
        clipBehavior: Clip.hardEdge,
        child: Ink(
            width: 2 * radius,
            height: 2 * radius,
            child: Tooltip(
                message: socialAccount.name,
                child: InkWell(
                  onTap: () => widget.onTap(socialAccount.link),
                  child: socialAccount.icon,
                ))));
  }

  @override
  Widget build(BuildContext context) {
    return widget.asIcon ? _buildIcon(context) : _buildRow(context);
  }

  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class ToIdentifierInputFormatter extends TextInputFormatter {
  ToIdentifierInputFormatter(this.socialAccount) : super();

  final SocialAccount socialAccount;

  /// gets the username from [value] by removing occurances of [prelink]
  String splitUserNameFromLink(String Function(String) prelink, String value) {
    // no prelink defined
    if (prelink('').isEmpty) {
      return value;
    }

    final key = UniqueKey();
    final splitLink = prelink(key.toString()).split(key.toString());

    final s1 = RegExp.escape(splitLink.first).replaceAll('/', '\\/');
    final s2 = RegExp.escape(splitLink.last).replaceAll('/', '\\/');

    /// finds username in link, even if link+username is username
    final re = RegExp('(?<=$s1)(?!http)(.*)(?=$s2)');
    final match = re.firstMatch(value);
    if (match != null) {
      return match.group(0);
    } else {
      return value;
    }
  }

  /// removes leading '@' of Username
  String stripUserNameOfAt(String value) {
    if (value.startsWith('@')) {
      return value.substring(1);
    }
    return value;
  }

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final valueTrimmed = newValue.text.trim();
    final identifierWithoutLink =
        splitUserNameFromLink(socialAccount.prelink, valueTrimmed);
    final identifierWithoutAt = stripUserNameOfAt(identifierWithoutLink);

    final selectionDifference =
        newValue.text.length - identifierWithoutAt.length;
    final selection = max<int>(
        min<int>(newValue.selection.end - selectionDifference,
            identifierWithoutAt.length),
        0);

    return TextEditingValue(
      text: identifierWithoutAt,
      selection: TextSelection.collapsed(offset: selection),
    );
  }
}
