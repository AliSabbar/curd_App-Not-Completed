import 'package:flutter/material.dart';

Widget defaultTextField({
  required String labelText,
  required String hintText,
  required Widget prefixIcon,
  required TextEditingController? controller,
  Widget? suffixIcon,
  TextInputType? keyboardType,
  bool obscureText = false,
  bool readOnly = false,
  bool enableInteractiveSelection = true,
  required String? Function(String?) validator,
  Function(String)? onChanged,
  ValueChanged<String>? onFieldSubmitted,
  VoidCallback? onTap,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    child: TextFormField(
      readOnly: readOnly,
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      cursorHeight: 20,
      autofocus: false,
      validator: validator,
      onChanged: onChanged,
      onTap: onTap,
      onFieldSubmitted: onFieldSubmitted,
      enableInteractiveSelection: enableInteractiveSelection,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Colors.grey,
          ),
        ),
      ),
    ),
  );
}