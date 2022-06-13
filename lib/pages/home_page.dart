import 'package:flutter/material.dart';
import 'package:ibb_university_images/models/college.dart';
import 'package:ibb_university_images/pages/add_photo_page.dart';
import 'package:ibb_university_images/pages/colleges_page.dart';
import 'package:ibb_university_images/widgets/app_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({required this.collegeList});
  final List<College> collegeList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "صور جامعة إب",
          // Problem @ Theme Didn't Work Whit AppBar
          // style: Theme.of(context).textTheme.headline6,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontFamily: "Cairo",
          ),
        ),
      ),
      body: CollegesPage(collegeList: collegeList),
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
          onPressed: () => Navigator.of(context).pushNamed(
            AddPhotoPage.PAGE_ROUTE,
          ),
        ),
      ),
    );
  }
}
