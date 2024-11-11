class TFirebaseFormatException extends FormatException {
  final String firebaseErrorCode;

  TFirebaseFormatException(this.firebaseErrorCode) : super(
    'Erreur Firebase: $firebaseErrorCode',
  );

  @override
  String toString() {
    return 'FirebaseFormatException: $firebaseErrorCode';
  }
}
