import 'package:arti_vaghani/config/config_packages.dart';

class AddEmployeeScreen extends StatefulWidget {
  const AddEmployeeScreen({super.key});

  @override
  State<AddEmployeeScreen> createState() => _AddEmployeeScreenState();
}

class _AddEmployeeScreenState extends State<AddEmployeeScreen> {
  dynamic employeeData;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      employeeData = ModalRoute.of(context)!.settings.arguments;
      context.read<AddEmployeeCubit>().editData(employeeData);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppWidgets.commonAppBar(
          context,
          AppConst.isEdit
              ? AppString.editemployeeList
              : AppString.addemployeeList,
          actions: AppConst.isEdit
              ? InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    EmployeeModel edata = employeeData as EmployeeModel;
                    context
                        .read<EmployeeCubit>()
                        .removeEmployee(context, edata.id);
                  },
                  child: Image.asset(
                    AppAssets.icDelete,
                    height: AppDimen.dimen15,
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                )
              : null),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: AppDimen.dimen20, vertical: AppDimen.dimen20),
              child: ListView(children: [
                AppWidgets.commonFieldView(
                    context, employeeNameView(context), AppAssets.icPerson),
                SizedBox(
                  height: AppDimen.dimen16,
                ),
                employeeRole(),
                SizedBox(
                  height: AppDimen.dimen16,
                ),
                BlocBuilder<AddEmployeeCubit, AddEmployeeState>(
                  builder: (context, state) {
                    return Row(
                      children: [
                        Expanded(
                          child: InkWell(
                              onTap: () {
                                FocusScope.of(context).unfocus();
                                String olddate =
                                    state.sDate == AppConst.todayHint
                                        ? DateTime.now().toString()
                                        : state.sDate ?? '';
                                showDialog(
                                  context: context,
                                  builder: (_) => Dialog(
                                      backgroundColor: Colors.transparent,
                                      child:
                                          CalenderDialogView(oldDate: olddate)),
                                );
                              },
                              child: AppWidgets.commonFieldView(
                                  context,
                                  AppWidgets.employeesDate(
                                      context,
                                      AppFunctions.getDateString(
                                          state.sDate ?? '')),
                                  AppAssets.icDate)),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: AppDimen.dimen10),
                          child: Image.asset(
                            AppAssets.icArrow,
                            width: AppDimen.dimen20,
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              FocusScope.of(context).unfocus();
                              showDialog(
                                context: context,
                                builder: (_) => Dialog(
                                    backgroundColor: Colors.transparent,
                                    child: CalenderDialogView(
                                      oldDate: state.eDate ?? '',
                                      isStart: false,
                                    )),
                              );
                            },
                            child: AppWidgets.commonFieldView(
                              context,
                              AppWidgets.employeesDate(
                                  context,
                                  AppFunctions.getDateString(state.eDate ?? '',
                                      isStart: false),
                                  style: state.eDate == AppConst.noDateHint
                                      ? Theme.of(context)
                                          .textTheme
                                          .displayMedium
                                      : null),
                              AppAssets.icDate,
                            ),
                          ),
                        )
                      ],
                    );
                  },
                )
              ]),
            ),
          ),
          AppWidgets.devider,
          getBottomView(context)
        ],
      ),
    );
  }

  employeeNameView(BuildContext context) =>
      BlocBuilder<AddEmployeeCubit, AddEmployeeState>(
        builder: (context, state) {
          return TextFormField(
            keyboardType: TextInputType.text,
            style: Theme.of(context).textTheme.bodyLarge,
            controller: context.read<AddEmployeeCubit>().nameController,
            decoration: InputDecoration(
                hintStyle: Theme.of(context).textTheme.displayMedium,
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                isDense: true,
                contentPadding:
                    const EdgeInsets.only(left: 0, bottom: 0, top: 0, right: 0),
                hintText: AppString.nameHint),
          );
        },
      );

  employeeRole() => BlocBuilder<AddEmployeeCubit, AddEmployeeState>(
        builder: (context, state) {
          return InkWell(
            onTap: () {
              FocusScope.of(context).unfocus();
              showModalBottomSheet<void>(
                context: context,
                backgroundColor: Colors.transparent,
                builder: (BuildContext context1) {
                  return Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10))),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: AppConst.roleList
                          .asMap()
                          .entries
                          .map((e) => InkWell(
                                onTap: () {
                                  context
                                      .read<AddEmployeeCubit>()
                                      .changeEmployeeRole(e.value);
                                  Navigator.pop(context1);
                                },
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: AppDimen.dimen20),
                                      child: Text(
                                        e.value,
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelSmall,
                                      ),
                                    ),
                                    AppWidgets.devider
                                  ],
                                ),
                              ))
                          .toList(),
                    ),
                  );
                },
              );
            },
            child: AppWidgets.commonFieldView(
                context,
                Row(
                  children: [
                    Expanded(
                        child: Text(
                      state.selectedRole ?? '',
                      style: state.selectedRole == AppConst.selectRoleHint
                          ? Theme.of(context).textTheme.displayMedium
                          : Theme.of(context).textTheme.bodyLarge,
                    )),
                    Image.asset(
                      AppAssets.icDownArrow,
                      height: AppDimen.dimen8,
                    )
                  ],
                ),
                AppAssets.icBag),
          );
        },
      );

  getBottomView(BuildContext context) => Padding(
        padding: EdgeInsets.symmetric(
            vertical: AppDimen.dimen16, horizontal: AppDimen.dimen16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              width: AppDimen.dimen90,
              height: AppDimen.dimen40,
              child: CommonButton(
                title: AppString.cancel,
                backColor: Theme.of(context).primaryColor.withOpacity(0.2),
                textColor: Theme.of(context).primaryColor,
                onPressed: () => Navigator.pop(context),
              ),
            ),
            SizedBox(
              width: AppDimen.dimen16,
            ),
            SizedBox(
              width: AppDimen.dimen90,
              height: AppDimen.dimen40,
              child: CommonButton(
                title: AppString.save,
                backColor: Theme.of(context).primaryColor,
                textColor: AppColors.white,
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  context.read<AddEmployeeCubit>().addEmployee(context);
                },
              ),
            )
          ],
        ),
      );
}
