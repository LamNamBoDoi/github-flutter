import 'package:flutter/material.dart';

class LogoFaceWidget extends StatelessWidget {
  final double width;
  final double height;

  LogoFaceWidget({required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: Stack(
        children: [
          Container(
            color: Colors.white,
          ),
          Positioned(
            height: height * 0.18,
            width: width,
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(70),
                      topRight: Radius.circular(40),
                      bottomRight: Radius.circular(40))),
            ),
          ),
          Positioned(
            top: height * 0.18,
            left: 0,
            height: height * 0.37,
            width: width,
            child: Container(
              color: Colors.blue,
            ),
          ),
          Positioned(
              top: height * 0.18,
              left: 0,
              width: width + 1,
              height: height * 0.37 + 1,
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(50))),
              )),
          Positioned(
            top: height * 0.41,
            height: height * 0.18,
            width: width * 0.75,
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(70),
                      topRight: Radius.circular(40),
                      bottomRight: Radius.circular(40))),
            ),
          ),
          Positioned(
            top: height * 0.59,
            left: 0,
            height: height * 0.37,
            width: width,
            child: Container(
              color: Colors.blue,
            ),
          ),
          Positioned(
              top: height * 0.59,
              left: 0,
              width: width + 1,
              height: height * 0.37 + 1,
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(50))),
              )),
        ],
      ),
    );
  }
}
