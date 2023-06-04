import 'package:dental_crm_flutter_front/utils/utils.dart';
import 'package:flutter/material.dart';

class FormButton extends StatelessWidget {
  const FormButton({
    super.key,
    required this.text,
    this.color,
    this.onTap,
    this.textColor,
  });

  final String text;
  final Color? color;
  final Color? textColor;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16.0),
        child: Ink(
          padding: const EdgeInsets.symmetric(horizontal: 70.0, vertical: 18.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            color: color,
          ),
          child: Text(
            text,
            style: AppStyles.ralewayStyle.copyWith(
              fontSize: 20.0,
              color: textColor ?? AppColors.whiteColor,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
