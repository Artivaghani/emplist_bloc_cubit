import 'package:arti_vaghani/config/config_packages.dart';

class CalenderDialogView extends StatelessWidget {
  final bool isStart;
  final String oldDate;
  const CalenderDialogView(
      {super.key, this.isStart = true, required this.oldDate});

  @override
  Widget build(BuildContext context) {
    context.read<AddEmployeeCubit>().updateStartDate(
          oldDate,
          isStart: isStart,
        );

    return BlocBuilder<AddEmployeeCubit, AddEmployeeState>(
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Theme.of(context).scaffoldBackgroundColor),
          padding: EdgeInsets.symmetric(
              vertical: AppDimen.dimen20, horizontal: AppDimen.dimen16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              isStart
                  ? Column(
                      children: [
                        SizedBox(
                          height: AppDimen.dimen40,
                          child: Row(
                            children: [
                              Expanded(
                                child: CommonButton(
                                  title: AppConst.todayHint,
                                  backColor: state.type == 0
                                      ? Theme.of(context).primaryColor
                                      : Theme.of(context)
                                          .primaryColor
                                          .withOpacity(0.1),
                                  textColor: state.type == 0
                                      ? null
                                      : Theme.of(context).primaryColor,
                                  onPressed: () => context
                                      .read<AddEmployeeCubit>()
                                      .updateNewDate(0),
                                ),
                              ),
                              SizedBox(
                                width: AppDimen.dimen20,
                              ),
                              Expanded(
                                child: CommonButton(
                                  title: AppConst.nextMondayHint,
                                  backColor: state.type == 1
                                      ? Theme.of(context).primaryColor
                                      : Theme.of(context)
                                          .primaryColor
                                          .withOpacity(0.1),
                                  textColor: state.type == 1
                                      ? null
                                      : Theme.of(context).primaryColor,
                                  onPressed: () => context
                                      .read<AddEmployeeCubit>()
                                      .updateNewDate(1),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: AppDimen.dimen10,
                        ),
                        SizedBox(
                          height: AppDimen.dimen40,
                          child: Row(
                            children: [
                              Expanded(
                                child: CommonButton(
                                  title: AppConst.nextTuesdayHint,
                                  backColor: state.type == 2
                                      ? Theme.of(context).primaryColor
                                      : Theme.of(context)
                                          .primaryColor
                                          .withOpacity(0.1),
                                  textColor: state.type == 2
                                      ? null
                                      : Theme.of(context).primaryColor,
                                  onPressed: () => context
                                      .read<AddEmployeeCubit>()
                                      .updateNewDate(2),
                                ),
                              ),
                              SizedBox(
                                width: AppDimen.dimen20,
                              ),
                              Expanded(
                                child: CommonButton(
                                  title: AppConst.afterWeekHint,
                                  backColor: state.type == 3
                                      ? Theme.of(context).primaryColor
                                      : Theme.of(context)
                                          .primaryColor
                                          .withOpacity(0.1),
                                  textColor: state.type == 3
                                      ? null
                                      : Theme.of(context).primaryColor,
                                  onPressed: () => context
                                      .read<AddEmployeeCubit>()
                                      .updateNewDate(3),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  : SizedBox(
                      height: AppDimen.dimen40,
                      child: Row(
                        children: [
                          Expanded(
                            child: CommonButton(
                              title: AppConst.noDateHint,
                              backColor: state.type == 0
                                  ? Theme.of(context).primaryColor
                                  : Theme.of(context)
                                      .primaryColor
                                      .withOpacity(0.1),
                              textColor: state.type == 0
                                  ? null
                                  : Theme.of(context).primaryColor,
                              onPressed: () => context
                                  .read<AddEmployeeCubit>()
                                  .updateNewDate(0, isStart: isStart),
                            ),
                          ),
                          SizedBox(
                            width: AppDimen.dimen20,
                          ),
                          Expanded(
                            child: CommonButton(
                              title: AppConst.todayHint,
                              backColor: state.type == 1
                                  ? Theme.of(context).primaryColor
                                  : Theme.of(context)
                                      .primaryColor
                                      .withOpacity(0.1),
                              textColor: state.type == 1
                                  ? null
                                  : Theme.of(context).primaryColor,
                              onPressed: () => context
                                  .read<AddEmployeeCubit>()
                                  .updateNewDate(1, isStart: isStart),
                            ),
                          ),
                        ],
                      ),
                    ),
              SizedBox(
                height: AppDimen.dimen10,
              ),
              Theme(
                data: ThemeData.light().copyWith(
                  colorScheme: const ColorScheme.light(
                    primary: AppColors.primaryColor,
                    onPrimary: AppColors.white,
                    surface: AppColors.white,
                    onSurface: AppColors.black,
                  ),
                ),
                child: CalendarDatePicker(
                  initialDate: state.selectedDate ?? DateTime.now(),
                  firstDate: ((state.selectedDate ?? DateTime.now())
                          .isBefore(DateTime.now()))
                      ? (state.selectedDate ?? DateTime.now())
                      : DateTime.now(),
                  lastDate: DateTime.now().add(const Duration(days: 5000)),
                  onDateChanged: (DateTime value) {
                    context
                        .read<AddEmployeeCubit>()
                        .updateStartDate(value.toString(), isStart: isStart);
                  },
                ),
              ),
              AppWidgets.devider,
              Padding(
                padding: EdgeInsets.only(top: AppDimen.dimen20),
                child: Row(
                  children: [
                    Expanded(
                        child: Row(
                      children: [
                        Image.asset(
                          AppAssets.icDate,
                          height: AppDimen.dimen25,
                        ),
                        Expanded(
                            child: Padding(
                          padding: EdgeInsets.only(left: AppDimen.dimen8),
                          child: AppWidgets.employeesDate(
                              context,
                              isStart
                                  ? AppFunctions.getDateString(
                                      state.selectedDate.toString())
                                  : state.type == 0
                                      ? AppConst.noDateHint
                                      : state.type == 1
                                          ? AppConst.todayHint
                                          : AppFunctions.getFormateDate(
                                              state.selectedDate.toString())),
                        ))
                      ],
                    )),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: AppDimen.dimen8),
                      child: SizedBox(
                        width: AppDimen.dimen80,
                        height: AppDimen.dimen40,
                        child: CommonButton(
                          title: AppString.cancel,
                          backColor:
                              Theme.of(context).primaryColor.withOpacity(0.1),
                          textColor: Theme.of(context).primaryColor,
                          onPressed: () => Navigator.pop(context),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: AppDimen.dimen80,
                      height: AppDimen.dimen40,
                      child: CommonButton(
                        title: AppString.save,
                        backColor: Theme.of(context).primaryColor,
                        textColor: AppColors.white,
                        onPressed: () {
                          isStart
                              ? context
                                  .read<AddEmployeeCubit>()
                                  .finalStartDate()
                              : context.read<AddEmployeeCubit>().finalEndDate();
                          Navigator.pop(context);
                        },
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
