import 'package:demo/core/constants/num_constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CommonTextFieldWidget extends StatelessWidget {
  const CommonTextFieldWidget(
      {super.key,
      this.hint,
      this.controller,
      this.suffixIcon,
      this.onChanged,
      this.obscureText = false,
      this.bottom,
      this.right,
      this.left,
        this.borderRadius,
      this.top,
      this.prefixIcon});

  final String? hint;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool? obscureText;
  final double? left;
  final double? right;
  final double? top;
  final double? borderRadius;
  final double? bottom;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: left ?? zero,
          right: right ?? zero,
          bottom: bottom ?? zero,
          top: top ?? zero),
      decoration: BoxDecoration(
        color: Colors.white, // <--- change this
        borderRadius: BorderRadius.circular(twenty),
      ),
      child: TextField(
        cursorColor: Colors.black,
        controller: controller,
        autocorrect: false,
        onChanged: onChanged,
        obscureText: obscureText ?? false,
        style: GoogleFonts.roboto(
          fontSize: fourteen,
          color: Colors.black,
        ),
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          hintText: hint,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          hintStyle: GoogleFonts.roboto(
              fontSize: fourteen, color: Colors.grey.withOpacity(zero80)),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius??ten),
            borderSide: BorderSide(
              color: Colors.grey.withOpacity(zero20),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius??ten),
            borderSide: BorderSide(
              color: Colors.grey.withOpacity(zero20),
              width: one,
            ),
          ),
          filled: true,
          // <-- add filled
          fillColor: Colors.white,
          // <--- and this

          border: InputBorder.none,
        ),
      ),
    );
  }
}
