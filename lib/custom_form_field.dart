library custom_form_field;

import 'package:flutter/material.dart';

class CustomFormField {
  TextFormField field({
    required String question,
    //
    required bool canBeNull,
    //
    required Function onSavedCallback,
    //
    required GlobalKey<FormState> formKey,
    //
    double? fieldTextFontSize,
    //
    String? initialValue,
    //
    double? verticalTextPadding,
    double? horizontalTextPadding,
    //
    Icon? icon,
    //

    double? borderRadius,
    //
    TextStyle? labelTextStyle,
    //
  }) {
    BorderRadius borderRadius_;
    borderRadius != null
        ? borderRadius_ = BorderRadius.circular(borderRadius)
        : borderRadius_ = BorderRadius.circular(25.0);

    //
    return TextFormField(
      maxLines: null,
      initialValue: initialValue,
      textAlign: TextAlign.left,
      cursorColor: Colors.black,
      style: TextStyle(
        fontSize: fieldTextFontSize,
      ),
      decoration: InputDecoration(
        labelText: question,
        contentPadding: EdgeInsets.symmetric(
            vertical: verticalTextPadding ?? 10,
            horizontal: horizontalTextPadding ?? 6),
        errorBorder: OutlineInputBorder(
          borderRadius: borderRadius_,
          borderSide: const BorderSide(color: Colors.red),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: borderRadius_,
          borderSide: const BorderSide(color: Colors.white),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: borderRadius_,
          borderSide: const BorderSide(color: Colors.white),
        ),
        border: OutlineInputBorder(
          borderRadius: borderRadius_,
          borderSide: const BorderSide(color: Colors.white),
        ),
        labelStyle: labelTextStyle ??
            TextStyle(fontSize: fieldTextFontSize, color: Colors.grey[700]),
        suffixIcon: icon != null ? icon : null,
        filled: true,
        fillColor: Colors.grey[200],
      ),
      validator: (String? value) {
        if (value!.trim().isEmpty && !canBeNull) {
          return 'Required';
        }
        return null;
      },
      onSaved: (String? val) {
        formKey.currentState?.validate();
        onSavedCallback(val.toString());
      },
    );
  }
}
