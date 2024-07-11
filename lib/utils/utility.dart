
import 'package:flutter/cupertino.dart';

class ValidationModel<bool, String> {
  final bool isValid;
  final String isMessage;

  ValidationModel(this.isValid, this.isMessage);
}

class ValidationFlagModel<bool, String> {
  final bool isValid;
  final bool isFlagValid;
  final String isMessage;

  ValidationFlagModel(this.isValid, this.isMessage, this.isFlagValid);
}

ValidationModel<bool, String> isEmail(String value) {
  String p =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  RegExp regExp = RegExp(p);

  if (value.isEmpty) {
    return ValidationModel(true, "You must enter a email to continue.");
  } else if (!regExp.hasMatch(value)) {
    return ValidationModel(true, "Please enter a valid email address.");
  } else {
    return ValidationModel<bool, String>(false, '');
  }
}

ValidationModel<bool, String> isPassword(String value) {
  String p =
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$';
  RegExp regExp = RegExp(p);

  if (value.isEmpty) {
    return ValidationModel(true, "You must enter a password to continue.");
  } else if (!regExp.hasMatch(value)) {
    return ValidationModel(true, "Please enter a valid password.");
  } else {
    return ValidationModel(false, '');
  }
}

// ValidationModel<bool, String> isPassword(String value) {
//   String p =
//       r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$';
//   RegExp regExp = RegExp(p);
//
//   if (value.isEmpty) {
//     return ValidationModel(true, "You must enter a password to continue.");
//   } else if (!regExp.hasMatch(value)) {
//     return ValidationModel(true, "Please enter a valid password.");
//   } else {
//     return ValidationModel(false, '');
//   }
// }

ValidationFlagModel<bool, String> isValidPassword(String password) {
  if (password.length < 8) {
    return ValidationFlagModel(
        true, "You must enter a password Minimum 8 characters", true);
  }
  if (!password.contains(RegExp(r'[A-Z][a-z]'))) {
    return ValidationFlagModel(true,
        "You must enter a password Both upper and lower case letters", true);
  }
  if (!password.contains(RegExp(r'[a-z]'))) {
    return ValidationFlagModel(
        true, "You must enter a password At least one lowercase letter", true);
  }
  if (!password.contains(RegExp(r'[0-9]'))) {
    return ValidationFlagModel(
        true, "You must enter a password At least one number", true);
  }

  return ValidationFlagModel(false, '', false);
}

Future<String> futureToString(Future<String> future) async {
  return future.then((value) => value.toString());
}
