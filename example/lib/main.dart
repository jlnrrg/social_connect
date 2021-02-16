import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:social_connect/domain/value_objects.dart';
import 'package:social_connect/views/social_connect.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
            body: SafeArea(
                child: Column(
          children: [Expanded(child: MessengerShare())],
        ))));
  }
}

class MessengerShare extends HookWidget {
  MessengerShare({Key key}) : super(key: key);

  Widget _buildMessengerField(
      BuildContext context, SocialAccount socialAccount) {
    final acc = useState(socialAccount);
    // editcontroller.addListener(() {
    //   // acc.value = acc.value.copyWith(identifier: editcontroller.text);
    //   // debugPrint(editcontroller.text);
    // });

    final showWidget = SocialShare.show(
        key: Key('show:' + acc.value.identifier), socialAccount: acc.value);

    final editWidget = SocialShare.edit(
        socialAccount: acc.value,
        onChanged: (newAcc) {
          debugPrint(newAcc.toString());
          acc.value = newAcc;
        });

    return Column(children: <Widget>[editWidget, showWidget]);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView(
      shrinkWrap: true,
      children:
          socialList.map((e) => _buildMessengerField(context, e)).toList(),
    ));
  }
}

final socialList = <SocialAccount>[
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
