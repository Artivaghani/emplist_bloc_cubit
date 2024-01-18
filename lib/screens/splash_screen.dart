import 'package:arti_vaghani/config/config_packages.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppDimen.screenHeight = MediaQuery.of(context).size.height;
    AppDimen.screenWidth = MediaQuery.of(context).size.width;
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushNamedAndRemoveUntil(context, NamedRoutes.employeeScreen, (route) => false);
    });
    return Scaffold(
      body: Center(child: Text(AppString.splashMsg,style: Theme.of(context).textTheme.headlineMedium,textAlign: TextAlign.center,)),
    );
  }
}
