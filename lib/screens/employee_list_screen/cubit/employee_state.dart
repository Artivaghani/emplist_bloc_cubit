import 'package:arti_vaghani/config/config_packages.dart';

abstract class EmployeeState {}

class EmployeeInitial extends EmployeeState {}

class EmployeeLoading extends EmployeeState {}

class EmployeeLoaded extends EmployeeState {
  final List<EmployeeModel> events;

  EmployeeLoaded({required this.events});
}

class EmployeeError extends EmployeeState {
  final String message;

  EmployeeError({required this.message});
}
