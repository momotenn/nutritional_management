import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:nutritional_management/common/domain/infra_interface/sign_in_gateway_interface.dart';

class SignInGateway implements SignInGatewayInterface {
  @override
  Future<UserCredential> signIn() async {
    // GoogleSignIn をして得られた情報を Firebase と関連づけることをやっています。
    try {
      final googleUser =
          await GoogleSignIn(scopes: ['profile', 'email']).signIn();

      final googleAuth = await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      final user = await FirebaseAuth.instance.signInWithCredential(credential);

      return Future.value(user);
    } catch (e) {
      return Future.error(e);
    }
  }
}
