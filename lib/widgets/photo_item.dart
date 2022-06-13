import 'package:flutter/material.dart';
import 'package:ibb_university_images/pages/photo_details_page.dart';

class PhotoItem extends StatelessWidget {
  final String id;
  final String collegeId;
  final String title;
  final String imageUrl;
  final String description;

  // ignore: use_key_in_widget_constructors
  const PhotoItem({
    required this.id,
    required this.collegeId,
    required this.title,
    required this.imageUrl,
    required this.description,
  });

  void SelectTrip(BuildContext context) {
    Navigator.of(context).pushNamed(
      PhotoDetailsPage.PHOTO_DETAILS_PAGE,
      arguments: id,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => SelectTrip(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 7,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  child: Image.asset(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0),
                        Colors.black.withOpacity(.8),
                      ],
                      stops: [0.5, 1],
                    ),
                  ),
                  height: 250,
                  alignment: Alignment.bottomRight,
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.headline6,
                    overflow: TextOverflow.fade,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(description),
            ),
          ],
        ),
      ),
    );
  }
}
