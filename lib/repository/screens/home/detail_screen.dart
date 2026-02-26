import 'dart:convert';

import 'package:bookingapp/services/constants.dart';
import 'package:bookingapp/services/widget_support.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

// ignore: must_be_immutable
class DetailScreen extends StatefulWidget {
  String imgUrl, name, price, desc;
  bool wifi, hdtv, kitchen, bathroom;
  DetailScreen({
    super.key,
    required this.imgUrl,
    required this.name,
    required this.price,
    required this.wifi,
    required this.hdtv,
    required this.kitchen,
    required this.bathroom,
    required this.desc,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final TextEditingController guestsController = TextEditingController();
  int finalAmount = 0;
  DateTime? startDate;
  DateTime? endDate;
  int daysDifference = 1;

  @override
  void initState() {
    super.initState();
    finalAmount = int.parse(widget.price);
  }

  Future<void> _selectStartDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: startDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        startDate = picked;
        _calculateDifference();
      });
    }
  }

  Future<void> _selectEndDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: endDate ?? (startDate ?? DateTime.now()).add(Duration()),
      firstDate: startDate ?? DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        endDate = picked;
        _calculateDifference();
      });
    }
  }

  void _calculateDifference() {
    if (startDate != null && endDate != null) {
      daysDifference = endDate!.difference(startDate!).inDays;

      if (daysDifference <= 0) daysDifference = 1;

      int pricePerNight = int.parse(widget.price);
      int guests = int.tryParse(guestsController.text) ?? 1;

      setState(() {
        finalAmount = pricePerNight * daysDifference * guests;
      });
    }
  }

  String _formatDate(DateTime? date) {
    return date != null
        ? DateFormat("dd, MMM yyy").format(date)
        : "Select Date";
  }

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
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    ),
                    child: Image.network(widget.imgUrl, fit: BoxFit.cover),
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
                  Text(widget.name, style: AppWidget.headlineTextStyle(27)),
                  Text(
                    '\$${widget.price}',
                    style: AppWidget.normalTextStyle(22),
                  ),
                  Divider(thickness: 2),
                  SizedBox(height: 10),
                  Text(
                    'What this place offers',
                    style: AppWidget.headlineTextStyle(22),
                  ),
                  SizedBox(height: 20),
                  widget.wifi
                      ? Row(
                          children: [
                            Icon(
                              Icons.wifi,
                              color: Color.fromARGB(255, 7, 102, 179),
                              size: 30,
                            ),
                            SizedBox(width: 10),
                            Text('Wifi', style: AppWidget.normalTextStyle(23)),
                          ],
                        )
                      : Container(),
                  SizedBox(height: 20),
                  widget.hdtv
                      ? Row(
                          children: [
                            Icon(
                              Icons.tv,
                              color: Color.fromARGB(255, 7, 102, 179),
                              size: 30,
                            ),
                            SizedBox(width: 10),
                            Text('Hd Tv', style: AppWidget.normalTextStyle(23)),
                          ],
                        )
                      : Container(),
                  SizedBox(height: 20),
                  widget.kitchen
                      ? Row(
                          children: [
                            Icon(
                              Icons.kitchen,
                              color: Color.fromARGB(255, 7, 102, 179),
                              size: 30,
                            ),
                            SizedBox(width: 10),
                            Text(
                              'Kitchen',
                              style: AppWidget.normalTextStyle(23),
                            ),
                          ],
                        )
                      : Container(),
                  SizedBox(height: 20),
                  widget.bathroom
                      ? Row(
                          children: [
                            Icon(
                              Icons.bathroom,
                              color: Color.fromARGB(255, 7, 102, 179),
                              size: 30,
                            ),
                            SizedBox(width: 10),
                            Text(
                              'Bathroom',
                              style: AppWidget.normalTextStyle(23),
                            ),
                          ],
                        )
                      : Container(),
                  Divider(thickness: 2),
                  Text(
                    'About this place',
                    style: AppWidget.headlineTextStyle(22),
                  ),
                  SizedBox(height: 5),
                  Text(widget.desc, style: AppWidget.normalTextStyle(16)),
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
                            "\$$finalAmount for $daysDifference nights",
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
                              GestureDetector(
                                onTap: () {
                                  _selectStartDate(context);
                                },
                                child: Container(
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
                              ),
                              SizedBox(width: 10),
                              Text(
                                _formatDate(startDate),
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
                              GestureDetector(
                                onTap: () {
                                  _selectEndDate(context);
                                },
                                child: Container(
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
                              ),
                              SizedBox(width: 10),
                              Text(
                                _formatDate(endDate),
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
                              onChanged: (value) {
                                int guests = int.tryParse(value) ?? 1;

                                int pricePerNight = int.parse(widget.price);
                                int nights = daysDifference <= 0
                                    ? 1
                                    : daysDifference;

                                setState(() {
                                  finalAmount = pricePerNight * nights * guests;
                                });
                              },
                              controller: guestsController,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
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
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(10),
                            ),
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

  // Map<String, dynamic>? paymentIntent;
  // Future<void> makePayment(String amount) async {
  //   try {
  //     paymentIntent = await createPaymentIntent(amount, 'AED');
  //     await Stripe.instance
  //         .initPaymentSheet(
  //           paymentSheetParameters: SetupPaymentSheetParameters(
  //             paymentIntentClientSecret: paymentIntent!['client_secret'],
  //             style: ThemeMode.dark,
  //             merchantDisplayName: 'Adnan',
  //           ),
  //         )
  //         .then((value) {});
  //     displayPaymentSheet(amount);
  //   } catch (e, s) {
  //     print('Exception : $e,$s');
  //   }
  // }

  // displayPaymentSheet(String amount) async {
  //   try {
  //     await Stripe.instance
  //         .presentPaymentSheet()
  //         .then((value) async {
  //           // ignore: use_build_context_synchronously
  //           showDialog(
  //             context: context,
  //             builder: (_) {
  //               return AlertDialog(
  //                 content: Column(
  //                   mainAxisSize: MainAxisSize.min,
  //                   children: [
  //                     Row(
  //                       children: [
  //                         Icon(Icons.check_circle, color: Colors.green),
  //                         Text("Payment Successfull"),
  //                       ],
  //                     ),
  //                   ],
  //                 ),
  //               );
  //               paymentIntent = null;
  //             },
  //           );
  //         })
  //         .onError((error, stackTrace) {
  //           print('Error is : ----> $error $stackTrace');
  //         });
  //   } on StripeException catch (e) {
  //     print('Error is : ----> $e');
  //     showDialog(
  //       context: context,
  //       builder: (_) => AlertDialog(content: Text("Cancelled")),
  //     );
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  // Future createPaymentIntent(String amount, String currency) async {
  //   try {
  //     Map<String, dynamic> body = {
  //       'amount': calculateAmount(amount),
  //       'currency': currency,
  //       'payment_method_types[]': 'card',
  //     };
  //     var response = await http.post(
  //       Uri.parse('https://api.stripe.com/v1/payment_intents'),
  //       headers: {
  //         'Authorization': 'Bearer $secretKey',
  //         'Content-Type': "application/x-www-form-urlencoded",
  //       },
  //       body: body,
  //     );
  //     return jsonDecode(response.body);
  //   } catch (err) {
  //     print('error charging user: ${err.toString()}');
  //   }
  // }
  Map<String, dynamic>? paymentIntent;

  Future<void> makePayment(String amount) async {
    try {
      paymentIntent = await createPaymentIntent(amount, 'USD');

      if (paymentIntent == null || paymentIntent!['client_secret'] == null) {
        throw Exception("Failed to get client secret");
      }

      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: paymentIntent!['client_secret'],
          merchantDisplayName: 'Adnan',
          style: ThemeMode.dark,
        ),
      );

      await displayPaymentSheet();
    } on StripeException catch (e) {
      print("Stripe error: ${e.error.localizedMessage}");
    } catch (e) {
      print("Error: $e");
    }
  }

  Future<void> displayPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet();

      if (!mounted) return;

      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          content: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(Icons.check_circle, color: Colors.green),
              SizedBox(width: 10),
              Text("Payment Successful"),
            ],
          ),
        ),
      );

      paymentIntent = null;
    } on StripeException catch (e) {
      print("Stripe Exception: $e");

      if (!mounted) return;

      showDialog(
        context: context,
        builder: (_) => const AlertDialog(content: Text("Payment Cancelled")),
      );
    } catch (e) {
      print("Unexpected error: $e");
    }
  }

  Future<Map<String, dynamic>?> createPaymentIntent(
    String amount,
    String currency,
  ) async {
    try {
      Map<String, dynamic> body = {
        'amount': calculateAmount(amount),
        'currency': currency,
        'payment_method_types[]': 'card',
      };

      var response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        headers: {
          'Authorization': 'Bearer $secretKey',
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: body,
      );

      if (response.statusCode != 200) {
        print("Stripe Error: ${response.body}");
        return null;
      }

      return jsonDecode(response.body);
    } catch (err) {
      print('Error charging user: $err');
      return null;
    }
  }

  String calculateAmount(String amount) {
    final calculatedAmount = (double.parse(amount) * 100).toInt();
    return calculatedAmount.toString();
  }
}
