import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:social_connect/domain/social_account.dart';
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
            // backgroundColor: Colors.blue,
            body: SafeArea(
                child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: 35.0,
                  maxHeight: 50.0,
                ),
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: socialAccountsAll.length,
                    itemBuilder: (context, idx) {
                      return SocialShare.show(
                        socialAccount:
                            socialAccountsAll.values.toList()[idx](''),
                        asIcon: true,
                      );
                    })),
            Expanded(child: MessengerShare())
          ],
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
      key: Key('edit:' + acc.value.identifier),
      socialAccount: acc.value,
      onTextChanged: (newAcc) {
        debugPrint(newAcc.toString());
        acc.value = newAcc;
      },
    );

    return Column(children: <Widget>[
      editWidget,
      showWidget,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView(
      shrinkWrap: true,
      children: socialAccountsAll.values
          .toList()
          .map((e) => _buildMessengerField(context, e('')))
          .toList(),
    ));
  }
}
