import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_auth_ui/supabase_auth_ui.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class GoogleSignin extends StatelessWidget {
  const GoogleSignin({super.key});

  Future<void> _nativeGoogleSignIn() async {
    var webClientId = dotenv.get('WEBCLIENT_ID');
    var iosClientId = dotenv.get('WEBCLIENT_ID');

    final GoogleSignIn googleSignIn = GoogleSignIn(
      clientId: webClientId,
      serverClientId: webClientId,
    );

    try {
      final googleUser = await googleSignIn.signIn();
      final googleAuth = await googleUser!.authentication;
      final accessToken = googleAuth.accessToken;
      final idToken = googleAuth.idToken;
      if (accessToken == null) {
        throw 'No Access Token found.';
      }
      if (idToken == null) {
        throw 'No ID Token found.';
      }
      await Supabase.instance.client.auth.signInWithIdToken(
        provider: OAuthProvider.google,
        idToken: idToken,
        accessToken: accessToken,
      );
    } catch (e) {
      if (e is PlatformException) {
        print({'Login Failed', e});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ShadButton(
      onPressed: _nativeGoogleSignIn,
      width: double.maxFinite,
      backgroundColor: Colors.white,
      leading: Image.asset('assets/images/google_icon.png'),
      child: Text("Continue with Google"),
    );
  }
}
