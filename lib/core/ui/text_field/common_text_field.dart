import 'package:flutter/material.dart';
import 'package:setup_structure/res/app_context_extension.dart';

class CommonTextField extends StatelessWidget {
  final String? hintText;
  final String? labelText;
  final String? errorText;
  final bool? isObscure;
  final TextEditingController? controller;
  final Function(String)? onChange;
  final String? Function(String?)? validator;
  final bool isShow;
  final bool isVisible;
  final bool isValid;
  final VoidCallback? toggleVisibility;
  final TextInputType? inputType;

  const CommonTextField({
    super.key,
    this.hintText,
    this.labelText,
    this.errorText,
    this.isObscure,
    this.controller,
    this.onChange,
    this.validator,
    required this.isShow,
    this.isValid = false,
    this.toggleVisibility,
    required this.isVisible,
    this.inputType,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: inputType ?? TextInputType.text,
      validator: validator,
      onChanged: onChange,
      controller: controller,
      obscureText: isObscure!,
      textDirection: TextDirection.ltr,
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
          isDense: true,
          contentPadding:
          const EdgeInsets.only(left: 12, top: 0, bottom: 0, right: 0),
          errorStyle: const TextStyle(
            fontSize: 12,
          ),
          border: InputBorder.none,
          alignLabelWithHint: true,
          hintText: hintText,
          labelText: labelText,
          hintStyle: context.resources.style.w500s14(context.resources.color.grey350),
          floatingLabelStyle: context.resources.style.w500s14(context.resources.color.primaryColor),
          errorText: errorText ?? '',
          prefixIconConstraints: const BoxConstraints(maxWidth: 40),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: context.resources.color.black200,
              width: 1,
              style: BorderStyle.solid,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color:
              isValid ? context.resources.color.primaryColor : context.resources.color.red700,
              width: 1,
              style: BorderStyle.solid,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: context.resources.color.black200,
              width: 1,
              style: BorderStyle.solid,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: context.resources.color.black900,
              width: 1,
              style: BorderStyle.solid,
            ),
          ),
          suffixIcon: isShow
              ? GestureDetector(
            onTap: toggleVisibility,
            behavior: HitTestBehavior.translucent,
            child: VisibilityIcon(
              isVisible: isVisible,
            ),
          )
              : const SizedBox.shrink()),
    );
  }
}

class VisibilityIcon extends StatelessWidget {
  final bool? isVisible;

  const VisibilityIcon({super.key, this.isVisible});

  @override
  Widget build(BuildContext context) {
    return isVisible!
        ? FittedBox(
      alignment: Alignment.center,
      fit: BoxFit.scaleDown,
      child: Image.asset(
        context.resources.drawable.google,
        // AssetConstants.invisibility,
        height: 24,
        width: 24,
      ),
    )
        : FittedBox(
      alignment: Alignment.center,
      fit: BoxFit.scaleDown,
      child: Image.asset(
        context.resources.drawable.google,
        // AssetConstants.visibility,
        height: 24,
        width: 24,
      ),
    );
  }
}
