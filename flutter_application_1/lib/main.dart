// ignore_for_file: use_super_parameters

import 'package:flutter/material.dart';
import 'dart:async';
import 'landing_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PulseUP',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
        fontFamily: 'Roboto',
      ),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _progressValue = 0.0;
  
  @override
  void initState() {
    super.initState();
    _startLoading();
    
    // Auto navigate after 3 seconds regardless of progress bar
    Timer(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const LandingPage()),
        );
      }
    });
  }

  void _startLoading() {
    Timer.periodic(const Duration(milliseconds: 30), (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }
      
      setState(() {
        _progressValue += 0.01;
        // Progress bar will reach about 90% in 3 seconds
        if (_progressValue >= 1.0) {
          timer.cancel();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(flex: 2),
            _buildLogo(),
            const Spacer(flex: 1),
            _buildProgressBar(),
            const SizedBox(height: 10),
            const Text(
              'Loding...',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
            const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }

Widget _buildLogo() {
  return Image.asset(
    'assets/images/pulseup_logo.png',
    width: 200, // Adjust the width as needed
    height: 100, // Adjust the height as needed
    fit: BoxFit.contain,
  );
}

// Removed duplicate _buildLogo method

  Widget _buildProgressBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: LinearProgressIndicator(
          value: _progressValue,
          backgroundColor: Colors.grey[300],
          valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF7E57C2)),
          minHeight: 10,
        ),
      ),
    );
  }
}

