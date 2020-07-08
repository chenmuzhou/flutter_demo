import 'package:flutter/material.dart';
import 'package:flutterdemo/base_cared.dart';

class CardShare extends BaseCard {
  @override
  _CardShareState createState() => _CardShareState();
}

class _CardShareState extends BaseCardState {
  @override
  bottomContent() {
    // TODO: implement bottomContent
    return Expanded(
        child: Container(
      decoration: BoxDecoration(color: Color(0xfff6f7f9)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,//水平向右
        children: <Widget>[
          Expanded(
              child: Padding(
            padding: EdgeInsets.only(top: 20, left: 15, bottom: 20),
            child: Image.network(
                'http://www.devio.org/io/flutter_beauty/card_list.png'),
          )),
          Container(
            alignment: AlignmentDirectional.center,//重写父布局的位置约束，位于父布局的中间
             child: Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: bottomTitle('20012154015人参加活动'),
              )
          )

        ],
      ),
    ));
  }

  @override
  topTitle(String title) {
    // TODO: implement topTitle
    return super.topTitle('分享得联名卡');
  }

  @override
  Widget subTitle(String title) {
    return super.subTitle('分享给朋友');
  }

  @override
  topTitle2(String title) {
    // TODO: implement topTitle2
    return Padding(
        padding: EdgeInsets.only(bottom: 5),
        child: Text(
          '/第19期',
          style: TextStyle(fontSize: 10),
        ));
  }
}
