import 'dart:ui';

import 'package:flutter/material.dart';

class WaveContainer extends StatelessWidget {
  const WaveContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: Column(
        children: [
          Stack(
            children: [
              ClipPath(
                child: Opacity(
                  opacity: .5,
                  child: Container(
                    height: 300,
                    color: Colors.grey,
                  ),
                ),
                clipper: MyClipper(),
              ),
              ClipPath(
                child: Container(
                  height: 296,
                  color: Color(0xffDF1010),
                ),
                clipper: MyClipper(),
              ),
            ],
          ),
        ],
      )),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    var path = Path();
    path.lineTo(0.0, size.height - 70);
    var firstControlPoint = Offset(size.width / 3, size.height);
    var firstEndPoint = Offset(size.width, size.height - 170);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    path.lineTo(size.width, size.height / 2);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
