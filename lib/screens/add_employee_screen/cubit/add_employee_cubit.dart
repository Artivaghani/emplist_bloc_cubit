import 'package:arti_vaghani/config/config_packages.dart';

class AddEmployeeCubit extends Cubit<AddEmployeeState> {
  AddEmployeeCubit()
      : super(AddEmployeeState(
            sDate: AppConst.todayHint,
            eDate: AppConst.noDateHint,
            selectedRole: AppConst.selectRoleHint));

  TextEditingController nameController = TextEditingController();

  EmployeeModel? edata;

  changeEmployeeRole(String value) {
    emit(state.copyWith(seleRole: value));
  }

  editData(dynamic value) {
    if (value != null) {
      edata = value as EmployeeModel;
      nameController.text = edata!.name;
      emit(state.copyWith(
          seleRole: edata!.employeeRole,
          startDate: edata!.startDate,
          endDate: edata!.endDate));
    } else {
      nameController.clear();
      emit(state.copyWith(
          seleRole: AppConst.selectRoleHint,
          startDate: AppConst.todayHint,
          endDate: AppConst.noDateHint));
    }
  }

  updateStartDate(
    String olddate, {
    isStart = true,
  }) {
    DateTime newDate = DateTime.now();

    int dateType = 0;
    if (isStart) {
      DateTime dateTime = DateTime.parse(olddate);
      DateTime mDate = newDate.next(DateTime.monday);
      DateTime tDate = newDate.next(DateTime.tuesday);
    
      if (dateTime.day == newDate.day &&
          dateTime.year == newDate.year &&
          dateTime.month == newDate.month) {
        dateType = 0;
      } else if (dateTime.isAfter(DateTime.now().add(
        const Duration(days: 7),
      ))) {
        dateType = 3;
      } else if (dateTime.day == mDate.day &&
          dateTime.year == mDate.year &&
          dateTime.month == mDate.month) {
        dateType = 1;
      } else if (dateTime.day == tDate.day &&
          dateTime.year == tDate.year &&
          dateTime.month == tDate.month) {
        dateType = 2;
      } else {
        dateType = 4;
      }
      emit(state.copyWith(dateType: dateType, selDateTime: dateTime));
    } else {
      if (olddate == AppConst.noDateHint) {
        dateType = 0;
        emit(state.copyWith(
          dateType: dateType,
        ));
      } else {
        DateTime dateTime = DateTime.parse(olddate);
        if (dateTime.day == newDate.day &&
            dateTime.year == newDate.year &&
            dateTime.month == newDate.month) {
          dateType = 1;
          emit(state.copyWith(dateType: dateType, selDateTime: DateTime.now()));
        } else {
          dateType = 2;
          emit(state.copyWith(dateType: dateType, selDateTime: dateTime));
        }
      }
    }
  }

  finalStartDate() {
    emit(state.copyWith(startDate: state.selectedDate.toString()));
  }

  finalEndDate() {
    emit(state.copyWith(
        endDate: state.type == 0
            ? AppConst.noDateHint
            : state.selectedDate.toString()));
  }

  updateNewDate(int type, {bool isStart = true}) {
    if (isStart) {
      if (type == 0) {
        emit(state.copyWith(selDateTime: DateTime.now(), dateType: type));
      } else if (type == 1) {
        emit(state.copyWith(
            selDateTime: DateTime.now().next(DateTime.monday), dateType: type));
      } else if (type == 2) {
        emit(state.copyWith(
            selDateTime: DateTime.now().next(DateTime.tuesday),
            dateType: type));
      } else if (type == 3) {
        emit(state.copyWith(
            selDateTime: DateTime.now().add(
              const Duration(days: 8),
            ),
            dateType: type));
      }
    } else {
      if (type == 0) {
        emit(state.copyWith(selDateTime: DateTime.now(), dateType: type));
      } else if (type == 1) {
        emit(state.copyWith(selDateTime: DateTime.now(), dateType: type));
      }
    }
  }

  addEmployee(BuildContext context) {
    if (nameController.text.isEmpty ||
        state.selectedRole == AppConst.selectRoleHint) {
      AppDialog.shoErrorMsg(context);
    } else {
      List<EmployeeModel> modelList = StorageHelper().getEmployeeList;
      String? startDate = (state.sDate == AppConst.todayHint)
          ? DateTime.now().toString()
          : state.sDate;
      EmployeeModel newEmployee = EmployeeModel(
          id: AppConst.isEdit ? edata!.id : (modelList.length + 1).toString(),
          name: nameController.text,
          startDate: startDate ?? '',
          endDate: state.eDate ?? '',
          employeeRole: state.selectedRole ?? '');
      if (AppConst.isEdit) {
        modelList[modelList.indexWhere((element) => element.id == edata!.id)] =
            newEmployee;
      } else {
        modelList.add(newEmployee);
      }
      StorageHelper().saveEmployeeList = modelList;
      context.read<EmployeeCubit>().loadEmployeeData();
      Navigator.pop(context);
      AppDialog.shoSuccessMsg(context,AppConst.isEdit? AppString.editMsg: AppString.addMsg);
    }
  }
}
