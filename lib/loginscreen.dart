import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:mytrialapp/sign_up_page.dart';
import 'package:mytrialapp/tab_bar_screen.dart';
import 'package:mytrialapp/util/authentication_service.dart';

class LoginPage extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  //const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            "Shop with Smile !!",
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
          centerTitle: true,
        ),
        // ignore: sized_box_for_whitespace
        body: SingleChildScrollView(
          child: Stack(children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Image.network(
                "https://im.whatshot.in/img/2018/Oct/shutterstock-640144120-cropped-1-1540530143.jpg",
                fit: BoxFit.fitHeight,
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 170),
                  child: TextField(
                    cursorColor: Colors.white,
                    keyboardType: TextInputType.emailAddress,
                    maxLines: 1,
                    controller: emailController,
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.email,
                          color: Colors.white,
                          size: 20,
                        ),
                        hintText: "E-mail ID",
                        hintStyle: TextStyle(color: Colors.white)),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: TextField(
                    obscureText: true,
                    controller: passwordController,
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.remove_red_eye,
                          color: Colors.white,
                          size: 20,
                        ),
                        hintText: "Password",
                        hintStyle: TextStyle(color: Colors.white)),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 25),
                        child: TextButton(
                            onPressed: () {},
                            child: Text(
                              "Forgot Password?",
                              style: TextStyle(
                                  backgroundColor: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 20, 2, 57)),
                      onPressed: () async {
                        await AuthenticationService(FirebaseAuth.instance)
                            .firebaseLogin(emailController.text.trim(),
                                passwordController.text.trim())
                            .then((value) {
                          if (value == "Signed in") {
                            // databaseReference.push().set(product.toJson());
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => TabBarScreen(),
                                ));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(value),
                              backgroundColor: Colors.red,
                            ));
                          }
                        });
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25, left: 10),
                  child: Row(
                    children: [
                      Text(
                        "Don't have an Account?",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SignUpPage(),
                                  ));
                            },
                            child: Text(
                              "Create one!",
                              style: TextStyle(
                                  color: Colors.white,
                                  backgroundColor:
                                      Color.fromARGB(255, 20, 2, 57),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            )),
                      )
                    ],
                  ),
                )
              ],
            ),
          ]),
        ));
  }
}
