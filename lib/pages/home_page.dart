import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController typeController = TextEditingController();
  String showText = '欢迎来到王者荣耀';
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          appBar: AppBar(
            title: Text('首页'),
          ),
          body: SingleChildScrollView(         //  SingleChildScrollView 解决输入框弹起时界面超出问题
            child: Container(
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: typeController,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10.0),
                        labelText: '什么类型',
                        helperText: '请输入你喜欢的类型'),
                    autofocus: false,
                  ),
                  RaisedButton(
                    onPressed: _choose,
                    child: Text('选择完毕'),
                  ),
                  Text(
                    showText,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  )
                ],
              ),
            ),
          )),
    );
  }

  void _choose() {
    if (typeController.text.toString() == '') {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text('请填写你想搜索的东东？？？'),
              ));
    } else {
      getData(typeController.text.toString()).then((res) {
        print(res);
        setState(() {
          showText = res['data']['name'].toString();
        });
      });
    }
  }

  Future getData(String typeText) async {
    try {
      Response response;
      var data = {'name': typeText};
      response = await Dio().post(
          'https://www.easy-mock.com/mock/5e204e38e1c2cf1d346e0ddd/example/big__bear',
          queryParameters: data
          );
      return response.data;
    } catch (e) {
      return print(e);
    }
  }
}
