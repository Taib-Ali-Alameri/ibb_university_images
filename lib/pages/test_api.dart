import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:ibb_university_images/widgets/my_textfield.dart';
import 'package:http/http.dart' as http;

Future<http.Response> login(String username, String password) async {
  return await http.post(
    Uri.parse('https://jsonplaceholder.typicode.com/albums'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'username': username,
      'password': password,
    }),
  );
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
                login("mohammed", "1234567").then((res) {
                  print(res);
                });
              },
            ),
            Text(""),
          ],
        ),
      ),
    );
  }
}
