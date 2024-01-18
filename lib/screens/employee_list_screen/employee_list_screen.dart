import 'package:arti_vaghani/config/config_packages.dart';

class EmployeeScreen extends StatelessWidget {
  const EmployeeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<EmployeeCubit>().loadEmployeeData();
    return Scaffold(
        appBar: AppWidgets.commonAppBar(context, AppString.employeeList),
        backgroundColor: Theme.of(context).cardColor,
        body: BlocBuilder<EmployeeCubit, EmployeeState>(
          builder: (context, state) {
            if (state is EmployeeError) {
              return Center(child: Text(state.message));
            } else if (state is EmployeeLoaded) {
              return getEmployeeList(context, state.events);
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
        floatingActionButton: InkWell(
          onTap: () {
            AppConst.isEdit = false;
            Navigator.pushNamed(
              context,
              NamedRoutes.addEmployeeScreen,
            );
          },
          child: Container(
            width: AppDimen.dimen55,
            height: AppDimen.dimen55,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).primaryColor),
            child: Center(
                child: Icon(
              Icons.add,
              color: Theme.of(context).scaffoldBackgroundColor,
            )),
          ),
        ) //FloatingActionButton(

        );
  }
}

getEmployeeList(BuildContext context, List<EmployeeModel> events) {
  DateTime todayDate = DateTime.now();
  List<EmployeeModel> currentEmployee = events
      .where((element) => (element.endDate == AppConst.noDateHint ||
          DateTime.parse(element.endDate).isAfter(todayDate)))
      .toList();
  List<EmployeeModel> previousEmployee = events
      .where((element) => (element.endDate != AppConst.noDateHint &&
          DateTime.parse(element.endDate).isBefore(todayDate)))
      .toList();

  return events.isEmpty
      ? Center(
          child: Image.asset(
          AppAssets.dataNotFOund,
          height: AppDimen.dimen250,
        ))
      : ListView(children: [
          Visibility(
            visible: currentEmployee.isNotEmpty,
            child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: AppDimen.dimen16, horizontal: AppDimen.dimen20),
                child: Text(
                  AppString.currentEmployee,
                  style: Theme.of(context).textTheme.headlineMedium,
                )),
          ),
          Visibility(
            visible: currentEmployee.isNotEmpty,
            child: Container(
              color: Theme.of(context).scaffoldBackgroundColor,
              width: double.infinity,
              child: ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: currentEmployee
                    .asMap()
                    .entries
                    .map((e) =>
                        EmployeeCard(currentEmployee: currentEmployee[e.key]))
                    .toList(),
              ),
            ),
          ),
          Visibility(
            visible: previousEmployee.isNotEmpty,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: AppDimen.dimen16, horizontal: AppDimen.dimen20),
              child: Text(
                AppString.previousEmployee,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
          ),
          Visibility(
            visible: previousEmployee.isNotEmpty,
            child: Container(
              color: Theme.of(context).scaffoldBackgroundColor,
              width: double.infinity,
              child: ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: previousEmployee
                    .asMap()
                    .entries
                    .map((e) => EmployeeCard(
                          currentEmployee: previousEmployee[e.key],
                          isCurrent: false,
                        ))
                    .toList(),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: AppDimen.dimen8, horizontal: AppDimen.dimen20),
            child: Text(
              AppString.swipMsg,
              style: Theme.of(context).textTheme.displaySmall,
            ),
          ),
        ]);
}
