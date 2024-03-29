import 'dart:io';

import 'package:notary_ping_notary/LandingPage.dart';
import 'package:notary_ping_notary/index.dart';
import 'package:permission_handler/permission_handler.dart';

import 'src/services/Languages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  if (Platform.isAndroid) {
    WidgetsFlutterBinding.ensureInitialized();
    [
      Permission.location,
    ].request().then((status) {
      runApp(const NotaryPingNotaryApp());
    });
  } else {
    runApp(const NotaryPingNotaryApp());
  }
}

class NotaryPingNotaryApp extends StatelessWidget {
  const NotaryPingNotaryApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) => GetMaterialApp(
        translations: Languages(),
        locale: const Locale('en', 'US'),
        fallbackLocale: const Locale('en', 'US'),
        defaultTransition: Transition.fade,
        title: 'Notary Ping',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Inter',
          scaffoldBackgroundColor: Colors.white,
          primaryColor: Colors.white,
          brightness: Brightness.light,
          useMaterial3: true,
          hoverColor: Colors.transparent,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          focusColor: Colors.transparent,
        ),
        home: const LandingPage(),
      ),
    );
  }
}
