import 'package:flutter/material.dart';

class DetailedPage extends StatelessWidget {
  final String imgPath;

  const DetailedPage({required this.imgPath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Detailed page'),
        ),
        body: Stack(
          children: [
            Center(
              child: Image.asset(imgPath),
            ),
            const Positioned(
              bottom: 20.0,
              left: 200.0,
              child: Center(
                child: Icon(
                  Icons.share,
                  color: Colors.orange,
                ),
              ),
            )
          ],
        ));
  }
}
