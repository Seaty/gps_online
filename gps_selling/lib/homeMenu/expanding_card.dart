import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:gps_selling/homeMenu/homeData.dart';

class HomeExpandingCard extends StatefulWidget {
  HomeExpandingCard({Key key, this.title, this.detail}) : super(key: key);

  final String title;
  final List<Widget> detail;

  @override
  _HomeExpandingCardState createState() => _HomeExpandingCardState();
}

class _HomeExpandingCardState extends State<HomeExpandingCard> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return ExpansionTileCard(
      contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      title: Text(
        widget.title,
        style: TextStyle(
          fontSize: checkscreenwidth(screenWidth, 36.667),
        ),
      ),
      children: widget.detail,
    );
  }
}
