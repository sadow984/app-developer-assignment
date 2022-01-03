import 'package:flutter/material.dart';
import 'package:project/widgets/info_card.dart';

class HeaderPageInfo extends StatelessWidget {
  const HeaderPageInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
          color: Colors.red),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Expanded(
              child: InfoCard(
                  color: Colors.orange,
                  score: "34",
                  scoreType: "Tournaments Played")),
          Expanded(
              child: InfoCard(
                  color: Colors.purple,
                  score: "10",
                  scoreType: "Tournaments Won")),
          Expanded(
              child: InfoCard(
                  color: Colors.pink,
                  score: "45%",
                  scoreType: "Winning percentage")),
        ],
      ),
    );
  }
}
