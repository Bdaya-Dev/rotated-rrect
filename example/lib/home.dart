import 'package:flutter/material.dart';
import 'package:rotated_rrect/rotated_rrect.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double percentage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Flexible(
              flex: 1,
              child: Slider(
                value: percentage,
                onChanged: (newVal) => setState(() => percentage = newVal),
                max: 100,
                min: 0,
              ),
            ),
            Flexible(
              flex: 1,
              child: ClipPath(
                child: Container(
                  color: Colors.red,
                ),
                clipper: RotatedRRectClipper(percentage, minH1: true),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
