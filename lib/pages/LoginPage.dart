import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: Column(
          children: [
            Image.asset(
              "images/login_image.png",
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 20,
              child: Text("space"),
            ),
            Text(
              "Welcome",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Enter Username",
                      labelText: "Username",
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Enter Your Password",
                      labelText: "Password",
                    ),
                  ),
                  SizedBox(
                    height: 020,
                  ),
                  ElevatedButton(
                    child: Text("Login"),
                    style: ElevatedButton.styleFrom(),
                    onPressed: () {
                      print("Hi Rohit");
                    },
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
