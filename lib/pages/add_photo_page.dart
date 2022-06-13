import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ibb_university_images/main.dart';
import 'package:ibb_university_images/widgets/my_button.dart';
import 'package:ibb_university_images/widgets/my_textfield.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';

class AddPhotoPage extends StatefulWidget {
  const AddPhotoPage({Key? key}) : super(key: key);

  static const ADD_PHOTO_PAGE = '/add-photo';

  @override
  _AddPhotoPageState createState() => _AddPhotoPageState();
}

class _AddPhotoPageState extends State<AddPhotoPage> {
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    late File _image = Provider.of(context, listen: true).image;

    return Scaffold(
      appBar: AppBar(title: const Text('إضافة صورة')),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: ListView(children: [
          const SizedBox(height: 30),
          MyTextField(
            label: "عنوان الصورة",
            hint: "اكتب عنوان للصورة",
          ),
          const SizedBox(height: 30),
          MyTextField(
            label: "وصف الصورة",
            hint: "اكتب وصف للصورة",
          ),
          const SizedBox(height: 30),
          Container(
            width: double.infinity,
            child: MyButton(
              color: Colors.green,
              title: "اخـتر صورة",
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
                        const Divider(color: Colors.black),
                        const SizedBox(height: 20),
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
                        const SizedBox(height: 20),
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
          SizedBox(height: 20),
          Consumer(
            builder: (context, value, child) => MyButton(
                // style: ElevatedButton.styleFrom(
                //   primary: Colors.yellow,
                //   onPrimary: Colors.black,
                // ),
                // child: const Text("إرسال الصورة"),
                color: Colors.blue,
                title: "إرسال الصورة",
                onPressed: () async {
                  try {
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
