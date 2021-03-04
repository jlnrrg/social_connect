import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:simple_icons/simple_icons.dart';
import 'package:social_connect/domain/value_unions.dart';

part 'social_account.freezed.dart';

@freezed
abstract class SocialAccount with _$SocialAccount {
  factory SocialAccount._({
    @required Icon icon,
    @required String name,
    @required String Function(String) prelink,
    @required String identifier,
    @required bool isPublic,
  }) = _MessengerAccount;

  @late
  String get link => prelink(identifier);

  factory SocialAccount.email(String emailAddress,
          {Color iconColor, bool isPublic}) =>
      SocialAccount._(
        icon: Icon(FontAwesomeIcons.envelope, color: iconColor),
        name: 'Email',
        identifier: emailAddress,
        prelink: (String emailAddress) => 'mailto:$emailAddress',
        isPublic: isPublic ?? true,
      );

  factory SocialAccount.phone(String number,
          {Color iconColor, bool isPublic}) =>
      SocialAccount._(
        icon: Icon(FontAwesomeIcons.phone, color: iconColor),
        name: '#',
        identifier: number,
        prelink: (String number) => 'tel:$number',
        isPublic: isPublic ?? true,
      );

  factory SocialAccount.whatsapp(int number,
          {Color iconColor, bool isPublic}) =>
      SocialAccount._(
        icon: Icon(SimpleIcons.whatsapp,
            color: iconColor ?? const Color(0xFF25D366)),
        name: 'WhatsApp',
        identifier: number?.toString() ?? '',
        prelink: (String number) =>
            'https://wa.me/$number', //https://wa.me/49xxxxxxxxxxx
        isPublic: isPublic ?? true,
      );

  factory SocialAccount.telegram(String username,
          {Color iconColor, bool isPublic}) =>
      SocialAccount._(
        icon: Icon(SimpleIcons.telegram,
            color: iconColor ?? const Color(0xFF0088cc)),
        name: 'Telegram',
        identifier: username,
        prelink: (String username) => 'https://t.me/$username',
        isPublic: isPublic ?? true,
      );

  factory SocialAccount.facebook(String username,
          {Color iconColor, bool isPublic}) =>
      SocialAccount._(
        icon: Icon(SimpleIcons.facebook,
            color: iconColor ?? const Color(0xFF4267B2)),
        name: 'Facebook',
        identifier: username,
        prelink: (String username) => 'https://www.facebook.com/$username',
        isPublic: isPublic ?? true,
      );

  factory SocialAccount.discord(String userid,
          {Color iconColor, bool isPublic}) =>
      SocialAccount._(
        icon: Icon(SimpleIcons.discord,
            color: iconColor ?? const Color(0xFF7289da)),
        name: 'Discord',
        identifier: userid,
        prelink: (String userid) => 'https://discordapp.com/users/$userid',
        isPublic: isPublic ?? true,
      );

  factory SocialAccount.instagram(String username,
          {Color iconColor, bool isPublic}) =>
      SocialAccount._(
        icon: Icon(SimpleIcons.instagram,
            color: iconColor ?? const Color(0xFFE4405F)),
        name: 'Instagram',
        identifier: username,
        prelink: (String username) => 'https://www.instagram.com/$username',
        isPublic: isPublic ?? true,
      );

  factory SocialAccount.tiktok(String username,
          {Color iconColor, bool isPublic}) =>
      SocialAccount._(
        icon: Icon(SimpleIcons.tiktok,
            color: iconColor ?? const Color(0xFF000000)),
        name: 'Tik Tok',
        identifier: username,
        prelink: (String username) => 'https://www.tiktok.com/@$username',
        isPublic: isPublic ?? true,
      );

  factory SocialAccount.snapchat(String username,
          {Color iconColor, bool isPublic}) =>
      SocialAccount._(
        icon: Icon(SimpleIcons.snapchat,
            color: iconColor ?? const Color(0xFFFFFC00)),
        name: 'Snapchat',
        identifier: username,
        prelink: (String username) => 'https://www.snapchat.com/add/$username',
        isPublic: isPublic ?? true,
      );

  factory SocialAccount.skype(String username,
          {Color iconColor, bool isPublic}) =>
      SocialAccount._(
        icon: Icon(SimpleIcons.skype,
            color: iconColor ?? const Color(0xFF00aff0)),
        name: 'Skype',
        identifier: username,
        prelink: (String username) => '', //TODO(jr): to be found out
        isPublic: isPublic ?? true,
      );

  factory SocialAccount.viber(String number,
          {Color iconColor, bool isPublic}) =>
      SocialAccount._(
        icon: Icon(SimpleIcons.viber,
            color: iconColor ?? const Color(0xFF665CAC)),
        name: 'Viber',
        identifier: number,
        prelink: (String number) =>
            'viber://chat?number=$number', //! will not work in browser
        isPublic: isPublic ?? true,
      );

  factory SocialAccount.twitter(String username,
          {Color iconColor, bool isPublic}) =>
      SocialAccount._(
        icon: Icon(SimpleIcons.twitter,
            color: iconColor ?? const Color(0xFF1DA1F2)),
        name: 'Twitter',
        identifier: username,
        prelink: (String username) => 'https://twitter.com/$username',
        isPublic: isPublic ?? true,
      );

  factory SocialAccount.linkedin(String userid,
          {Color iconColor, bool isPublic}) =>
      SocialAccount._(
        icon: Icon(SimpleIcons.linkedin,
            color: iconColor ?? const Color(0xFF0072b1)),
        name: 'Linkedin',
        identifier: userid,
        prelink: (String userid) => 'https://linkedin.com/in/$userid',
        isPublic: isPublic ?? true,
      );

