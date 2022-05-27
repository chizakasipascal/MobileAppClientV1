class FormValidator {
  static FormValidator? _instance;

  factory FormValidator() => _instance ??= FormValidator._();

  FormValidator._();

  static String? valueExists(dynamic value) {
    if (value == null || value.isEmpty) {
      return 'Veuillez remplir ce champ*';
    } else {
      return null;
    }
  }

  static String? validatePassword(dynamic value) {
    var emptyResult = valueExists(value);
    if (emptyResult == null || emptyResult.isEmpty) {
      var pattern = r'^(?=.*?[A-Z])(?=.*?[a-z]).{6,}$';
      var regExp = RegExp(pattern);
      if (!regExp.hasMatch(value)) {
        return "Doit avoir 6 caractères (Maj & Min)";
      } else {
        return null;
      }
    } else {
      return emptyResult;
    }
  }

  static String? validatePhoneNumber(dynamic value) {
    var pattern = r'^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$';
    var regExp = RegExp(pattern);
    var emptyResult = valueExists(value);
    if (emptyResult != null) {
      return emptyResult;
    } else if (!regExp.hasMatch(value)) {
      return "Numéro invalide*";
    } else {
      return null;
    }
  }

  static String? validateEmail(dynamic value) {
    var pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    var regExp = RegExp(pattern);
    var emptyResult = valueExists(value);
    if (emptyResult != null) {
      return emptyResult;
    } else if (!regExp.hasMatch(value)) {
      return "Adresse mail invalide*";
    } else {
      return null;
    }
  }
}
