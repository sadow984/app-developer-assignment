import 'package:flutter/material.dart';

class RecommendedCard extends StatelessWidget {
  const RecommendedCard(
      {Key? key,
      required this.coverUrl,
      required this.name,
      required this.gameName})
      : super(key: key);

  final String coverUrl;
  final String name;
  final String gameName;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(
            height: 100,
            child: Image.network(
              coverUrl,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fill,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Column(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding:
                            const EdgeInsets.only(top: 8, left: 8, right: 8),
                        child: Text(
                          name.trim(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      alignment: Alignment.centerLeft,
                      padding:
                          const EdgeInsets.only(bottom: 8, left: 8, right: 8),
                      child: Text(gameName.trim()),
                    ),
                  ],
                ),
              ),
              IconButton(
                  onPressed: () {}, icon: Icon(Icons.navigate_next_rounded))
            ],
          ),
        ],
      ),
    );
  }
}
