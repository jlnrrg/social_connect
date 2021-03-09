import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:simple_icons/simple_icons.dart';

part 'social_account.freezed.dart';

@freezed
abstract class SocialAccount
    implements _$SocialAccount, Comparable<SocialAccount> {
  factory SocialAccount._default({
    @required Icon icon,
    @required String name,
    @required String Function(String) prelink,
    @required String identifier,
  }) = _SocialAccount;

  @late
  String get link => prelink(identifier);

  SocialAccount._();

  factory SocialAccount.email(String emailAddress,
          {Color iconColor, bool isPublic}) =>
      SocialAccount._default(
        icon: Icon(FontAwesomeIcons.envelope, color: iconColor),
        name: 'Email',
        identifier: emailAddress,
        prelink: (String emailAddress) => 'mailto:$emailAddress',
      );

  factory SocialAccount.phone(String number,
          {Color iconColor, bool isPublic}) =>
      SocialAccount._default(
        icon: Icon(FontAwesomeIcons.phone, color: iconColor),
        name: 'Phone',
        identifier: number,
        prelink: (String number) => 'tel:$number',
      );

  factory SocialAccount.whatsapp(String number,
          {Color iconColor, bool isPublic}) =>
      SocialAccount._default(
        icon: Icon(SimpleIcons.whatsapp,
            color: iconColor ?? const Color(0xFF25D366)),
        name: 'WhatsApp',
        identifier: number,
        prelink: (String number) =>
            'https://wa.me/$number', //https://wa.me/49xxxxxxxxxxx
      );

  factory SocialAccount.telegram(String username,
          {Color iconColor, bool isPublic}) =>
      SocialAccount._default(
        icon: Icon(SimpleIcons.telegram,
            color: iconColor ?? const Color(0xFF0088cc)),
        name: 'Telegram',
        identifier: username,
        prelink: (String username) => 'https://t.me/$username',
      );

  factory SocialAccount.facebook(String username,
          {Color iconColor, bool isPublic}) =>
      SocialAccount._default(
        icon: Icon(SimpleIcons.facebook,
            color: iconColor ?? const Color(0xFF4267B2)),
        name: 'Facebook',
        identifier: username,
        prelink: (String username) => 'https://www.facebook.com/$username',
      );

  factory SocialAccount.discord(String userid,
          {Color iconColor, bool isPublic}) =>
      SocialAccount._default(
        icon: Icon(SimpleIcons.discord,
            color: iconColor ?? const Color(0xFF7289da)),
        name: 'Discord',
        identifier: userid,
        prelink: (String userid) => 'https://discordapp.com/users/$userid',
      );

  factory SocialAccount.instagram(String username,
          {Color iconColor, bool isPublic}) =>
      SocialAccount._default(
        icon: Icon(SimpleIcons.instagram,
            color: iconColor ?? const Color(0xFFE4405F)),
        name: 'Instagram',
        identifier: username,
        prelink: (String username) => 'https://www.instagram.com/$username',
      );

  factory SocialAccount.tiktok(String username,
          {Color iconColor, bool isPublic}) =>
      SocialAccount._default(
        icon: Icon(SimpleIcons.tiktok,
            color: iconColor ?? const Color(0xFF000000)),
        name: 'Tik Tok',
        identifier: username,
        prelink: (String username) => 'https://www.tiktok.com/@$username',
      );

  factory SocialAccount.snapchat(String username,
          {Color iconColor, bool isPublic}) =>
      SocialAccount._default(
        icon: Icon(SimpleIcons.snapchat,
            color: iconColor ?? const Color(0xFFFFFC00)),
        name: 'Snapchat',
        identifier: username,
        prelink: (String username) => 'https://www.snapchat.com/add/$username',
      );

  factory SocialAccount.skype(String username,
          {Color iconColor, bool isPublic}) =>
      SocialAccount._default(
        icon: Icon(SimpleIcons.skype,
            color: iconColor ?? const Color(0xFF00aff0)),
        name: 'Skype',
        identifier: username,
        prelink: (String username) => '', //TODO(jr): to be found out
      );

  factory SocialAccount.viber(String number,
          {Color iconColor, bool isPublic}) =>
      SocialAccount._default(
        icon: Icon(SimpleIcons.viber,
            color: iconColor ?? const Color(0xFF665CAC)),
        name: 'Viber',
        identifier: number,
        prelink: (String number) =>
            'viber://chat?number=$number', //! will not work in browser
      );

  factory SocialAccount.twitter(String username,
          {Color iconColor, bool isPublic}) =>
      SocialAccount._default(
        icon: Icon(SimpleIcons.twitter,
            color: iconColor ?? const Color(0xFF1DA1F2)),
        name: 'Twitter',
        identifier: username,
        prelink: (String username) => 'https://twitter.com/$username',
      );

  factory SocialAccount.linkedin(String userid,
          {Color iconColor, bool isPublic}) =>
      SocialAccount._default(
        icon: Icon(SimpleIcons.linkedin,
            color: iconColor ?? const Color(0xFF0072b1)),
        name: 'Linkedin',
        identifier: userid,
        prelink: (String userid) => 'https://linkedin.com/in/$userid',
      );

  factory SocialAccount.xing(String username,
          {Color iconColor, bool isPublic}) =>
      SocialAccount._default(
        icon:
            Icon(SimpleIcons.xing, color: iconColor ?? const Color(0xFF006567)),
        name: 'Xing',
        identifier: username,
        prelink: (String username) => 'https://www.xing.com/profile/$username',
      );

  factory SocialAccount.tumblr(String username,
          {Color iconColor, bool isPublic}) =>
      SocialAccount._default(
        icon: Icon(SimpleIcons.tumblr,
            color: iconColor ?? const Color(0xFF34526f)),
        name: 'Tumblr',
        identifier: username,
        prelink: (String username) => 'https://$username.tumblr.com/ask',
      );

  factory SocialAccount.wechat(String username,
          {Color iconColor, bool isPublic}) =>
      SocialAccount._default(
        icon: Icon(SimpleIcons.wechat,
            color: iconColor ?? const Color(0xFF9de60b)),
        name: 'WeChat',
        identifier: username,
        prelink: (String username) => '', //TODO(jr): to be found out
      );

  factory SocialAccount.sinaweibo(String userid,
          {Color iconColor, bool isPublic}) =>
      SocialAccount._default(
        icon: Icon(SimpleIcons.sinaweibo,
            color: iconColor ?? const Color(0xFFdf2029)),
        name: 'Sina Weibo',
        identifier: userid,
        prelink: (String userid) => 'https://weibo.com/u/$userid',
      );

  factory SocialAccount.line(String lineId, {Color iconColor, bool isPublic}) =>
      SocialAccount._default(
        icon:
            Icon(SimpleIcons.line, color: iconColor ?? const Color(0xFF00b900)),
        name: 'Line',
        identifier: lineId,
        prelink: (String lineId) => 'https://line.me/R/ti/p/$lineId',
      );

  factory SocialAccount.threema(String username,
          {Color iconColor, bool isPublic}) =>
      SocialAccount._default(
        icon: Icon(SimpleIcons.threema,
            color: iconColor ?? const Color(0xFF000000)),
        name: 'Threema',
        identifier: username,
        prelink: (String username) => 'https://threema.id/$username?text=',
      );

  factory SocialAccount.element(String username,
          {Color iconColor, bool isPublic}) =>
      SocialAccount._default(
        icon: Icon(SimpleIcons.element,
            color: iconColor ?? const Color(0xFF0DBD8B)),
        name: 'Element',
        identifier: username,
        prelink: (String username) => '', //TODO(jr): to be found out
      );

  factory SocialAccount.reddit(String username,
          {Color iconColor, bool isPublic}) =>
      SocialAccount._default(
        icon: Icon(SimpleIcons.reddit,
            color: iconColor ?? const Color(0xFFff4500)),
        name: 'Reddit',
        identifier: username,
        prelink: (String username) => 'https://www.reddit.com/user/$username',
      );

  factory SocialAccount.tinder(String username,
          {Color iconColor, bool isPublic}) =>
      SocialAccount._default(
        icon: Icon(SimpleIcons.tinder,
            color: iconColor ?? const Color(0xFFfe3c72)),
        name: 'Tinder',
        identifier: username,
        prelink: (String username) => 'https://www.gotinder.com/@$username',
      );

  factory SocialAccount.icq(String icqNumber,
          {Color iconColor, bool isPublic}) =>
      SocialAccount._default(
        icon:
            Icon(SimpleIcons.icq, color: iconColor ?? const Color(0xFF24FF00)),
        name: 'ICQ',
        identifier: icqNumber,
        prelink: (String icqNummer) => 'https://icq.im/$icqNummer',
      );

  factory SocialAccount.imgur(String username,
          {Color iconColor, bool isPublic}) =>
      SocialAccount._default(
        icon: Icon(SimpleIcons.imgur,
            color: iconColor ?? const Color(0xFF1BB76E)),
        name: 'imgur',
        identifier: username,
        prelink: (String username) => 'https://imgur.com/user/$username',
      );

  @override
  int compareTo(SocialAccount socialAccount) {
    final String thisName = name.toLowerCase();
    final String otherName = socialAccount.name.toLowerCase();

    // pushes null values to the front of the list
    return thisName == null
        ? otherName == null
            ? 0
            : 1
        : otherName == null
            ? -1
            : thisName.compareTo(otherName);
  }
}

