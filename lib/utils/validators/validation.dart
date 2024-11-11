class TValidator {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "Email is required";
    }

    // Regular expression for email validation
    final emailRegExp = RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z]+\.[a-zA-Z]{2,}$");
    if (!emailRegExp.hasMatch(value)) {
      return "Invalid email address";
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Password is required";
    }
    // Check for minimum length
    if (value.length < 8) {
      return "Password must be at least 8 characters long";
    }
    // Check for uppercase letters
    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return "Password must contain at least one uppercase letter";
    }
    // Check for lowercase letters
    if (!RegExp(r'[a-z]').hasMatch(value)) {
      return "Password must contain at least one lowercase letter";
    }
    // Check for numbers
    if (!RegExp(r'[0-9]').hasMatch(value)) {
      return "Password must contain at least one number";
    }
    // Check for special characters
    if (!RegExp(r'[!@#$%^&*()_-]').hasMatch(value)) {
      return "Password must contain at least one special character";
    }

    return null;
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return "Phone number is required";
    }
    // Regular expression for phone number validation
    final phoneRegExp = RegExp(r"^\+?[0-9]{10,15}$");
    if (!phoneRegExp.hasMatch(value)) {
      return "Invalid phone number";
    }
    return null;
  }

  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return "Name is required";
    }
    return null;
  }
}
