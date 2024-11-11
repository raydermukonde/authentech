class SignUpWithEmailPasswordFailure implements Exception {
  final String message;

  const SignUpWithEmailPasswordFailure([this.message = "An unknown error occurred"]);

  factory SignUpWithEmailPasswordFailure.fromCode(String code) {
    switch (code) {
      case 'weak-password':
        return const SignUpWithEmailPasswordFailure('Please enter a stronger password.');
      case 'invalid-email':
        return const SignUpWithEmailPasswordFailure('Email is not valid or badly formatted.');
      case 'email-already-in-use':
        return const SignUpWithEmailPasswordFailure('An account with this email already exists.');
      case 'operation-not-allowed':
        return const SignUpWithEmailPasswordFailure('Operation is not allowed. Please contact support.');
      case 'user-disabled':
        return const SignUpWithEmailPasswordFailure('This user has been disabled. Please contact support.');
      default:
        return const SignUpWithEmailPasswordFailure();
    }
  }
}
