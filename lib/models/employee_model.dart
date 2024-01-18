class EmployeeModel {
  EmployeeModel({
    required this.id,
    required this.name,
    required this.startDate,
    required this.endDate,
    required this.employeeRole,
  });

  String id;
  String name;
  String startDate;
  String endDate;
  String employeeRole;

  factory EmployeeModel.fromJson(Map<String, dynamic> json) => EmployeeModel(
        id: json["id"],
        name: json["name"],
        startDate: json["startDate"],
        endDate: json["endDate"],
        employeeRole: json["employeeRole"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "startDate": startDate,
        "endDate": endDate,
        "employeeRole": employeeRole,
      };
}
