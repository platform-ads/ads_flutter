import 'package:core/extension/ui_helper.dart';
import 'package:core/utils/system_colors.dart';
import 'package:flutter/material.dart';

class StyledButton extends StatelessWidget {
  final String? text;
  final Function? action;
  final bool enabled;
  final bool usesInfinityWidth;
  final bool wrapContentWidth;
  final Color textColor;
  final Color backgroundColor;
  final Color outlineColor;
  final double fontSize;
  final double borderRadius;
  final TextAlign? textAlign;
  final TextStyle? textStyle;
  final Color? shadowColor;

  const StyledButton({
    super.key,
    this.text,
    this.action,
    this.enabled = true,
    this.usesInfinityWidth = false,
    this.textColor = SystemColors.lightest,
    this.backgroundColor = SystemColors.blueMedium,
    this.outlineColor = Colors.transparent,
    this.wrapContentWidth = false,
    this.fontSize = 14,
    this.borderRadius = 12,
    this.textAlign,
    this.textStyle,
    this.shadowColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: shadowColor != null ? shadowColor!.withOpacity(0.24) : Colors.transparent,
            offset: const Offset(0, 10),
            blurRadius: 30,
            spreadRadius: 0,
          )
        ],
      ),
      height: 60,
      width: wrapContentWidth
          ? null
          : usesInfinityWidth
              ? double.infinity
              : context.height * 1 - 64,
      child: TextButton(
        onPressed: _buttonAction() as void Function()?,
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(borderRadius))),
          side: BorderSide(color: outlineColor),
          foregroundColor: textColor,
          backgroundColor: _buttonAction() != null ? backgroundColor : SystemColors.lightest,
          textStyle: textStyle ??
              TextStyle(
                color: enabled ? textColor : SystemColors.darkest,
                fontSize: fontSize,
                fontWeight: FontWeight.w700,
              ),
        ),
        child: Text(
          text ?? '',
          textAlign: textAlign,
        ),
      ),
    );
  }

  Function? _buttonAction() {
    return enabled ? action : null;
  }
}
