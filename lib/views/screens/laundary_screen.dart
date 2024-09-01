import 'package:flutter/material.dart';

class LaundaryScreen extends StatefulWidget {
  const LaundaryScreen({ Key? key }) : super(key: key);

  @override
  _LaundaryScreenState createState() => _LaundaryScreenState();
}

class _LaundaryScreenState extends State<LaundaryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('준비중...'),
      ),
    );
  }
}