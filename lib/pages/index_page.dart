import 'package:flutter/material.dart'; // material design 风格组件
import 'package:flutter/cupertino.dart'; // ios风格组件

// pages
import './home_page.dart';
import './category_page.dart';
import './cart_page.dart';
import './member_page.dart';

class indexPage extends StatefulWidget {
  @override
  _indexPageState createState() => _indexPageState();
}

class _indexPageState extends State<indexPage> {
  final List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), title: Text('首页')),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.search), title: Text('分类')),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.shopping_cart), title: Text('购物车')),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.profile_circled), title: Text('会员中心'))
  ];

  final List tabList = [HomePage(), CategoryPage(), CartPage(), MemberPage()];

  int currentIndex = 0;

  var currentPage;
  @override
  void initState() {
    // TODO: implement initState
    currentPage = tabList[currentIndex];
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 245, 245, 1.0),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        items: bottomTabs,
        onTap: (index) {
          setState(() {
            currentIndex = index;
            currentPage = tabList[currentIndex];
          });
        },
      ),
      body: currentPage,  //  显示当前的页面
    );
  }
}
