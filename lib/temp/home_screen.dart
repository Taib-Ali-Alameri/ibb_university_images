// import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../temp/detailed_screen.dart';
// import 'package:photo_gallery/services/photo_service.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<String> list = [];
  // PhotoService pService;
  bool loading = false;

  void getListImg() {
    setState(() {
      this.loading = true;
      list = [
        'images/categories/mountains.jpg',
        'images/categories/lakes.jpg',
        'images/categories/beaches.jpg',
        'images/categories/deserts.jpg',
        'images/categories/ancients.jpg',
        'images/categories/snow.jpg',
      ];
      this.loading = false;
    });
  }

  bool _scrollListener(ScrollNotification event) {
    if (event is ScrollStartNotification) {
      this.getListImg();
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotificationListener<ScrollNotification>(
        onNotification: _scrollListener,
        child: GridView.builder(
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: EdgeInsets.all(2.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailedPage(
                        imgPath: list[index],
                      ),
                    ),
                  );
                },
                child: Container(
                    // child: CachedNetworkImage(
                    //   fit: BoxFit.cover,
                    //   imageUrl: list[index],
                    //   placeholder: (context, url) => LoadingIndicator(),
                    //   errorWidget: (context, url, error) =>
                    //       new Icon(Icons.error),
                    // ),
                    ),
              ),
            );
          },
          itemCount: list.length,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        ),
      ),
    );
  }
}
