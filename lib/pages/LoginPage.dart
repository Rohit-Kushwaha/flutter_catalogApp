import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projrct/utils/routes.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = " ";
  bool checkButton = false;
  final formkey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (formkey.currentState.validate()) {
      checkButton = true;
      setState(() {});
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        checkButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: SingleChildScrollView(
            child: Form(
              key: formkey,
              child: Column(
          children: [
              Image.asset(
                "images/login_image.png",
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 20,
                // child: Text("space"),
              ),
              Text(
                "Welcome $name",
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
                      validator: (value) {
                        if(value.isEmpty){
                         return "Username cannot be empty";
                        }
                        return null;
                      },
                      onChanged: (value) {
                        name = value;
                        setState(() {});
                      },
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Enter Your Password",
                        labelText: "Password",
                      ),
                      validator: (value){

                        if(value.isEmpty){
                          return "Password not empty";
                        }
                        else if(value.length < 6){
                          return "Password length atleast 6 character";
                        }
                        return null;
                    },
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    Material(
                      // shape: checkButton ? BoxShape.circle : BoxShape.rectangle,
                      color: Colors.deepOrange,
                      borderRadius: BorderRadius.circular(checkButton ? 20 : 8),
                      child: InkWell(
                        onTap: () => moveToHome(context),
                        child: AnimatedContainer(
                          duration: Duration(seconds: 1),
                          width: checkButton ? 50 : 140,
                          height: 44,
                          alignment: Alignment.center,
                          child: checkButton
                              ? Icon(Icons.done, color: Colors.white)
                              : Text(
                                  "Login",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                          // decoration: BoxDecoration(
                          //   // shape: checkButton ? BoxShape.circle : BoxShape.rectangle,
                          //   color: Colors.deepOrange,
                          //   borderRadius: BorderRadius.circular(checkButton ? 20 : 8)
                        ),
                      ),
                    ),

                    // ElevatedButton(
                    //   child: Text("Login"),
                    //   style: ElevatedButton.styleFrom(primary: Colors.orange,minimumSize: Size(120, 40)),
                    //   onPressed: () {
                    //     // print("Hi Rohit");
                    //     Navigator.pushNamed(context, MyRoutes.homeRoute);
                    //   },
                    // ),
                  ],
                ),
              )
          ],
        ),
            )));
  }
}
