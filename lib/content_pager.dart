


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterdemo/card_free.dart';
import 'package:flutterdemo/card_recommend.dart';
import 'package:flutterdemo/card_share.dart';
import 'package:flutterdemo/card_special.dart';
import 'package:flutterdemo/custom_appbar.dart';

class ContentPager extends StatefulWidget {

  final ValueChanged<int> onPageChanged;
  final ContentPageController contentPageController;
//构造方法，可选参数
  const ContentPager({Key key, this.onPageChanged, this.contentPageController}) :
        //初始化列表
        super(key: key);
  @override
  _ContentPagerState createState() => _ContentPagerState();
}

class _ContentPagerState extends State<ContentPager> {

  PageController _pageController = PageController(
    /**
     * 视窗比例
     */
    viewportFraction: 0.8
  );
  static List<Color> _colors = [
    Colors.blue,
    Colors.red,
    Colors.deepOrange,
    Colors.teal,
  ];

  @override
  //第一个生命周期方法
  void initState() {
    if(widget.contentPageController != null){
      widget.contentPageController._pageController = _pageController;
    }
    _statusBar();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        //appBar
        CustomAppBar(),
        Expanded(
          //高度撑开，否则在Column中没有高度会报错
          child: PageView(
            onPageChanged: widget.onPageChanged,
          controller: _pageController,
          children: <Widget>[
          _wrapItem(CardRecommed()),
          _wrapItem(CardShare()),
          _wrapItem(CardFree()),
          _wrapItem(CardSpecial()),
          ],
        ),)
      ],
    );
  }
  Widget _wrapItem(Widget widget){
    return Padding(padding: EdgeInsets.all(10),
    child:widget,
    );
  }
  ///沉浸式状态栏
  _statusBar(){
    SystemUiOverlayStyle uiOverlayStyle = SystemUiOverlayStyle(
      systemNavigationBarColor: Color(0xFF000000),
      systemNavigationBarDividerColor: null,
      statusBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    );
    SystemChrome.setSystemUIOverlayStyle(uiOverlayStyle );
  }
}

///内容区域的控制器
class ContentPageController{
  PageController _pageController;
  void jumpToPage(int page){
    //?.安全调用
    _pageController?.jumpToPage(page);

  }
}