  factory SocialAccount.xing(String username,
          {Color iconColor, bool isPublic}) =>
      SocialAccount._(
        icon:
            Icon(SimpleIcons.xing, color: iconColor ?? const Color(0xFF006567)),
        name: 'Xing',
        identifier: username,
        prelink: (String username) => 'https://www.xing.com/profile/$username',
        isPublic: isPublic ?? true,
      );

  factory SocialAccount.tumblr(String username,
          {Color iconColor, bool isPublic}) =>
      SocialAccount._(
        icon: Icon(SimpleIcons.tumblr,
            color: iconColor ?? const Color(0xFF34526f)),
        name: 'Tumblr',
        identifier: username,
        prelink: (String username) => 'https://$username.tumblr.com/ask',
        isPublic: isPublic ?? true,
      );

  factory SocialAccount.wechat(String username,
          {Color iconColor, bool isPublic}) =>
      SocialAccount._(
        icon: Icon(SimpleIcons.wechat,
            color: iconColor ?? const Color(0xFF9de60b)),
        name: 'WeChat',
        identifier: username,
        prelink: (String username) => '', //TODO(jr): to be found out
        isPublic: isPublic ?? true,
      );

  factory SocialAccount.sinaweibo(String userid,
          {Color iconColor, bool isPublic}) =>
      SocialAccount._(
        icon: Icon(SimpleIcons.sinaweibo,
            color: iconColor ?? const Color(0xFFdf2029)),
        name: 'Sina Weibo',
        identifier: userid,
        prelink: (String userid) => 'https://weibo.com/u/$userid',
        isPublic: isPublic ?? true,
      );

  factory SocialAccount.line(String lineId, {Color iconColor, bool isPublic}) =>
      SocialAccount._(
        icon:
            Icon(SimpleIcons.line, color: iconColor ?? const Color(0xFF00b900)),
        name: 'Line',
        identifier: lineId,
        prelink: (String lineId) => 'https://line.me/R/ti/p/$lineId',
        isPublic: isPublic ?? true,
      );

  factory SocialAccount.threema(String username,
          {Color iconColor, bool isPublic}) =>
      SocialAccount._(
        icon: Icon(SimpleIcons.threema,
            color: iconColor ?? const Color(0xFF000000)),
        name: 'Threema',
        identifier: username,
        prelink: (String username) => 'https://threema.id/$username?text=',
        isPublic: isPublic ?? true,
      );

  factory SocialAccount.element(String username,
          {Color iconColor, bool isPublic}) =>
      SocialAccount._(
        icon: Icon(SimpleIcons.element,
            color: iconColor ?? const Color(0xFF0DBD8B)),
        name: 'Element',
        identifier: username,
        prelink: (String username) => '', //TODO(jr): to be found out
        isPublic: isPublic ?? true,
      );

  factory SocialAccount.reddit(String username,
          {Color iconColor, bool isPublic}) =>
      SocialAccount._(
        icon: Icon(SimpleIcons.reddit,
            color: iconColor ?? const Color(0xFFff4500)),
        name: 'Reddit',
        identifier: username,
        prelink: (String username) => 'https://www.reddit.com/user/$username',
        isPublic: isPublic ?? true,
      );

  factory SocialAccount.tinder(String username,
          {Color iconColor, bool isPublic}) =>
      SocialAccount._(
        icon: Icon(SimpleIcons.tinder,
            color: iconColor ?? const Color(0xFFfe3c72)),
        name: 'Tinder',
        identifier: username,
        prelink: (String username) => 'https://www.gotinder.com/@$username',
        isPublic: isPublic ?? true,
      );

  factory SocialAccount.icq(String icqNumber,
          {Color iconColor, bool isPublic}) =>
      SocialAccount._(
          icon: Icon(SimpleIcons.icq,
              color: iconColor ?? const Color(0xFF24FF00)),
          name: 'ICQ',
          identifier: icqNumber,
          prelink: (String icqNummer) => 'https://icq.im/$icqNummer',
          isPublic: isPublic ?? true);

  factory SocialAccount.imgur(String username,
          {Color iconColor, bool isPublic}) =>
      SocialAccount._(
          icon: Icon(SimpleIcons.imgur,
              color: iconColor ?? const Color(0xFF1BB76E)),
          name: 'imgur',
          identifier: username,
          prelink: (String username) => 'https://imgur.com/user/$username',
          isPublic: isPublic ?? true);
}

final socialAccountsAll = <SocialAccount>[
  SocialAccount.discord(''),
  SocialAccount.element(''),
  SocialAccount.email(''),
  SocialAccount.facebook(''),
  SocialAccount.icq(''),
  SocialAccount.imgur(''),
  SocialAccount.instagram(''),
  SocialAccount.line(''),
  SocialAccount.linkedin(''),
  SocialAccount.phone(''),
  SocialAccount.reddit(''),
  SocialAccount.sinaweibo(''),
  SocialAccount.skype(''),
  SocialAccount.snapchat(''),
  SocialAccount.telegram(''),
  SocialAccount.threema(''),
  SocialAccount.tiktok(''),
  SocialAccount.tinder(''),
  SocialAccount.tumblr(''),
  SocialAccount.twitter(''),
  SocialAccount.viber(''),
  SocialAccount.wechat(''),
  SocialAccount.whatsapp(null),
  SocialAccount.xing(''),
];
