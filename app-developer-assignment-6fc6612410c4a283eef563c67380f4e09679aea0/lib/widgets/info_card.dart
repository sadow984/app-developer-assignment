import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  const InfoCard(
      {required this.color,
      required this.score,
      required this.scoreType,
      Key? key})
      : super(key: key);

  final Color color;
  final String score;
  final String scoreType;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: color,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            score,
            style: TextStyle(color: Colors.white),
          ),
          Text(
            scoreType,
            maxLines: 2,
            style: TextStyle(color: Colors.white),
          )
        ],
        mainAxisSize: MainAxisSize.min,
      ),
    );
  }
}
