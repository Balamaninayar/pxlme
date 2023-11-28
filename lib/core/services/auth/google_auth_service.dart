import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInService {
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  GoogleSignInService._privateConstructor();

  static final GoogleSignInService _instance =
      GoogleSignInService._privateConstructor();

  factory GoogleSignInService() {
    return _instance;
  }

  Future<GoogleSignInAccount?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();

      final GoogleSignInAuthentication? googleSignInAuthentication =
          await googleSignInAccount?.authentication;

      print(googleSignInAuthentication?.accessToken);
      print(googleSignInAuthentication?.idToken);
      return googleSignInAccount;
    } catch (error) {
      return null;
    }
  }

  Future<void> signOut() async => await _googleSignIn.signOut();
}
