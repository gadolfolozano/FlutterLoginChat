class ValidatorUtil {
  static const String EMAIL_PATTERN = r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

  static bool isEmailValid(String email) {
    return RegExp(EMAIL_PATTERN).hasMatch(email);
  }

  static bool isPasswordValid(String password) {
    return password.isNotEmpty && password.length >= 8;
  }
}
