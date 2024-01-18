import 'package:arti_vaghani/config/config_packages.dart';

class AppDialog {
  static shoErrorMsg(BuildContext context, {String? errorMsg}) {
    SnackBar snackdemo = SnackBar(
      content: Text(errorMsg ?? AppString.rquiredMsg),
      backgroundColor: AppColors.redColor,
      elevation: 5,
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(10),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackdemo);
  }

  static shoSuccessMsg(BuildContext context, String? msg) {
    if (msg != null) {
      SnackBar snackdemo = SnackBar(
        content: Text(msg),
        backgroundColor: AppColors.greenColor,
        elevation: 5,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(10),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackdemo);
    }
  }
}
