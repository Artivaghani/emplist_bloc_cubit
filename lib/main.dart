import 'package:arti_vaghani/config/config_packages.dart';

Future<void> main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => EmployeeCubit(),
        ),
        BlocProvider(
          create: (context) => AddEmployeeCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Assignment',
        navigatorKey: NavigationService.navigatorKey,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light,
        home: const SplashScreen(),
        builder: (context, child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(
                textScaler: TextScaler.linear(FontDimen.textScaleFactor)),
            child: child!,
          );
        },
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case NamedRoutes.spashScreen:
              return MaterialPageRoute(
                  builder: (context) => const SplashScreen());
            case NamedRoutes.employeeScreen:
              return MaterialPageRoute(
                builder: (_) => const EmployeeScreen(),
                settings: settings,
              );
            case NamedRoutes.addEmployeeScreen:
              return MaterialPageRoute(
                builder: (context) => const AddEmployeeScreen(),
                settings: settings,
              );
            default:
              return MaterialPageRoute(
                  builder: (context) => const SplashScreen());
          }
        },
      ),
    );
  }
}
