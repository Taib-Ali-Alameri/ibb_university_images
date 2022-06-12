// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:ibb_university_images/models/photo.dart';
import 'package:ibb_university_images/widgets/photo_item.dart';

class PhotoesPage extends StatefulWidget {
  static const TRIPS_SCREEN = '/category-trips';
  final List<Photo> abailablePhotoes;

  PhotoesPage(this.abailablePhotoes);

  @override
  State<PhotoesPage> createState() => _PhotoesPageState();
}

class _PhotoesPageState extends State<PhotoesPage> {
  late String categoryTitle;
  late List<Photo> displayPhotoes;

  @override
  void didChangeDependencies() {
    final routeArgument =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final collegeId = routeArgument['id'];
    categoryTitle = routeArgument['title'] as String;
    displayPhotoes = widget.abailablePhotoes.where((photo) {
      return photo.collegeId.contains(collegeId!);
    }).toList();

    super.didChangeDependencies();
  }

  // void _removeTrip(String tripId) {
  //   setState(() {
  //     displayTrips.removeWhere((trip) => trip.id == tripId);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            categoryTitle,
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return PhotoItem(
            id: displayPhotoes[index].id,
            title: displayPhotoes[index].title,
            imageUrl: displayPhotoes[index].imageUrl,
            description: displayPhotoes[index].description,
          );
        },
        itemCount: displayPhotoes.length,
      ),
    );
  }
}
