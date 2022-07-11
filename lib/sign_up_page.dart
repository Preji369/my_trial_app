import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:mytrialapp/add_products.dart';
import 'package:mytrialapp/tab_bar_screen.dart';
import 'package:mytrialapp/util/authentication_service.dart';
import 'package:mytrialapp/util/user.dart';

class SignUpPage extends StatelessWidget {
  //const SignUpPage({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController shopnameController = TextEditingController();
  TextEditingController logoController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  final databaseReference = FirebaseDatabase.instance.ref().child("user");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Sign Up",
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
        centerTitle: true,
      ),
      // ignore: sized_box_for_whitespace
      body: SingleChildScrollView(
        child: Stack(
          children: [
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
                  padding: const EdgeInsets.only(top: 250),
                  child: TextField(
                    cursorColor: Colors.white,
                    keyboardType: TextInputType.name,
                    maxLines: 1,
                    controller: nameController,
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.people,
                          color: Colors.white,
                          size: 20,
                        ),
                        hintText: "Name",
                        hintStyle: TextStyle(color: Colors.white)),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 250),
                  child: TextField(
                    cursorColor: Colors.white,
                    keyboardType: TextInputType.name,
                    maxLines: 1,
                    controller: nameController,
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.people,
                          color: Colors.white,
                          size: 20,
                        ),
                        hintText: "Shop Name",
                        hintStyle: TextStyle(color: Colors.white)),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 250),
                  child: TextField(
                    cursorColor: Colors.white,
                    keyboardType: TextInputType.name,
                    maxLines: 1,
                    controller: shopnameController,
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.image,
                          color: Colors.white,
                          size: 20,
                        ),
                        hintText: "Logo",
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
                    controller: numberController,
                    cursorColor: Colors.white,
                    keyboardType: TextInputType.number,
                    maxLength: 10,
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.phone,
                          color: Colors.white,
                          size: 20,
                        ),
                        hintText: "Contact Number",
                        hintStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
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
                    cursorColor: Colors.white,
                    controller: passwordController,
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.remove_red_eye,
                          color: Colors.white,
                          size: 20,
                        ),
                        hintText: "Create Password",
                        hintStyle: TextStyle(color: Colors.white)),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: TextField(
                    controller: addressController,
                    cursorColor: Colors.white,
                    keyboardType: TextInputType.text,
                    maxLines: 2,
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.home,
                          color: Colors.white,
                          size: 20,
                        ),
                        hintText: "Address",
                        hintStyle: TextStyle(color: Colors.white)),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 20, 2, 57)),
                      onPressed: () async {
                        await AuthenticationService(FirebaseAuth.instance)
                            .firebaseRegister(emailController.text.trim(),
                                passwordController.text.trim())
                            .then((value) async {
                          if (value == "Signed up") {
                            CleoUser user = CleoUser(
                                nameController.text.trim(),
                                shopnameController.text.trim(),
                                logoController.text.trim(),
                                numberController.text.trim(),
                                emailController.text.trim(),
                                passwordController.text.trim(),
                                addressController.text.trim());

                            await databaseReference.push().set(user.toJson());

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AddProductsScreen(),
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
                        "Register",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      )),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