final socialAccountsAll = <String, SocialAccount Function(String)>{
  'discord': (String identifier) => SocialAccount.discord(identifier),
  'element': (String identifier) => SocialAccount.element(identifier),
  'email': (String identifier) => SocialAccount.email(identifier),
  'facebook': (String identifier) => SocialAccount.facebook(identifier),
  'icq': (String identifier) => SocialAccount.icq(identifier),
  'imgur': (String identifier) => SocialAccount.imgur(identifier),
  'instagram': (String identifier) => SocialAccount.instagram(identifier),
  'line': (String identifier) => SocialAccount.line(identifier),
  'linkedin': (String identifier) => SocialAccount.linkedin(identifier),
  'phone': (String identifier) => SocialAccount.phone(identifier),
  'reddit': (String identifier) => SocialAccount.reddit(identifier),
  'sinaweibo': (String identifier) => SocialAccount.sinaweibo(identifier),
  'skype': (String identifier) => SocialAccount.skype(identifier),
  'snapchat': (String identifier) => SocialAccount.snapchat(identifier),
  'telegram': (String identifier) => SocialAccount.telegram(identifier),
  'threema': (String identifier) => SocialAccount.threema(identifier),
  'tiktok': (String identifier) => SocialAccount.tiktok(identifier),
  'tinder': (String identifier) => SocialAccount.tinder(identifier),
  'tumblr': (String identifier) => SocialAccount.tumblr(identifier),
  'twitter': (String identifier) => SocialAccount.twitter(identifier),
  'viber': (String identifier) => SocialAccount.viber(identifier),
  'wechat': (String identifier) => SocialAccount.wechat(identifier),
  'whatsapp': (String identifier) => SocialAccount.whatsapp(identifier),
  'xing': (String identifier) => SocialAccount.xing(identifier),
};
