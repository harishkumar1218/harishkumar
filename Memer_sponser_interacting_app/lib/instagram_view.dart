import 'package:admeme/pages/homepage.dart';
import 'package:admeme/register_memer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:admeme/home.dart';
import 'package:admeme/instagram_constant.dart';
import 'package:admeme/instagram_model.dart';
import 'package:flutter_webview_plugin_ios_android/flutter_webview_plugin_ios_android.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InstagramView extends StatelessWidget {
  final islogin;
  const InstagramView({Key? key, required this.islogin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      final webview = FlutterWebviewPlugin();
      final InstagramModel instagram = InstagramModel();

      buildRedirectToHome(webview, instagram, context);

      return WebviewScaffold(
        url: InstagramConstant.instance.url,
        resizeToAvoidBottomInset: true,
        appBar: buildAppBar(context),
      );
    });
  }

  Future<void> buildRedirectToHome(FlutterWebviewPlugin webview,
      InstagramModel instagram, BuildContext context) async {
    webview.onUrlChanged.listen((String url) async {
      if (url.contains(InstagramConstant.redirectUri)) {
        instagram.getAuthorizationCode(url);
        await instagram.getTokenAndUserID().then((isDone) {
          if (isDone) {
            instagram.getUserProfile().then((isDone) async {
              await webview.close();

              print('${instagram.username} logged in!');
              print(instagram.accessToken);
              // const s=required()
              // FirebaseAuth.instance.signInWithCustomToken(
              //     );
              var p = instagram.getUserProfile();
              if (islogin) {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.setBool('hasSeenOnboarding', true);
                await Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => home(memer: true)
                      // HomeView(
                      //   token: instagram.authorizationCode.toString(),
                      //   name: instagram.userID.toString(),
                      // ),
                      ),
                );
              } else {
                await Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => registermemer(
                            memers: true,
                            instaid: instagram.username,
                          )),
                );
              }
            });
          }
        });
      }
    });
  }

  AppBar buildAppBar(BuildContext context) => AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Instagram Login',
          style: Theme.of(context)
              .textTheme
              .headline6!
              .copyWith(color: Colors.black),
        ),
      );
}
