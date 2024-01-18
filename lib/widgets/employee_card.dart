import 'package:arti_vaghani/config/config_packages.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class EmployeeCard extends StatelessWidget {
  final EmployeeModel currentEmployee;
  final bool isCurrent;
  const EmployeeCard(
      {super.key, required this.currentEmployee, this.isCurrent = true});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        AppConst.isEdit=true;
        Navigator.pushNamed(
          arguments: currentEmployee,
          context,
          NamedRoutes.addEmployeeScreen,
        );
      },
      child: Slidable(
        endActionPane: ActionPane(
          extentRatio: 0.2,
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              spacing: 1,
              onPressed: doNothing,
              backgroundColor: AppColors.redColor,
              foregroundColor: AppColors.white,
              icon: Icons.delete,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: AppDimen.dimen12, horizontal: AppDimen.dimen16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    currentEmployee.name,
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.labelSmall!.copyWith(fontWeight: FontWeight.w600),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: AppDimen.dimen6),
                    child: Text(
                      currentEmployee.employeeRole,
                      textAlign: TextAlign.start,
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                  ),
                  Text(
                    isCurrent
                        ? 'From ${AppFunctions.getDate(currentEmployee.startDate)}'
                        : '${AppFunctions.getDate(currentEmployee.startDate)} - ${AppFunctions.getDate(currentEmployee.endDate)}',
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                ],
              ),
            ),
            AppWidgets.devider
          ],
        ),
      ),
    );
  }

  doNothing(BuildContext context) {
    context.read<EmployeeCubit>().removeEmployee(context,currentEmployee.id);
  }
}
