import 'package:flutter/material.dart';
import 'package:ibb_university_images/pages/categories_page.dart';
import 'package:ibb_university_images/widgets/app_drawer.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontFamily: "Cairo",
          ),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "الأصناف",
            // Problem *********************************
            // style: Theme.of(context).textTheme.headline6,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontFamily: "Cairo",
            ),
          ),
        ),
        body: CategoriesPage(),
        drawer: AppDrawer(),
      ),
    );
  }
}
