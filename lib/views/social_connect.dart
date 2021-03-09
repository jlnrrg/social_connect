import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:social_connect/domain/core/exceptions.dart';
import 'package:social_connect/domain/social_account.dart';
import 'package:social_connect/domain/value_unions.dart';

/// [SocialShare.show] allows the user on tap to be forwarded to the according app or link in the web browser.
/// it is best to catch for [LaunchAppException]
class SocialShare extends StatefulWidget {
  SocialShare({
    Key key,
    this.socialShareWidget = const SocialShareWidget.show(),
    @required this.initialSocialAccount,
    this.isEdit = false,
    @required this.onChanged,
    @required this.onTap,
    this.asIcon,
  }) : super(key: key);

  factory SocialShare.show({
    Key key,

    /// shows the widget in a IconButton format
    bool asIcon = false,
    @required SocialAccount socialAccount,
    Future<void> Function(String url) onTap,
  }) =>
      SocialShare(
        key: key,
        initialSocialAccount: socialAccount,
        socialShareWidget: SocialShareWidget.show(),
        isEdit: false,
        asIcon: asIcon,
        onChanged: (_) => null,
        onTap: onTap,
      );

  factory SocialShare.edit({
    Key key,
    @required SocialAccount socialAccount,
    Function(SocialAccount) onTextChanged,
  }) =>
      SocialShare(
        key: key,
        initialSocialAccount: socialAccount,
        socialShareWidget: SocialShareWidget.edit(),
        isEdit: true,
        asIcon: false,
        onChanged: onTextChanged ?? (_) => null,
        onTap: (_) => null,
      );

  final SocialShareWidget socialShareWidget;
  final SocialAccount initialSocialAccount;
  final bool isEdit;
  final bool asIcon;
  final Function(SocialAccount) onChanged;
  final Future<void> Function(String url) onTap;

  @override
  SocialShareState createState() => SocialShareState(initialSocialAccount);
}

class SocialShareState extends State<SocialShare> {
  SocialShareState(this.socialAccount)
      : controller = TextEditingController(text: socialAccount.identifier),
        super();
  SocialAccount socialAccount;
  TextEditingController controller;

  double get radius => 20;

  Widget _buildTextFormField(BuildContext context) {
    // if onTap is null then no InkWell
    Widget inkWell(
        {Future<void> Function(String url) onTap, @required Widget child}) {
      return onTap != null && onTap != ((_) => null)
          ? InkWell(
              onTap: () => widget.onTap(socialAccount.link),
              child: child,
            )
          : child;
    }

    return inkWell(
        onTap: widget.onTap,
        child: TextFormField(
            controller: controller,
            enabled: widget.isEdit,
            // onTap: () => _startWebSelect(),
            decoration: InputDecoration(
                prefixIcon: socialAccount.icon,
                labelText: socialAccount.name,
                isDense: true,
                filled: false,
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
    return widget.asIcon ? _buildIcon(context) : _buildTextFormField(context);
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
