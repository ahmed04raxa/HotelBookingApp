import 'package:bookingapp/repository/screens/booking/booking_screen.dart';
import 'package:bookingapp/repository/screens/home/home_screen.dart';
import 'package:bookingapp/repository/screens/profile/profile_screen.dart';
import 'package:bookingapp/repository/screens/wallet/wallet_screen.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  final _pages = [
    HomeScreen(),
    BookingScreen(),
    WalletScreen(),
    ProfileScreen(),
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        height: 70,
        backgroundColor: Colors.white,
        color: Colors.black,
        animationDuration: Duration(milliseconds: 500),
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          Icon(Icons.home, color: Colors.white, size: 30),
          Icon(Icons.shopping_bag, color: Colors.white, size: 30),
          Icon(Icons.wallet, color: Colors.white, size: 30),
          Icon(Icons.person, color: Colors.white, size: 30),
        ],
      ),
    );
  }
}
