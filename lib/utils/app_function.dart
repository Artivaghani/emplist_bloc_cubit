import 'package:arti_vaghani/config/config_packages.dart';
import 'package:intl/intl.dart';

class AppFunctions {
  static String getDate(String newDate) {
    DateTime date = DateTime.parse(newDate);
    return DateFormat("dd MMM, yyyy").format(date);
  }

  static String getFormateDate(String newDate) {
    DateTime date = DateTime.parse(newDate);
    return DateFormat("dd MMM yyyy").format(date);
  }

  static String getDateString(String newDate, {bool isStart = true}) {
    DateTime nDate = DateTime.now();
    if (isStart) {
      if (newDate == AppConst.todayHint) {
        return AppConst.todayHint;
      } else {
        DateTime date = DateTime.parse(newDate);

        if(date.day == nDate.day && date.year == nDate.year && date.month == nDate.month)
        {
         return AppConst.todayHint;
        }
        
      }
    }else{
       if (newDate == AppConst.noDateHint) {
        return AppConst.noDateHint;
      } else {
        DateTime date = DateTime.parse(newDate);

        if (date.day == nDate.day && date.year == nDate.year && date.month == nDate.month) {
          return AppConst.todayHint;
        }
      }
    }

    return DateFormat("dd MMM yyyy").format(DateTime.parse(newDate));
  }
}
