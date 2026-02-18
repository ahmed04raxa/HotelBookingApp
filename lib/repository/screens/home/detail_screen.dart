import 'package:bookingapp/services/widget_support.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
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
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    ),
                    child: Image.asset(
                      'assets/images/hotel1.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => {Navigator.pop(context)},
                  child: Container(
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.only(top: 50, left: 20),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(60),
                    ),
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Text('Hotel Beach', style: AppWidget.headlineTextStyle(27)),
                  Text('\$20', style: AppWidget.normalTextStyle(22)),
                  Divider(thickness: 2),
                  SizedBox(height: 10),
                  Text(
                    'What this place offers',
                    style: AppWidget.headlineTextStyle(22),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Icon(
                        Icons.wifi,
                        color: Color.fromARGB(255, 7, 102, 179),
                        size: 30,
                      ),
                      SizedBox(width: 10),
                      Text('Wifi', style: AppWidget.normalTextStyle(23)),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Icon(
                        Icons.tv,
                        color: Color.fromARGB(255, 7, 102, 179),
                        size: 30,
                      ),
                      SizedBox(width: 10),
                      Text('Hd Tv', style: AppWidget.normalTextStyle(23)),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Icon(
                        Icons.kitchen,
                        color: Color.fromARGB(255, 7, 102, 179),
                        size: 30,
                      ),
                      SizedBox(width: 10),
                      Text('Kitchen', style: AppWidget.normalTextStyle(23)),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Icon(
                        Icons.bathroom,
                        color: Color.fromARGB(255, 7, 102, 179),
                        size: 30,
                      ),
                      SizedBox(width: 10),
                      Text('Bathroom', style: AppWidget.normalTextStyle(23)),
                    ],
                  ),
                  Divider(thickness: 2),
                  Text(
                    'About this place',
                    style: AppWidget.headlineTextStyle(22),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.',
                    style: AppWidget.normalTextStyle(16),
                  ),
                  SizedBox(height: 20),
                  Material(
                    elevation: 2,
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10),
                          Text(
                            '\$100 for 4 nights',
                            style: AppWidget.headlineTextStyle(20),
                          ),
                          Text(
                            'Check-in Date',
                            style: AppWidget.normalTextStyle(20),
                          ),
                          SizedBox(height: 3.0),
                          Divider(),
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Icon(
                                  Icons.calendar_month,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ),
                              SizedBox(width: 10),
                              Text(
                                '18,Feb-2026',
                                style: AppWidget.normalTextStyle(20),
                              ),
                            ],
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Check-out Date',
                            style: AppWidget.normalTextStyle(20),
                          ),
                          SizedBox(height: 3.0),
                          Divider(),
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Icon(
                                  Icons.calendar_month,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ),
                              SizedBox(width: 10),
                              Text(
                                '21,Feb-2026',
                                style: AppWidget.normalTextStyle(20),
                              ),
                            ],
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Number Of Guests',
                            style: AppWidget.normalTextStyle(20),
                          ),
                          SizedBox(height: 5),
                          Container(
                            padding: EdgeInsets.only(left: 20),
                            decoration: BoxDecoration(
                              color: Color(0XFFececf8),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "1",
                                hintStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(color: Colors.blue,borderRadius: BorderRadius.circular(10)),
                            child: Center(
                              child: Text(
                                'Book Now',
                                style: AppWidget.whiteTextStyle(22),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
