import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:ibb_university_images/widgets/my_textfield.dart';
import 'package:http/http.dart' as http;

Future<http.Response> login(String username, String password) async {
  return await http.post(
    Uri.parse('http://10.4.179.1:8080/user/login'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'username': username,
      'password': password,
    }),
  );
}

Future<http.StreamedResponse> sendImg(String filename, String url) async {
  var request = http.MultipartRequest('POST', Uri.parse(url));

  // request.files.add(http.MultipartFile('image',
  //     File(filename).readAsBytes().asStream(), File(filename).lengthSync(),
  //     filename: filename.split("/").last));

  request.files.add(http.MultipartFile.fromBytes(
      'image', File(filename).readAsBytesSync(),
      filename: filename.split("/").last));
  var res = await request.send();
  return res;
}

class TestApi extends StatelessWidget {
  const TestApi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Testing"),
      ),
      body: Center(
        child: Column(
          children: [
            MyTextField(
              label: "label",
              hint: "hint",
              keyBoardType: TextInputType.none,
              onChange: (value) {},
            ),
            ElevatedButton(
              child: Text("Send"),
              onPressed: () {
                // login("mohammed", "123567").then((res) {
                //   print(res.body);
                //   print("done");
                // });
                sendImg("../../images/categories/ancients.jpg",
                    "http://10.4.179.1:8080/upload");
              },
            ),
            Text(""),
          ],
        ),
      ),
    );
  }
}
