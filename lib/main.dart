import 'package:flutter/material.dart';
import 'package:ibb_university_images/pages/categories_page.dart';
import 'package:ibb_university_images/widgets/app_drawer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.green, textTheme: TextTheme()),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "الأصناف",
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        body: CategoriesPage(),
        drawer: AppDrawer(),
      ),
    );
  }
}
