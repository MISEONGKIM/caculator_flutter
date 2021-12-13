import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String sum = '';
  TextEditingController value1 = TextEditingController(); //텍스트필드 다루려면 TextEditingController 설정해야함.
  TextEditingController value2 = TextEditingController();

  String _buttonText = '';
  List _buttonList = ['더하기', '빼기', '곱하기', '나누기'];
  List<DropdownMenuItem<String>> _dropDownMenuItems = [];

  @override
  void initState() {
    super.initState();
    for (var item in _buttonList) {
      _dropDownMenuItems.add(DropdownMenuItem(value: item, child: Text(item)));
     }
    _buttonText = _dropDownMenuItems[0].value as String;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(15), //사방으로 모든 공간에 여백 생성
                child: Text('결과 : $sum', style: TextStyle(fontSize: 20),),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20), // 사방면 중 원하는 값을 넣어 여백줌.
                child:   TextField(controller: value1, keyboardType: TextInputType.number,),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child:   TextField(controller: value2, keyboardType: TextInputType.number,),
              ),
                Padding(
                padding: EdgeInsets.all(15), //사방으로 모든 공간에 여백 생성
                child: RaisedButton(
                  child: Text(_buttonText),
                  color: Colors.amber,
                  onPressed: () {
                    setState(() {
                      double tmp = 0;
                      int v1 = int.parse(value1.value.text);
                      int v2 = int.parse(value2.value.text);
                      _buttonText == '더하기' ? (tmp = v1 + v2  as double): 
                        _buttonText == '빼기' ? (tmp = v1 - v2  as double) :
                        _buttonText == '곱하기' ? (tmp = v1 * v2  as double) :
                          (tmp = v1 / v2);
                      sum = tmp.toString();
                    });
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child:  DropdownButton(
                    items: _dropDownMenuItems, //펼침 버튼에 표시할 아이템 목록
                    onChanged: (value) {
                      setState(() {
                        _buttonText = value as String;
                      });
                    },
                    value: _buttonText,
              ),

              ),
             ],
          ),
        ),
      ),
    );
  }
}
