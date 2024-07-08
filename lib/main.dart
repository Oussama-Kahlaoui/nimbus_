import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart'; // Ensure firebase_options.dart exists and is configured
import 'pages/splash_screen.dart';
import 'pages/login_page.dart';
import 'pages/signup_page.dart';
import 'pages/map_page.dart';
import 'pages/directions_page.dart';
import 'pages/profile_page.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Import FirebaseAuth for authentication state checking

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Firebase',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/', // Start with the splash screen
      routes: {
        '/': (context) => SplashScreen(), // Add splash screen as the initial route
        '/login': (context) => LoginPage(),
        '/signup': (context) => SignupPage(),
        '/map': (context) => MapPage(),
        '/directions': (context) => DirectionsPage(),
        '/profile': (context) => ProfilePage(),
      },
    );
  }
}