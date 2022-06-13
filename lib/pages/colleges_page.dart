// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ibb_university_images/models/college.dart';
import '../app_data.dart';
import '../widgets/college_item.dart';

class CollegesPage extends StatelessWidget {
  final List<College> collegeList;

  const CollegesPage({required this.collegeList});

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 7 / 8,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      children: collegeList
          .map(
            (categoryData) => CollegeItem(
              categoryData.id,
              categoryData.title,
              categoryData.imageUrl,
            ),
          )
          .toList(),
    );
  }
}
