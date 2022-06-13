import 'package:flutter/material.dart';
import 'package:ibb_university_images/app_data.dart';
import 'package:ibb_university_images/pages/add_photo_page.dart';
import 'package:ibb_university_images/pages/home_page.dart';
import 'package:ibb_university_images/pages/photo_details_page.dart';
import 'package:ibb_university_images/pages/photoes_page.dart';
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
        PhotoesPage.PHOTOES_PAGE: (ctx) =>
            PhotoesPage(availablePhotoes: photoesData),
        AddPhotoPage.ADD_PHOTO_PAGE: (ctx) => AddPhotoPage(),
        PhotoDetailsPage.PHOTO_DETAILS_PAGE: (ctx) => PhotoDetailsPage(),
      },
    );
  }
}
