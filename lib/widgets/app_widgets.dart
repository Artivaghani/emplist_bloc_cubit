import 'package:arti_vaghani/config/config_packages.dart';

class AppWidgets {
  static AppBar commonAppBar(BuildContext context, String title,
          {Widget? actions}) =>
      AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          title,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        actions: [
          if (actions != null)
            Container(
                width: AppDimen.dimen20,
                margin: EdgeInsets.symmetric(horizontal: AppDimen.dimen20),
                child: actions)
        ],
      );

  static Widget employeesDate(BuildContext context, String title,
          {TextStyle? style}) =>
      Text(
        title,
        style: style ?? Theme.of(context).textTheme.bodyLarge,
      );

  static Widget get devider => Container(
        width: double.infinity,
        height: 0.2,
        color: AppColors.greyColor,
      );

  static Widget commonFieldView(
          BuildContext context, Widget child, String icon) =>
      Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: Theme.of(context).hintColor)),
        padding: EdgeInsets.symmetric(
            horizontal: AppDimen.dimen10, vertical: AppDimen.dimen12),
        child: Row(
          children: [
            Image.asset(
              icon,
              height: AppDimen.dimen20,
            ),
            Expanded(
                child: Padding(
              padding: EdgeInsets.only(left: AppDimen.dimen12),
              child: child,
            ))
          ],
        ),
      );
}
