import 'package:flutter/material.dart';
import 'package:flutterdemo/base_cared.dart';

///本周推荐
class CardRecommed extends BaseCard {
  @override
  _CardRecommendState createState() => _CardRecommendState();
}

class _CardRecommendState extends BaseCardState {
  @override
  void initState() {
    subTitleColor = Color(0xffb99444);
    super.initState();
  }

  @override
  bottomContent() {
    // TODO: implement bottomContent
    return Expanded(
      child: Container(
        //margin: EdgeInsets.only(top: 20),
        child: Image.network(
          'http://www.devio.org/io/flutter_beauty/card_1.jpg',
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
      ),
    );
  }

  @override
  topTitle(String title) {
    // TODO: implement topTitle
    return super.topTitle('本周推荐');
  }

  @override
  Widget subTitle(String title) {
    // TODO: implement subTitle
    return super.subTitle('送你一天无限卡，全场书籍免费读');
  }
}
