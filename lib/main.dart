import 'package:flutter/material.dart';
import 'package:ibb_university_images/pages/login_page.dart';
import '../app_data.dart';
import '../pages/add_photo_page.dart';
import '../pages/home_page.dart';
import '../pages/photo_details_page.dart';
import '../pages/photoes_page.dart';
import 'pages/registration_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // To Change Direction
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ar', 'AE'),
      ],

      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        textTheme: const TextTheme(
          headline6: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontFamily: "Cairo",
          ),
          headline5: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black54,
            fontFamily: "Cairo",
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (ctx) => const HomePage(collegeList: collegesData),
        PhotoesPage.PAGE_ROUTE: (ctx) =>
            PhotoesPage(availablePhotoes: photoesData),
        AddPhotoPage.PAGE_ROUTE: (ctx) => AddPhotoPage(),
        PhotoDetailsPage.PAGE_ROUTE: (ctx) => PhotoDetailsPage(),
        RegisterationPage.PAGE_ROUTE: (ctx) => RegisterationPage(),
        LoginPage.PAGE_ROUTE: (ctx) => LoginPage(),
      },
    );
  }
}
