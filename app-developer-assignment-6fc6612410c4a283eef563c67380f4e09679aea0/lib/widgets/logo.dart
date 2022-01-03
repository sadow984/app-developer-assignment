import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final size;

  const Logo({Key? key, this.size}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final siz = size ?? 160.0;
    return Hero(
      tag: 'logo',
      child: Card(
        borderOnForeground: true,
        elevation: 6.0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(siz / 2)),
        child: Container(
          height: siz,
          width: siz,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage('assets/gametv.jpg'),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}