
import 'package:flutter/material.dart';
import 'package:mdmottu/lang/app_translation.dart';

import 'validators_helpers.dart';

class Validators {
  Validators._();

  static FormFieldValidator required({String m = 'required_field'}) {
    return (v) {
      if (v?.isEmpty ?? true) return AppTranslationString.string(m);
      return null;
    };
  }

  static FormFieldValidator<String> min(int min, String m) {
    return (v) {
      if (v?.isEmpty ?? true) return null;
      if ((v?.length ?? 0) < min) return AppTranslationString.string(m);
      return null;
    };
  }

  static FormFieldValidator<String> max(int max, String m) {
    return (v) {
      if (v?.isEmpty ?? true) return null;
      if ((v?.length ?? 0) > max) return AppTranslationString.string(m);
      return null;
    };
  }

  static FormFieldValidator<String> email({String m = 'mail_invalid'}) {
    return (v) {
      if (v?.isEmpty ?? true) return null;
      if (validatorRegex.email(v!)) return null;
      return AppTranslationString.string(m);
    };
  }

  static FormFieldValidator<String> multiple(List<FormFieldValidator<String>> v) {
    return (value) {
      for (final validator in v) {
        final result = validator(value);
        if (result != null) return result;
      }
      return null;
    };
  }
}