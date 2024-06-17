import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:movieSearch/routes.dart';
import 'package:movieSearch/style/color.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //세로모드 고정 & 시스템 UI
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
    statusBarColor: const Color(0x00fafafa), //상태바 투명처리
    statusBarIconBrightness: Brightness.dark,
  ));

  // dotenv
  await dotenv.load(fileName: ".env");

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context)
              .copyWith(textScaler: const TextScaler.linear(1.0)),
          child: child!,
        );
      },
      theme: ThemeData(
        fontFamily: 'AppleSDGothicNeo',
        primaryColor: primaryNavyBlue,
        scaffoldBackgroundColor: primaryWhite,
        primaryTextTheme: const TextTheme(
          bodyMedium: TextStyle(
            color: secondaryDarkGray,
          ),
        ),
      ),
      title: 'movieSearch',
      debugShowCheckedModeBanner: false,
      initialRoute: '/mainView',
      getPages: Routes.routes,
    );
  }
}
