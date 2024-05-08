import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:nutritional_management/features/sign_in/domain/sign_in_gateway_interface.dart';

class SignInGateway implements SignInGatewayInterface {
  @override
  Future<bool> signIn() async {
    // GoogleSignIn をして得られた情報を Firebase と関連づけることをやっています。
    try {
      final googleUser =
          await GoogleSignIn(scopes: ['profile', 'email']).signIn();

      final googleAuth = await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);

      return true;
    } catch (e) {
      return false;
    }
  }
}
