import 'package:bookingapp/domain/constants/app_routes.dart';
import 'package:bookingapp/firebase_options.dart';
import 'package:bookingapp/services/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Supabase.initialize(
    url: 'https://radjdtxfdukwrpinbbkq.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJhZGpkdHhmZHVrd3JwaW5iYmtxIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzE3NDk0MDYsImV4cCI6MjA4NzMyNTQwNn0.TRoK03uNxKua6wGka_9O6PwJUFn4FAaQW3_kmavBjCs',
  );
  Stripe.publishableKey = publishedKey;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BOOKING APP',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: AppRoutes.bottomNavigationScreen,
      routes: AppRoutes.getRoutes(),
    );
  }
}
