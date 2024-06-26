class ValidationHub {
  static bool isValidEmailFormat(String email) {
    // Regular expression for basic email validation
    final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    // Check if the email matches the regular expression
    return emailRegex.hasMatch(email);
  }

  static bool isValidFullName(String fullName) {
    // Regular expression pattern for basic full name validation
    final RegExp fullNameRegex = RegExp(
        r'^[a-zA-Z]+(?:\s[a-zA-Z]+)*$'); // Allows only alphabetical characters and spaces

    // Check if the full name matches the regular expression
    return fullNameRegex.hasMatch(fullName);
  }

  //for validating password
  bool isPasswordValid(String password) {
    return RegExp(r'^.{8,}$').hasMatch(password);
  }
}