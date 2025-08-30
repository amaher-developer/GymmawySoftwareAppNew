import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

import '../consts/input_style.dart';
import '../consts/text_styles.dart';
import '../managers/color_manager.dart';

class TextFieldWidget extends StatefulWidget {
  FocusNode? focusNode;
  FocusNode? nextNode;
  TextEditingController? controller;
  TextInputType? textInputType;
  String? label;
  String? hint;
  String? error;
  bool isPassword;
  Widget? prefixIcon;
  Widget? suffixIcon;
  bool? obscureText;
  double? width;
  bool? isLabelOutside;
  bool? readOnly;
  Function(BuildContext)? onTap;
  bool? filled;
  bool? autoErrorMessage;

  int? maxLines;
  bool? enabled;
  final Function(String)? onSubmitted;
  Function(String value)? onChange;

  TextFieldWidget({super.key,
    this.focusNode,
    this.controller,
    this.label,
    this.isPassword = false,
    this.hint,
    this.filled,
    this.width,
    this.onTap,
    this.isLabelOutside = false,
    this.readOnly = false,
    this.textInputType,
    this.nextNode,
    this.error,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText,
    this.autoErrorMessage = false,
    this.onChange,
    this.maxLines,
    this.onSubmitted,
    this.enabled,
  });

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Column(
        children: [
          widget.isLabelOutside == true
              ? Container(
            width: widget.width ?? 0.8.sw,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(
                    widget.label == null ? "" : widget.label!.tr(),
                    style: AppTextStyle.black_18BOLD.copyWith(
                      fontSize: 16.sp,
                      color: LightColors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          )
              : Container(),
          Container(
            width: widget.width ?? widget.width ?? 0.8.sw,
            child: TextField(
              maxLines: widget.maxLines ?? 1,
              onTap: widget.onTap == null
                  ? null
                  : () {
                if (widget.onTap != null) {
                  widget.onTap!(context);
                }
              },
              readOnly: widget.readOnly ?? false,
              obscureText: widget.obscureText == true ? true : false ?? false,
              obscuringCharacter: '*',
              style: AppTextStyle.black_16.copyWith(
                color: LightColors.black.withOpacity(0.8),
              ),
              focusNode: widget.focusNode,
              controller: widget.controller,
              keyboardType: widget.textInputType ?? TextInputType.text,
              textInputAction: TextInputAction.done,
              cursorColor: LightColors.grey,
              enabled: widget.enabled,
              decoration: AppInputStyle.textFieldDecoration(
                filled: false,
                hintText: widget.hint == null ? "" : widget.hint?.tr(),
                // labelText: label?.tr(),
                errorText: widget.error == null
                    ? null
                    : (widget.autoErrorMessage ?? false)
                    ? "${'generalError'.tr()} ${widget.label!.tr()}"
                    : widget.error,
                prefixIcon: widget.prefixIcon,
                suffixIcon: widget.isPassword
                    ?
                // eye icon to show and hide password
                IconButton(
                  icon: Icon(
                    widget.obscureText == true
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color: LightColors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      widget.obscureText = !widget.obscureText!;
                    });
                  },
                )
                    : widget.suffixIcon,
              ),
              onSubmitted: widget.onSubmitted ??
                      (_) {
                    widget.nextNode == null
                        ? FocusScope.of(context).unfocus()
                        : FocusScope.of(context).requestFocus(widget.nextNode);
                  },
              onChanged: widget.onChange ?? null,
            ),
          ),
        ],
      ),
    );
  }
}