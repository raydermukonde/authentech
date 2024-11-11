/// Custom exception class to handle various Firebase Auth exceptions
class TFirebaseAuthException implements Exception {
  /// the error code associated with the exception.
  final String code;
  /// Constructor that takes an error code.
  TFirebaseAuthException(this.code);

  /// Get the corresponding error message based on the error code.
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
      return 'An error occurred while creating user.';
  }
  }
 }
