class ValidatorUtils {
  static String? validateName(String? name) {
    if (name == null || name.trim().isEmpty) {
      return "Required name";
    }
    return null;
  }

  static String? validateEmail(String? email) {
    RegExp regex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    );
    if (email == null || email.trim().isEmpty) {
      return "Required email";
    }
    if (!regex.hasMatch(email)) {
      return "Email bad format";
    }
    return null;
  }

  static String? validatePassword(String? password) {
    RegExp regExp = RegExp(
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
    );

    if (password == null || password.trim().isEmpty) {
      return "Required Password";
    }
    if (!regExp.hasMatch(password)) {
      return "Password Provided is too weak";
    }
    return null;
  }

  static String? validateEventTitle(String? title) {
    if (title == null || title.trim().isEmpty) return "Plz, enter event title";
    return null;
  }

  static String? validateEventDescription(String? description) {
    if (description == null || description.trim().isEmpty) return "Plz, enter event description";
    return null;
  }
}
