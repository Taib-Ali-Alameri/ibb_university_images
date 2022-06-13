// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../app_data.dart';

class PhotoDetailsPage extends StatelessWidget {
  // final Function manageFavorite;
  // final Function isFavorite;
  // const PhotoDetailsPage(this.manageFavorite, this.isFavorite);

  static const PAGE_ROUTE = '/photo-details';

  // Widget buildSectionTitle(String titleText, BuildContext context) {
  //   return Container(
  //     margin: EdgeInsets.symmetric(
  //       horizontal: 15,
  //       vertical: 10,
  //     ),
  //     alignment: Alignment.topRight,
  //     child: Text(
  //       titleText,
  //       style: Theme.of(context).textTheme.headline5,
  //     ),
  //   );
  // }

  // Widget buildListViewConatainer(Widget child) {
  //   return Container(
  //     padding: EdgeInsets.all(10),
  //     decoration: BoxDecoration(
  //       color: Colors.white,
  //       border: Border.all(
  //         color: Colors.grey,
  //       ),
  //       borderRadius: BorderRadius.circular(10),
  //     ),
  //     margin: EdgeInsets.symmetric(
  //       horizontal: 15,
  //     ),
  //     height: 300,
  //     child: child,
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    final tripId = ModalRoute.of(context)?.settings.arguments as String;
    final selectedPhoto = photoesData.firstWhere((trip) => trip.id == tripId);

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            selectedPhoto.title,
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.asset(
                selectedPhoto.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 10,
              ),
              alignment: Alignment.topRight,
              child: Text(
                selectedPhoto.title,
                style: TextStyle(
                  fontFamily: "Cairo",
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 10,
              ),
              alignment: Alignment.topRight,
              child: Text(
                " رفعت الصورة بواسطة : ${selectedPhoto.userId}",
                style: TextStyle(
                  fontFamily: "Cairo",
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 10,
              ),
              alignment: Alignment.topRight,
              child: Text(
                selectedPhoto.description,
                style: Theme.of(context).textTheme.headline5,
              ),
            ),

            // buildSectionTitle(selectedPhoto.title, context),
            // buildListViewConatainer(
            //   ListView.builder(
            //     itemBuilder: (ctx, index) => Column(
            //       children: [
            //         ListTile(
            //           leading: CircleAvatar(
            //             radius: 40,
            //             child: Text(
            //               'يوم ${index + 1}',
            //               style: TextStyle(color: Colors.white),
            //             ),
            //             backgroundColor: Theme.of(context).accentColor,
            //           ),
            //           title: Text(selectedTrip.program[index]),
            //         ),
            //         Divider(),
            //       ],
            //     ),
            //     itemCount: selectedTrip.program.length,
            //   ),
            // ),
            SizedBox(
              height: 100,
            ),
          ],
        ),
      ),

      // floatingActionButton: FloatingActionButton(
      //   child: Icon(
      //     isFavorite(tripId) ? Icons.star : Icons.star_border,
      //     color: Colors.blue,
      //   ),
      //   onPressed: () => manageFavorite(tripId),
      // ),
    );
  }
}
