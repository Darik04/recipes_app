import 'package:recipes_app/constants/colors/color_styles.dart';
import 'package:recipes_app/constants/texts/text_styles.dart';
import 'package:recipes_app/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class DefaultTextFormField extends StatelessWidget {
  final String hint;
  final String? title;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final Function()? onTap;
  final Function(String? val)? onChange;
  final FocusNode? focusNode;
  final int? maxLines;
  final int? maxLength;
  final bool obscureText;
  final bool isBlack;
  DefaultTextFormField({
    Key? key,
    this.focusNode,
    this.maxLength,
    this.onTap,
    this.onChange,
    this.maxLines,
    required this.hint,
    this.title,
    this.validator,
    this.isBlack = false,
    this.obscureText = false,
    this.controller,
    this.inputFormatters,
    this.keyboardType,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    
    return TextFormField(
      focusNode: focusNode,
      onTap: onTap,
      onChanged: onChange,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      validator: validator,
      controller: controller,
      obscureText: obscureText,
      maxLines: maxLines,
      readOnly: onTap != null,
      style: isBlack ? TextStyles(context).white_20_w700.copyWith(fontWeight: FontWeight.w300) : TextStyles(context).black_20_w300,
      maxLength: maxLength,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
        hintText: hint,
        filled: true,
        counterText: '',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: BorderSide.none,
        ),
        fillColor: isBlack ? ColorStyles.black2 : ColorStyles.white,
        hintStyle: TextStyles(context).grey_20_w700.copyWith(fontWeight: FontWeight.w300)
      ),
    );
  }
}