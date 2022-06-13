// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:ibb_university_images/pages/registration_page.dart';
import 'package:ibb_university_images/widgets/my_textfield.dart';
// import 'package:flutter/services.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../widgets/my_button.dart';

class LoginPage extends StatefulWidget {
  static const PAGE_ROUTE = "login-page";
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // final _auth = FirebaseAuth.instance;

  late String email;
  late String password;

  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("تسجيل الدخول")),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child:
            // ModalProgressHUD(
            //   inAsyncCall: showSpinner,
            //   child:
            Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 70),
              Center(
                child: Container(
                  height: 120,
                  child: Text(
                    "مرحباً بكم",
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
              ),
              MyTextField(
                label: "اسم المستخدم",
                hint: "اكتب اسمك هنا",
                keyBoardType: TextInputType.name,
                onChange: (value) {},
              ),

              // TextField(
              //   keyboardType: TextInputType.emailAddress,
              //   textAlign: TextAlign.center,
              //   onChanged: (value) {
              //     email = value;
              //   },
              //   decoration: InputDecoration(
              //     hintText: "Enter your Email",
              //     contentPadding:
              //         EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              //     border: OutlineInputBorder(
              //       borderRadius: BorderRadius.all(
              //         Radius.circular(10),
              //       ),
              //     ),
              //     enabledBorder: OutlineInputBorder(
              //       borderSide: BorderSide(
              //         color: Colors.blue[900]!,
              //         width: 1,
              //       ),
              //       borderRadius: BorderRadius.all(
              //         Radius.circular(10),
              //       ),
              //     ),
              //     focusedBorder: OutlineInputBorder(
              //       borderSide: BorderSide(
              //         color: Colors.purple,
              //         width: 2,
              //       ),
              //       borderRadius: BorderRadius.all(
              //         Radius.circular(10),
              //       ),
              //     ),
              //   ),
              // ),
              SizedBox(
                height: 20,
              ),
              MyTextField(
                label: "كلمة المرور",
                hint: "اكتب كلمة مرور لحسابك",
                keyBoardType: TextInputType.name,
                onChange: (value) {},
              ),
              SizedBox(
                height: 20,
              ),

              // TextField(
              //   obscureText: true,
              //   textAlign: TextAlign.center,
              //   onChanged: (value) {
              //     password = value;
              //   },
              //   decoration: InputDecoration(
              //     hintText: "Enter your password",
              //     contentPadding:
              //         EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              //     border: OutlineInputBorder(
              //       borderRadius: BorderRadius.all(
              //         Radius.circular(10),
              //       ),
              //     ),
              //     enabledBorder: OutlineInputBorder(
              //       borderSide: BorderSide(
              //         color: Colors.blue[900]!,
              //         width: 1,
              //       ),
              //       borderRadius: BorderRadius.all(
              //         Radius.circular(10),
              //       ),
              //     ),
              //     focusedBorder: OutlineInputBorder(
              //       borderSide: BorderSide(
              //         color: Colors.purple,
              //         width: 2,
              //       ),
              //       borderRadius: BorderRadius.all(
              //         Radius.circular(10),
              //       ),
              //     ),
              //   ),
              // ),
              SizedBox(
                height: 30,
              ),
              MyButton(
                  color: Colors.blue,
                  title: "تسجيل دخول",
                  onPressed: () async {
                    setState(() {
                      showSpinner = true;
                    });
                    try {
                      // final newUser =
                      //     await _auth.createUserWithEmailAndPassword(
                      //         email: email, password: password);
                      // Navigator.pushNamed(context, ChatScreen.SCREEN_ROUTE);
                      // setState(() {
                      //   showSpinner = false;
                      // });
                    } catch (e) {
                      print(e);
                    }
                    // print(email);
                    // print(password);
                  }),
              SizedBox(
                height: 30,
              ),
              MyButton(
                  color: Colors.green,
                  title: "إنشاء حساب",
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed(RegisterationPage.PAGE_ROUTE);
                  }
                  // async {
                  //   setState(() {
                  //     showSpinner = true;
                  //   });
                  //   try {
                  //     final newUser =
                  //         await _auth.createUserWithEmailAndPassword(
                  //             email: email, password: password);
                  //     Navigator.pushNamed(context, ChatScreen.SCREEN_ROUTE);
                  //     setState(() {
                  //       showSpinner = false;
                  //     });
                  //   } catch (e) {
                  //     print(e);
                  //   }
                  //   // print(email);
                  //   // print(password);
                  // },
                  ),
            ],
          ),
        ),
        // ),
      ),
    );
  }
}
