import 'package:bookingapp/services/widget_support.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 244, 241, 241),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                  child: Image.asset(
                    "assets/images/home.jpg",
                    height: 280,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 40, left: 20),
                  width: MediaQuery.of(context).size.width,
                  height: 280,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(97, 0, 0, 0),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.location_on, color: Colors.white),
                          SizedBox(width: 10),
                          Text(
                            "Pakistan, Karachi",
                            style: AppWidget.whiteTextStyle(20),
                          ),
                        ],
                      ),
                      SizedBox(height: 30),
                      Text(
                        "Hey, Ahmed! Tell us where you want to go",
                        style: AppWidget.whiteTextStyle(24),
                      ),
                      SizedBox(height: 20),
                      Container(
                        padding: EdgeInsets.only(bottom: 5, top: 5),
                        margin: EdgeInsets.only(right: 20),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(103, 255, 255, 255),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Icon(Icons.search, color: Colors.white),
                            hintText: "Search Places",
                            hintStyle: AppWidget.whiteTextStyle(20),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                'The most relevant',
                style: AppWidget.headlineTextStyle(22),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 330,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20, bottom: 5),
                    child: Material(
                      elevation: 2,
                      borderRadius: BorderRadius.circular(30),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Image.asset(
                                'assets/images/hotel1.jpg',
                                width: MediaQuery.of(context).size.width / 1.2,
                                height: 230,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(height: 10),
                            Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Row(
                                children: [
                                  Text(
                                    'Hotel Beach',
                                    style: AppWidget.headlineTextStyle(24),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 3.2,
                                  ),
                                  Text(
                                    '\$20',
                                    style: AppWidget.headlineTextStyle(25),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 10),
                            Padding(
                              padding: EdgeInsets.only(left: 13),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    color: Colors.blue,
                                    size: 30,
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    'Near Main MArket, Karachi',
                                    style: AppWidget.normalTextStyle(18),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20, bottom: 5),
                    child: Material(
                      elevation: 2,
                      borderRadius: BorderRadius.circular(30),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Image.asset(
                                'assets/images/hotel2.jpg',
                                width: MediaQuery.of(context).size.width / 1.2,
                                height: 230,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(height: 10),
                            Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Row(
                                children: [
                                  Text(
                                    'Hotel Beach',
                                    style: AppWidget.headlineTextStyle(24),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 3.2,
                                  ),
                                  Text(
                                    '\$20',
                                    style: AppWidget.headlineTextStyle(25),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 10),
                            Padding(
                              padding: EdgeInsets.only(left: 13),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    color: Colors.blue,
                                    size: 30,
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    'Near Main MArket, Karachi',
                                    style: AppWidget.normalTextStyle(18),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(left: 20, bottom: 5),
                    child: Material(
                      elevation: 2,
                      borderRadius: BorderRadius.circular(30),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Image.asset(
                                'assets/images/hotel3.jpg',
                                width: MediaQuery.of(context).size.width / 1.2,
                                height: 230,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(height: 10),
                            Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Row(
                                children: [
                                  Text(
                                    'Hotel Beach',
                                    style: AppWidget.headlineTextStyle(24),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 3.2,
                                  ),
                                  Text(
                                    '\$20',
                                    style: AppWidget.headlineTextStyle(25),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 10),
                            Padding(
                              padding: EdgeInsets.only(left: 13),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    color: Colors.blue,
                                    size: 30,
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    'Near Main MArket, Karachi',
                                    style: AppWidget.normalTextStyle(18),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                'Discover New Places',
                style: AppWidget.headlineTextStyle(22),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 280,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20,bottom: 5),
                    child: Material(
                      elevation: 2,
                      borderRadius: BorderRadius.circular(30),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                    
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadiusGeometry.circular(30),
                              child: Image.asset(
                                'assets/images/mumbai.jpg',
                                height: 200,
                                width: 180,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(height: 10),
                            Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Text(
                                'Mumbai',
                                style: AppWidget.headlineTextStyle(20),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Row(
                                children: [
                                  Icon(Icons.hotel, color: Colors.blue),
                                  SizedBox(width: 5),
                                  Text(
                                    '10 Hotels',
                                    style: AppWidget.normalTextStyle(18),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20, bottom: 5),
                    child: Material(
                      elevation: 2,
                      borderRadius: BorderRadius.circular(30),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            ClipRRect(
                              borderRadius: BorderRadiusGeometry.circular(30),
                              child: Image.asset(
                                'assets/images/newyork.jpg',
                                height: 200,
                                width: 180,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(height: 10),
                            Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Text(
                                'New York',
                                style: AppWidget.headlineTextStyle(20),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Row(
                                children: [
                                  Icon(Icons.hotel, color: Colors.blue),
                                  SizedBox(width: 5),
                                  Text(
                                    '8 Hotels',
                                    style: AppWidget.normalTextStyle(18),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20, bottom: 5),
                    child: Material(
                      elevation: 2,
                      borderRadius: BorderRadius.circular(30),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadiusGeometry.circular(30),
                              child: Image.asset(
                                'assets/images/bali.jpg',
                                height: 200,
                                width: 180,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(height: 10),
                            Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Text(
                                'Bali',
                                style: AppWidget.headlineTextStyle(20),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Row(
                                children: [
                                  Icon(Icons.hotel, color: Colors.blue),
                                  SizedBox(width: 5),
                                  Text(
                                    '5 Hotels',
                                    style: AppWidget.normalTextStyle(18),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                Container(
                    margin: EdgeInsets.only(left: 20, bottom: 5),
                    child: Material(
                      elevation: 2,
                      borderRadius: BorderRadius.circular(30),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadiusGeometry.circular(30),
                              child: Image.asset(
                                'assets/images/dubai.jpg',
                                height: 200,
                                width: 180,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(height: 10),
                            Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Text(
                                'Dubai',
                                style: AppWidget.headlineTextStyle(20),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Row(
                                children: [
                                  Icon(Icons.hotel, color: Colors.blue),
                                  SizedBox(width: 5),
                                  Text(
                                    '7 Hotels',
                                    style: AppWidget.normalTextStyle(18),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                
                ],
              ),
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
