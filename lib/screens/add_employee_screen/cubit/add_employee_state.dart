import 'package:arti_vaghani/config/config_packages.dart';

class AddEmployeeState extends Equatable {
  final String? sDate;
  final String? eDate;
  final String? selectedRole;
  final DateTime? selectedDate;
  final int? type;

  const AddEmployeeState({this.sDate, this.eDate, this.selectedRole, this.selectedDate, this.type});

  @override
  List<Object?> get props => [sDate, eDate, selectedRole, selectedDate, type];

  AddEmployeeState copyWith({String? startDate, String? endDate, String? seleRole, DateTime? selDateTime, int? dateType}) {
    return AddEmployeeState(
        sDate: startDate ?? sDate, eDate: endDate ?? eDate, selectedRole: seleRole ?? selectedRole, selectedDate: selDateTime ?? selectedDate, type: dateType ?? type);
  }
}
