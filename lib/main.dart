import 'package:flutter/material.dart';
import 'package:ibb_university_images/pages/add_product.dart';
import 'package:ibb_university_images/pages/colleges_page.dart';
import 'package:ibb_university_images/widgets/app_drawer.dart';
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
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "صور جامعة إب",
            // Problem @
            // style: Theme.of(context).textTheme.headline6,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontFamily: "Cairo",
            ),
          ),
        ),
        body: CollegesPage(),
        drawer: AppDrawer(),
        // Problem @ Can't Control Burger Icon
        floatingActionButton: Container(
          width: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.green,
          ),
          child: TextButton.icon(
            label: const Text(
              "إضافة صورة",
              style: TextStyle(
                fontFamily: "Cairo",
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            icon: Icon(
              Icons.add_a_photo,
              color: Colors.white,
            ),
            onPressed: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => AddProduct())),
          ),
        ),
      ),
    );
  }
}
