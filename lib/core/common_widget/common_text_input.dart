import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';

class CommonTextInput extends StatelessWidget {
  final String label;
  final BoxDecoration? decoration;
  final String hintText;
  final TextInputType inputType;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final void Function(String)? onSaved;
  final void Function(String)? onSubmit;
  final TextInputAction? nextAction;
  final bool? isBorder;
  final int? maxLines;
  final TextStyle? hintTextStyle;
  final int? maxLength;
  final Widget? prefix;
  final bool? isApplyInputFormatters;
  final bool? enabled;
  final bool isRequired;
  const CommonTextInput({
    Key? key,
    required this.label,
    this.decoration,
    required this.hintText,
    required this.inputType,
    this.validator,
    this.controller,
    this.onSaved,
    this.onSubmit,
    this.nextAction,
    this.isBorder,
    this.maxLines,
    this.hintTextStyle,
    this.maxLength,
    this.isRequired = false,
    this.prefix,
    this.isApplyInputFormatters,
    this.enabled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          enabled: enabled,
          keyboardType: inputType,
          cursorColor: AppColors.color707070,
          controller: controller,
          decoration: InputDecoration(
            prefix: prefix,
            label: Row(
              children: [
                Text(
                  label,
                  style: const TextStyle(color: AppColors.color707070),
                ),
                if (isRequired)
                  Icon(
                    Icons.star,
                    color: Colors.red,
                    size: 10,
                  )
              ],
            ),
            // enabledBorder: const OutlineInputBorder(
            //     borderSide: BorderSide(color: AppColors.color707070)),
            // focusedBorder: const OutlineInputBorder(
            //   borderSide: BorderSide(color: AppColors.color707070),
            // ),
          ),
          onChanged: onSaved,
        ),
      ],
    );
  }
}
