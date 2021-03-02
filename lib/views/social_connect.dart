import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:social_connect/domain/value_objects.dart';
import 'package:social_connect/domain/value_unions.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialShare extends StatefulWidget {
  SocialShare({
    Key key,
    this.socialShareWidget = const SocialShareWidget.show(),
    @required this.initialSocialAccount,
    this.isEdit = false,
    @required this.onChanged,
    this.asIcon,
  }) : super(key: key);

  factory SocialShare.show({
    Key key,

    /// shows the widget in a IconButton format
    bool dense = false,
    @required SocialAccount socialAccount,
  }) =>
      SocialShare(
        key: key,
        initialSocialAccount: socialAccount,
        socialShareWidget: SocialShareWidget.show(),
        isEdit: false,
        asIcon: dense,
        onChanged: (_) => null,
      );

  factory SocialShare.edit(
          {Key key,
          @required SocialAccount socialAccount,
          @required Function(SocialAccount) onChanged}) =>
      SocialShare(
        key: key,
        initialSocialAccount: socialAccount,
        socialShareWidget: SocialShareWidget.edit(),
        isEdit: true,
        asIcon: false,
        onChanged: onChanged,
      );

  final SocialShareWidget socialShareWidget;
  final SocialAccount initialSocialAccount;
  final bool isEdit;
  final bool asIcon;
  final Function(SocialAccount) onChanged;

  @override
  SocialShareState createState() => SocialShareState(initialSocialAccount);
}

class SocialShareState extends State<SocialShare> {
  SocialShareState(this.socialAccount)
      : controller = TextEditingController(text: socialAccount.identifier),
        super();
  SocialAccount socialAccount;
  bool isPublic = true;
  TextEditingController controller;

  double get radius => 20;

  /// sets the [socialAccount]s [SocialAccountVisibility] and calls [widget.onChanged]
  void setSocialAccountVisibility(bool isPublic) {
    final SocialAccountVisibility visibility = isPublic
        ? SocialAccountVisibility.public()
        : SocialAccountVisibility.onRequest();

    setState(() {
      this.isPublic = isPublic;
      socialAccount = socialAccount.copyWith(visibility: visibility);
    });
    widget.onChanged(socialAccount);
  }

  Widget _buildTextFormField(BuildContext context) {
    return InkWell(
        onTap: () => _launchUrl(),
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
            inputFormatters: [ToIdentifierInputFormatter(socialAccount)],
            onChanged: (String value) {
              setState(() {
                socialAccount = socialAccount.copyWith(identifier: value);
              });
              widget.onChanged(socialAccount);
            }));
  }

  Future<void> _launchUrl() async {
    final url = socialAccount.link;

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      await launch(url, forceWebView: true, enableDomStorage: true);
      throw 'Could not launch $url';
    }
  }

  Widget _buildSwitch(BuildContext context) {
    return Tooltip(
        message: isPublic ? 'Public' : 'on Request',
        child: AdvancedSwitch(
          value: isPublic,
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
          onChanged: (value) => setSocialAccountVisibility(value),
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
                  onTap: () => _launchUrl(),
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
