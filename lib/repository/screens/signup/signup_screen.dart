import 'package:bookingapp/services/widget_support.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.only(top: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                'assets/images/signup.png',
                width: 300,
                height: 300,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 5),
            Center(
              child: Text('Sign Up', style: AppWidget.headlineTextStyle(25)),
            ),
            Center(
              child: Text(
                "Please enter the details to continue",
                style: AppWidget.normalTextStyle(17),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.only(left: 30),
              child: Text('Name', style: AppWidget.normalTextStyle(22)),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.only(left: 30, right: 30),
              decoration: BoxDecoration(
                color: Color(0XFFececf8),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(
                    Icons.person,
                    color:  Color.fromARGB(255, 4, 104, 186),
                  ),
                  hintText: 'Enter Name',
                  hintStyle: AppWidget.normalTextStyle(18),
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.only(left: 30),
              child: Text('Email', style: AppWidget.normalTextStyle(22)),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.only(left: 30, right: 30),
              decoration: BoxDecoration(
                color: Color(0XFFececf8),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(
                    Icons.mail,
                    color:  Color.fromARGB(255, 4, 104, 186),
                  ),
                  hintText: 'Enter Email',
                  hintStyle: AppWidget.normalTextStyle(18),
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.only(left: 30),
              child: Text('Password', style: AppWidget.normalTextStyle(22)),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.only(left: 30, right: 30),
              decoration: BoxDecoration(
                color: Color(0XFFececf8),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(
                    Icons.password,
                    color:  Color.fromARGB(255, 4, 104, 186),
                  ),
                  hintText: 'Enter Password',
                  hintStyle: AppWidget.normalTextStyle(18),
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: GestureDetector(
                child: Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width / 2,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 104, 200, 107),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account? ",
                  style: AppWidget.normalTextStyle(18),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, "/loginScreen");
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
