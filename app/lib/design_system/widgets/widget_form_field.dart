
import 'package:flutter/material.dart';
import 'package:rei_da_bola/design_system/colors/colors_app.dart';

class WidgetFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hint;
  final Widget? prefix;
  final Widget? suffix;
  final bool obscure;
  final TextInputType? textInputType;
  final Function(String)? onChanged;
  final bool enable;

  const WidgetFormField({
    super.key, 
    this.controller, 
    this.hint, 
    this.prefix, 
    this.suffix, 
    required this.obscure, 
    this.textInputType, 
    this.onChanged, 
    required this.enable
  });

  @override
  Widget build(BuildContext context) {
    final colors = ColorsAppDefault();
    return Container(
      width: 300,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: prefix != null ? null : const EdgeInsets.only(left: 16),
      child: TextField(
        controller: controller,
        obscureText: obscure,
        keyboardType: textInputType,
        onChanged: onChanged,
        enabled: enable,
        style: const TextStyle(fontSize: 18),
        decoration: InputDecoration(
          hintText: hint,
          border: InputBorder.none,
          prefixIcon: prefix,
          suffixIcon: suffix,
        ),
        textAlignVertical: TextAlignVertical.center,
      ),
    );
  }
}