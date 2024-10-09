import 'package:code_bar_reader_base/core/theme/components/custom_button/custom_button_type_enum.dart';
import 'package:code_bar_reader_base/core/theme/components/custom_snackbar/custom_snackbar.dart';
import 'package:code_bar_reader_base/core/theme/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final CustomButtonTypeEnum buttonType;
  final Widget? leftWidget;
  final IconData? leftIcon;
  final IconData? rightIcon;
  final String text;
  final VoidCallback? onPressed;
  final double width;
  final bool isLoading;
  final bool? networkIsRequired;

  const CustomButton.primary({
    super.key,
    this.leftWidget,
    this.leftIcon,
    this.rightIcon,
    required this.text,
    this.onPressed,
    this.width = double.infinity,
    this.isLoading = false,
    this.networkIsRequired,
  }) : buttonType = CustomButtonTypeEnum.primary;

  const CustomButton.secondary({
    super.key,
    this.leftWidget,
    this.leftIcon,
    this.rightIcon,
    required this.text,
    this.onPressed,
    this.width = double.infinity,
    this.isLoading = false,
    this.networkIsRequired,
  }) : buttonType = CustomButtonTypeEnum.secondary;

  const CustomButton.negative({
    super.key,
    this.leftWidget,
    this.leftIcon,
    this.rightIcon,
    required this.text,
    this.onPressed,
    this.width = double.infinity,
    this.isLoading = false,
    this.networkIsRequired,
  }) : buttonType = CustomButtonTypeEnum.negative;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> with CustomSnackBar {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: widget.width,
      decoration: BoxDecoration(
        color: isDisabled
            ? widget.buttonType.disabledColor
            : widget.buttonType.backgroundColor,
        border: Border.all(
            color: isDisabled
                ? widget.buttonType.disabledColor
                : widget.buttonType.borderColor,
            width: 1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: widget.buttonType.splashColor,
          highlightColor: widget.buttonType.splashColor,
          borderRadius: BorderRadius.circular(8),
          onTap: widget.isLoading ? null : () => widget.onPressed?.call(),
          child: widget.isLoading
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 24,
                      width: 24,
                      child: CircularProgressIndicator(
                        strokeWidth: 1.2,
                        color: widget.buttonType.progressIndicatorColor,
                      ),
                    ),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (widget.leftWidget != null) ...[
                      SizedBox(
                        height: 24,
                        width: 24,
                        child: widget.leftWidget!,
                      ),
                      const SizedBox(width: 8.0),
                    ],
                    if (widget.leftIcon != null) ...[
                      Icon(
                        widget.leftIcon!,
                        color: isDisabled
                            ? AppTextStyle.disabledButtonText.color
                            : widget.buttonType.textStyle.color,
                        size: 20,
                      ),
                      const SizedBox(width: 8.0),
                    ],
                    Text(
                      widget.text,
                      style: isDisabled
                          ? AppTextStyle.disabledButtonText
                          : widget.buttonType.textStyle,
                    ),
                    if (widget.rightIcon != null) ...[
                      const SizedBox(width: 8.0),
                      Icon(
                        widget.rightIcon!,
                        color: isDisabled
                            ? AppTextStyle.disabledButtonText.color
                            : widget.buttonType.textStyle.color,
                        size: 20,
                      ),
                    ],
                  ],
                ),
        ),
      ),
    );
  }

  bool get isDisabled => widget.onPressed == null;
}
