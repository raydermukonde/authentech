// Suggested code may be subject to a license. Learn more: ~LicenseLog:2666354985.
// Exception class for login failures with email and password.
class LoginWithEmailPasswordFailure implements Exception {
  // Error code associated with the failure.
  final String code;

  // Constructor for the exception.
  const LoginWithEmailPasswordFailure([this.code = '']);

  // Factory constructor to create an instance from an error code.
  factory LoginWithEmailPasswordFailure.fromCode(String code) {
    return LoginWithEmailPasswordFailure
(code);
  }

  // Factory constructor for a default login error.
  factory LoginWithEmailPasswordFailure.defaultError() {
    return  LoginWithEmailPasswordFailure();
  }

  // Returns a user-friendly message based on the error code.
  String get message {
    switch (code) {
      case 'email-already-in-use':
        return 'The email address is already in use by another account.';
      case 'invalid-email':
        return 'The email address is not valid.';
      case 'weak-password':
        return 'The password is too weak.';
      case 'user-not-found':
        return 'User not found.';
      case 'wrong-password':
        return 'Wrong password.';
      case 'invalid-verification-code':
        return 'Invalid verification code.';
      case 'invalid-phone-number':
        return 'Invalid phone number.';
      case 'invalid-verification-id':
        return 'Invalid verification ID.';
      case 'user-disabled':
        return 'User account has been disabled.';
      case 'quota-exceeded':
        return 'Quota exceeded.';
      case 'operation-not-allowed':
        return 'Operation not allowed.';
      case 'too-many-requests':
        return 'Too many requests.';
      case 'network-request-failed':
        return 'Network request failed.';
      case 'internal-error':
        return 'Internal error.';
      case 'invalid-credential':
        return 'Invalid credential.';
      default:
        return 'An error occurred while signing in.';
    }
  }
}
