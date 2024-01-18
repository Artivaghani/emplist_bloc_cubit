import 'package:arti_vaghani/config/config_packages.dart';

class CommonButton extends StatelessWidget {
  final Function() onPressed;
  final String title;
  final Color? textColor;
  final Color? backColor;
  const CommonButton(
      {super.key,
      required this.title,
      required this.onPressed,
      this.textColor,
      this.backColor});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimen.dimen6),
          ),
          elevation: 0,
          backgroundColor: backColor ?? AppColors.primaryColor,
          foregroundColor: textColor ?? Colors.white,
          textStyle: TextStyle(
              color: textColor ?? Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500)),
      child: FittedBox(fit: BoxFit.scaleDown, child: Text(title)),
    );
  }
}
