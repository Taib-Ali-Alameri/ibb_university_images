// // ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

// import 'package:flutter/material.dart';
// import 'package:messengram/widgets/my_button.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

// class SigninScreen extends StatefulWidget {
//   static const SCREEN_ROUTE = "signin_screen";
//   const SigninScreen({Key? key}) : super(key: key);

//   @override
//   _SigninScreenState createState() => _SigninScreenState();
// }

// class _SigninScreenState extends State<SigninScreen> {
//   final _auth = FirebaseAuth.instance;
//   late String email;
//   late String password;
//   bool showSpinner = false;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SingleChildScrollView(
//         child: ModalProgressHUD(
//           inAsyncCall: showSpinner,
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 24),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 Container(
//                   height: 160,
//                   child: Image.asset("images/MessengramLogo.png"),
//                 ),
//                 SizedBox(height: 50),
//                 TextField(
//                   keyboardType: TextInputType.emailAddress,
//                   textAlign: TextAlign.center,
//                   onChanged: (value) {
//                     email = value;
//                   },
//                   decoration: InputDecoration(
//                     hintText: "Enter your Email",
//                     contentPadding:
//                         EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.all(
//                         Radius.circular(10),
//                       ),
//                     ),
//                     enabledBorder: OutlineInputBorder(
//                       borderSide: BorderSide(
//                         color: Colors.blue[900]!,
//                         width: 1,
//                       ),
//                       borderRadius: BorderRadius.all(
//                         Radius.circular(10),
//                       ),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderSide: BorderSide(
//                         color: Colors.purple,
//                         width: 2,
//                       ),
//                       borderRadius: BorderRadius.all(
//                         Radius.circular(10),
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 TextField(
//                   obscureText: true,
//                   textAlign: TextAlign.center,
//                   onChanged: (value) {
//                     password = value;
//                   },
//                   decoration: InputDecoration(
//                     hintText: "Enter your password",
//                     contentPadding:
//                         EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.all(
//                         Radius.circular(10),
//                       ),
//                     ),
//                     enabledBorder: OutlineInputBorder(
//                       borderSide: BorderSide(
//                         color: Colors.blue[900]!,
//                         width: 1,
//                       ),
//                       borderRadius: BorderRadius.all(
//                         Radius.circular(10),
//                       ),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderSide: BorderSide(
//                         color: Colors.purple,
//                         width: 2,
//                       ),
//                       borderRadius: BorderRadius.all(
//                         Radius.circular(10),
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 MyButton(
//                     color: Colors.green[400]!,
//                     title: "Log in",
//                     onPressed: () async {
//                       setState(() {
//                         showSpinner = true;
//                       });
//                       try {
//                         final user = await _auth.signInWithEmailAndPassword(
//                             email: email, password: password);
//                         if (user != null) {
//                           Navigator.pushNamed(context, ChatScreen.PAGE_ROUTE);
//                         }
//                         setState(() {
//                           showSpinner = false;
//                         });
//                       } catch (e) {
//                         print(e);
//                       }
//                     }),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
