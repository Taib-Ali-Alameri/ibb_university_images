import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ibb_university_images/main.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';

class AddPhoto extends StatefulWidget {
  const AddPhoto({Key? key}) : super(key: key);

  @override
  _AddPhotoState createState() => _AddPhotoState();
}

class _AddPhotoState extends State<AddPhoto> {
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    late File _image = Provider.of(context, listen: true).image;

    return Scaffold(
      appBar: AppBar(title: const Text('إضافة صورة')),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView(children: [
          TextField(
            decoration: const InputDecoration(
                labelText: "عنوان الصورة", hintText: "اكتب عنوان للصورة"),
            controller: titleController,
          ),
          const SizedBox(height: 20),
          TextField(
            decoration: const InputDecoration(
                labelText: "وصف الصورة", hintText: "اكتب وصف للصورة"),
            controller: descriptionController,
          ),
          const SizedBox(height: 30),
          Container(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Theme.of(context).primaryColor,
                onPrimary: Colors.white,
              ),
              child: const Text("اختر صورة"),
              onPressed: () {
                var ad = AlertDialog(
                  title: Text(
                    "اختيار الصورة من:",
                    style: TextStyle(color: Colors.green[800]),
                  ),
                  content: Container(
                    height: 180,
                    child: Column(
                      children: [
                        Divider(color: Colors.black),
                        SizedBox(height: 20),
                        Builder(builder: (innerContext) {
                          return Container(
                            decoration: BoxDecoration(
                              color: Colors.cyan,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ListTile(
                              leading: const Icon(
                                Icons.image,
                                color: Colors.white,
                              ),
                              title: const Text(
                                "معرض الصور",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontFamily: "Cairo",
                                ),
                              ),
                              onTap: () {
                                context.read().getImage(ImageSource.gallery);
                                Navigator.of(innerContext).pop();
                              },
                            ),
                          );
                        }),
                        SizedBox(height: 20),
                        Builder(builder: (innerContext) {
                          return Container(
                            decoration: BoxDecoration(
                              color: Colors.cyan,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ListTile(
                              leading: const Icon(
                                Icons.camera_alt,
                                color: Colors.white,
                              ),
                              title: const Text(
                                "الكاميرا",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontFamily: "Cairo",
                                ),
                              ),
                              onTap: () {
                                context.read().getImage(ImageSource.camera);
                                Navigator.of(innerContext).pop();
                              },
                            ),
                          );
                        }),
                      ],
                    ),
                  ),
                );
                showDialog(context: context, builder: (context) => ad);
              },
            ),
          ),
          SizedBox(height: 30),
          Consumer(
            builder: (context, value, child) => ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.yellow,
                  onPrimary: Colors.black,
                ),
                child: Text("إرسال الصورة"),
                onPressed: () async {
                  try {
                    if (_image == null) {
                      Fluttertoast.showToast(
                        msg: "Please select an image",
                        toastLength: Toast.LENGTH_LONG,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.black54,
                        textColor: Colors.white,
                        fontSize: 16.0,
                      );
                    } else {
                      try {
                        await Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => MyApp()));
                      } catch (e) {
                        Fluttertoast.showToast(
                          msg: "$e",
                          toastLength: Toast.LENGTH_LONG,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.black54,
                          textColor: Colors.white,
                          fontSize: 16.0,
                        );
                        print(e);
                      }
                    }
                  } catch (e) {
                    print(e);
                  }
                }),
          ),
        ]),
      ),
    );
  }
}
