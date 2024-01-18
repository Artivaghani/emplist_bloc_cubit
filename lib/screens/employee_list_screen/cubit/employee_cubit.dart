import 'package:arti_vaghani/config/config_packages.dart';

class EmployeeCubit extends Cubit<EmployeeState> {
  EmployeeCubit() : super(EmployeeInitial());

  void loadEmployeeData() async {
    emit(EmployeeLoading());
    try {
      List<EmployeeModel> modelList = StorageHelper().getEmployeeList;
      emit(EmployeeLoaded(events: modelList));
    } catch (e) {
      emit(EmployeeError(message: AppString.errorMsg));
    }
  }

  void removeEmployee(BuildContext context, String id) async {
    List<EmployeeModel> modelList = StorageHelper().getEmployeeList;
    modelList.removeWhere((element) => element.id == id);
    StorageHelper().saveEmployeeList = modelList;
    emit(EmployeeLoaded(events: modelList));
    AppDialog.shoSuccessMsg(context, AppString.deleteMsg);
  }
}
