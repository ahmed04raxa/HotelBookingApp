import 'package:bookingapp/repository/screens/home/detail_screen.dart';
import 'package:bookingapp/services/widget_support.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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

            // StreamBuilder(
            //   stream: FirebaseFirestore.instance
            //       .collection('Hotel')
            //       .snapshots(),
            //   builder: (context, snapshot) {
            //     return SizedBox(
            //       height: 330,
            //       child: ListView.builder(
            //         scrollDirection: Axis.horizontal,
            //         shrinkWrap: true,
            //         itemCount: snapshot.data!.docs.length,
            //         itemBuilder: (context, index) {
            //           return GestureDetector(
            //             onTap: () {
            //               Navigator.push(
            //                 context,
            //                 MaterialPageRoute(
            //                   builder: (context) => DetailScreen(
            //                     imgUrl: snapshot.data!.docs[index]['imgUrl'],
            //                     name: snapshot.data!.docs[index]['hotelName'],
            //                     price: snapshot.data!.docs[index]['hotelCharges'],
            //                     wifi: snapshot.data!.docs[index]['services']['wifi'],
            //                     hdtv: snapshot.data!.docs[index]['services']['tv'],
            //                     kitchen:
            //                         snapshot.data!.docs[index]['services']['kitchen'],
            //                     bathroom:
            //                         snapshot.data!.docs[index]['services']['bathroom'],
            //                     desc: snapshot.data!.docs[index]['hotelDescription'],
            //                   ),
            //                 ),
            //               );
            //             },
            //             child: Container(
            //               margin: EdgeInsets.only(left: 20, bottom: 5),
            //               child: Material(
            //                 elevation: 2,
            //                 borderRadius: BorderRadius.circular(30),
            //                 child: Container(
            //                   decoration: BoxDecoration(
            //                     color: Colors.white,
            //                     borderRadius: BorderRadius.only(
            //                       bottomLeft: Radius.circular(30),
            //                       bottomRight: Radius.circular(30),
            //                     ),
            //                   ),
            //                   child: Column(
            //                     crossAxisAlignment: CrossAxisAlignment.start,
            //                     children: [
            //                       ClipRRect(
            //                         borderRadius: BorderRadius.circular(30),
            //                         child: Image.network(
            //                           snapshot.data!.docs[index]['imgUrl'],
            //                           width:
            //                               MediaQuery.of(context).size.width /
            //                               1.2,
            //                           height: 230,
            //                           fit: BoxFit.cover,
            //                         ),
            //                       ),
            //                       SizedBox(height: 10),
            //                       Padding(
            //                         padding: EdgeInsets.only(left: 20),
            //                         child: Row(
            //                           children: [
            //                             Text(
            //                               snapshot
            //                                   .data!
            //                                   .docs[index]['hotelName'],
            //                               style: AppWidget.headlineTextStyle(
            //                                 24,
            //                               ),
            //                             ),
            //                             SizedBox(
            //                               width:
            //                                   MediaQuery.of(
            //                                     context,
            //                                   ).size.width /
            //                                   3.2,
            //                             ),
            //                             Text(
            //                               '\$${snapshot.data!.docs[index]['hotelCharges']}',
            //                               style: AppWidget.headlineTextStyle(
            //                                 25,
            //                               ),
            //                             ),
            //                           ],
            //                         ),
            //                       ),
            //                       SizedBox(height: 10),
            //                       Padding(
            //                         padding: EdgeInsets.only(left: 13),
            //                         child: Row(
            //                           children: [
            //                             Icon(
            //                               Icons.location_on,
            //                               color: Colors.blue,
            //                               size: 30,
            //                             ),
            //                             SizedBox(width: 5),
            //                             Text(
            //                               snapshot
            //                                   .data!
            //                                   .docs[index]['hotelAddress'],
            //                               style: AppWidget.normalTextStyle(18),
            //                             ),
            //                           ],
            //                         ),
            //                       ),
            //                     ],
            //                   ),
            //                 ),
            //               ),
            //             ),
            //           );
            //         },
            //       ),
            //     );
            //   },
            // ),
            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('Hotel')
                  .snapshots(),
              builder: (context, snapshot) {
                // 🔹 1. Loading state
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return SizedBox(
                    height: 330,
                    child: Center(child: CircularProgressIndicator()),
                  );
                }

                // 🔹 2. Error state
                if (snapshot.hasError) {
                  return SizedBox(
                    height: 330,
                    child: Center(child: Text("Something went wrong")),
                  );
                }

                // 🔹 3. No data state
                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return SizedBox(
                    height: 330,
                    child: Center(child: Text("No Hotels Available")),
                  );
                }

                // 🔹 4. Data available
                return SizedBox(
                  height: 330,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      var hotel = snapshot.data!.docs[index];

                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailScreen(
                                imgUrl: hotel['imgUrl'],
                                name: hotel['hotelName'],
                                price: hotel['hotelCharges'],
                                wifi: hotel['services']['wifi'],
                                hdtv: hotel['services']['tv'],
                                kitchen: hotel['services']['kitchen'],
                                bathroom: hotel['services']['bathroom'],
                                desc: hotel['hotelDescription'],
                              ),
                            ),
                          );
                        },
                        child: Container(
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
                                    child: Image.network(
                                      snapshot.data!.docs[index]['imgUrl'],
                                      width:
                                          MediaQuery.of(context).size.width /
                                          1.2,
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
                                          snapshot
                                              .data!
                                              .docs[index]['hotelName'],
                                          style: AppWidget.headlineTextStyle(
                                            24,
                                          ),
                                        ),
                                        SizedBox(
                                          width:
                                              MediaQuery.of(
                                                context,
                                              ).size.width /
                                              3.2,
                                        ),
                                        Text(
                                          '\$${snapshot.data!.docs[index]['hotelCharges']}',
                                          style: AppWidget.headlineTextStyle(
                                            25,
                                          ),
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
                                          snapshot
                                              .data!
                                              .docs[index]['hotelAddress'],
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
                      );
                    },
                  ),
                );
              },
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
