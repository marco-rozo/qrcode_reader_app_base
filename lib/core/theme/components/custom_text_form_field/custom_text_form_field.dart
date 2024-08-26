import 'package:code_bar_reader_base/core/theme/styles/app_colors.dart';
import 'package:code_bar_reader_base/core/theme/styles/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SoftTextFormField extends StatefulWidget {
  final String? hintText;
  final IconData? prefixIcon;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final bool hasError;
  final TextEditingController textEditingController;
  final bool isDisabled;
  final Function(bool)? onFocusChanged;
  final bool isASearchField;

  const SoftTextFormField({
    super.key,
    this.prefixIcon,
    this.hintText,
    this.keyboardType = TextInputType.text,
    this.inputFormatters,
    this.onChanged,
    this.hasError = false,
    required this.textEditingController,
    this.isDisabled = false,
    this.onFieldSubmitted,
    this.onFocusChanged,
    this.isASearchField = false,
  });

  @override
  State<SoftTextFormField> createState() => _SoftTextFormFieldState();
}

class _SoftTextFormFieldState extends State<SoftTextFormField> {
  FocusNode? focusNode;
  final double borderRadius = 8;

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode()
      ..addListener(() => widget.onFocusChanged?.call(focusNode!.hasFocus));
  }

  @override
  void dispose() {
    focusNode?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        boxShadow: [
          BoxShadow(
            color: AppColors.secondaryLight.withOpacity(0.1),
            spreadRadius: 0,
            blurRadius: 10,
            offset: const Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child: TextFormField(
        onFieldSubmitted: widget.onFieldSubmitted,
        enabled: !widget.isDisabled,
        canRequestFocus: !widget.isDisabled,
        focusNode: focusNode,
        controller: widget.textEditingController,
        inputFormatters: widget.inputFormatters,
        style: AppTextStyle.body14Primary,
        cursorColor: AppTextStyle.body14Primary.color,
        keyboardType: widget.keyboardType,
        textInputAction: widget.isASearchField ? TextInputAction.search : null,
        onChanged: (newValue) => setState(() {
          widget.onChanged?.call(newValue);
        }),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: widget.hintText,
          hintStyle: AppTextStyle.body14Secondary.copyWith(
            color: AppTextStyle.body14Secondary.color?.withOpacity(0.7),
          ),
          prefixIcon: widget.prefixIcon != null
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Icon(
                    widget.prefixIcon,
                    color: AppColors.secondaryLight.withOpacity(0.7),
                  ),
                )
              : null,
          suffixIcon: widget.isASearchField &&
                  widget.textEditingController.text.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: InkWell(
                    onTap: () {
                      widget.textEditingController.clear();
                      widget.onChanged?.call('');
                      widget.onFieldSubmitted?.call('');
                      setState(() {});
                      focusNode?.requestFocus();
                    },
                    child: Icon(
                      Icons.close,
                      color: AppColors.secondaryLight.withOpacity(0.7),
                    ),
                  ),
                )
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide(
              color: widget.hasError
                  ? AppColors.negative.withOpacity(0.5)
                  : AppColors.primary.withOpacity(0.5),
              width: 1,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
