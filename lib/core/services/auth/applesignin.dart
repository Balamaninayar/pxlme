import 'package:flutter/services.dart';
import 'package:the_apple_sign_in/the_apple_sign_in.dart';

class AppleSignInService {
  Future<void> signInWithApple({List<Scope> scopes = const []}) async {
    try {
      final result = await TheAppleSignIn.performRequests([
        AppleIdRequest(requestedScopes: scopes),
      ]);

      switch (result.status) {
        case AuthorizationStatus.authorized:
          final AppleIdCredential appleIdCredential = result.credential!;
          if (scopes.contains(Scope.fullName)) {
            final PersonNameComponents? fullName = appleIdCredential.fullName;
            if (fullName != null &&
                fullName.givenName != null &&
                fullName.familyName != null) {
              final displayName =
                  '${fullName.givenName} ${fullName.familyName}';
            }
          }
          return;
        case AuthorizationStatus.error:
          throw PlatformException(
              code: 'ERROR_AUTHORIZATION_DENIED',
              message: result.error.toString());
        case AuthorizationStatus.cancelled:
          throw PlatformException(
              code: 'ERROR_ABORTED_BY_USER',
              message: 'Sign in aborted by user');
        default:
          throw UnimplementedError();
      }
    } catch (e) {
      // Handle exceptions
      rethrow;
    }
  }
}
