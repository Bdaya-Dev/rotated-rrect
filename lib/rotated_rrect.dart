library rotated_rrect;

import 'dart:math';

import 'package:dart_numerics/dart_numerics.dart';
import 'package:flutter/widgets.dart';
import 'package:vector_math/vector_math_64.dart';

Path getRotatedRRectPath(Size s, double w1Percent, {bool minH1 = false}) {
  var p = Path();

  var ws = s.width;
  var hs = s.height;
  var w1 = ws * (w1Percent / 100);
  var w2 = ws - w1;

  var insideSqrt = (pow(hs, 2) - 4 * w1 * w2);
  print('insideSqrt= $insideSqrt');
  var h1p1 = (hs + sqrt(insideSqrt)) / 2;
  var h1p2 = (hs - sqrt(insideSqrt)) / 2;
  var h1 = minH1 ? min(h1p1, h1p2) : max(h1p1, h1p2);
  var h2 = hs - h1;
  var theta = atan2(w1, h1);
  print(theta * 180 / pi);

  var x1 = Offset(0, h1);
  var x2 = Offset(w1, 0);
  var x3 = Offset(ws, h2);
  var x4 = Offset(w2, hs);

  p.moveTo(x1.dx, x1.dy);
  p.lineTo(x2.dx, x2.dy);
  p.lineTo(x3.dx, x3.dy);
  p.lineTo(x4.dx, x4.dy);
  p.lineTo(x1.dx, x1.dy);
  return p;
}

class RotatedRRectClipper extends CustomClipper<Path> {
  final double w1Percent;
  final bool minH1;
  RotatedRRectClipper(this.w1Percent, {this.minH1 = false});
  @override
  Path getClip(Size size) {
    return getRotatedRRectPath(size, w1Percent, minH1: minH1);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
