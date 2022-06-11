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

    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.green),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text('إضافة صورة')),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: ListView(children: [
            TextField(
              decoration: const InputDecoration(
                  labelText: "عنوان الصورة", hintText: "اكتب عنوان للصورة"),
              controller: titleController,
            ),
            TextField(
              decoration: const InputDecoration(
                  labelText: "وصف الصورة", hintText: "اكتب وصف للصورة"),
              controller: descriptionController,
            ),
            const SizedBox(height: 10),
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
                    title: Text("اختيار الصورة من:"),
                    content: Container(
                      height: 150,
                      child: Column(
                        children: [
                          Divider(color: Colors.black),
                          Builder(builder: (innerContext) {
                            return Container(
                              color: Colors.cyan,
                              child: ListTile(
                                leading: Icon(Icons.image),
                                title: Text("معرض الصور"),
                                onTap: () {
                                  context.read().getImage(ImageSource.gallery);
                                  Navigator.of(innerContext).pop();
                                },
                              ),
                            );
                          }),
                          SizedBox(height: 15),
                          Builder(builder: (innerContext) {
                            return Container(
                              color: Colors.cyan,
                              child: ListTile(
                                leading: Icon(Icons.camera_alt),
                                title: Text("الكاميرا"),
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
      ),
    );
  }
}
