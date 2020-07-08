import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterdemo/content_pager.dart';

///底部导航框架
class TanNavigator extends StatefulWidget {
  @override
  _TanNavigatorState createState() => _TanNavigatorState();
}

class _TanNavigatorState extends State<TanNavigator> {
  final _defaultColor = Colors.grey;
  final _faultColor = Colors.blue;
  int _currentIndex = 0;
  final ContentPageController _contentPageController = ContentPageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(

            ///从上到下的线性颜色渐变
            gradient: LinearGradient(
          colors: [
            Color(0xffedeef0),
            Color(0xffedeef0),
          ],
          begin: Alignment.topCenter,
          end: Alignment.topCenter,
        )),
        child: ContentPager(
          contentPageController: _contentPageController,
          onPageChanged: (int index){
            setState(() {
              _currentIndex = index;
            });
          },
        ),
//        Center(
//          child: Text(
//            '你点击了第$_currentIndex个Tab',
//            style: TextStyle(fontSize: 36, color: Colors.blue),
//          ),
//        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          //控制内容区域滚动到指定位置
          _contentPageController.jumpToPage(index);
          //修改状态
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          _bottomItem("本周", Icons.folder, 0),
          _bottomItem("分享", Icons.explore, 1),
          _bottomItem("免费", Icons.donut_small, 2),
          _bottomItem("长安", Icons.person, 3)
        ],
      ),
    );
    

  }

  ///封装底部tab
  _bottomItem(String title, IconData icon, int index) {
    return BottomNavigationBarItem(
        icon: Icon(
          icon,
          color: _defaultColor,
        ),
        activeIcon: Icon(
          icon,
          color: _faultColor,
        ),
        title: Text(
          title,
          style: TextStyle(
              color: _currentIndex != index ? _defaultColor : _defaultColor),
        ));
  }
}
