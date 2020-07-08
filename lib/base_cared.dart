import 'package:flutter/material.dart';

class BaseCard extends StatefulWidget {
  @override
  BaseCardState createState() => BaseCardState();
}

class BaseCardState extends State<BaseCard> {
  Color subTitleColor = Colors.grey;
  Color bottomTitleColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(6),
      clipBehavior: Clip.antiAlias,
      child: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
          children: <Widget>[topContent(), bottomContent()],
        ),
      ),
    );
  }

  bottomContent() {
    return Container();
  }

  topContent() {
    return Padding(
      padding: EdgeInsets.only(left: 20, top: 20, bottom: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[topTitle(''), topTitle2('')],
          ),
          subTitle('')
        ],
      ),
    );
  }

  Widget subTitle(String title) {
    return Padding(
      padding: EdgeInsets.only(top: 5),
      child: Text(
        title,
        style: TextStyle(fontSize: 11, color: subTitleColor),
      ),
    );
  }

  topTitle(String title) {
    return Text(
      title,
      style: TextStyle(fontSize: 22),
    );
  }

  topTitle2(String title) {
    return Container();
  }

  bottomTitle(String title) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 12, color: bottomTitleColor),
    );
  }
}
