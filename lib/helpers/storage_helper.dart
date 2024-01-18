import 'dart:convert';
import 'package:arti_vaghani/config/config_packages.dart';

class StorageHelper {
  get storage => GetStorage();

  List<EmployeeModel> get getEmployeeList {
    List<dynamic> newDate = json.decode(storage.read('employeeList') ?? '[]');
    return List<EmployeeModel>.from(newDate.map((e) => EmployeeModel.fromJson(e)));
  }

  set saveEmployeeList(List<EmployeeModel> employeeList) => storage.write("employeeList", json.encode(List<dynamic>.from(employeeList.map((x) => x.toJson()))));

 
}
