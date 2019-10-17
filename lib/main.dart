import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'ACM Event Review Platform'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController Username=TextEditingController();
  final TextEditingController Password=TextEditingController();
  bool _obscureText=true;
  Color _color;
  void toggle() {
    setState(() {
      _obscureText = !_obscureText;
      _color=_obscureText? Colors.black:Colors.red[600];
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return Scaffold(
        backgroundColor: Colors.blue[100],
        resizeToAvoidBottomInset: true,
        body: Center(
            child: Container(
                margin: EdgeInsets.only(left: 30.0, right: 30.0),
                height: 300.0,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    boxShadow: [
                      BoxShadow(color: Colors.black,
                          offset: Offset(1.0, 3.0),
                          blurRadius: 13.0,
                          spreadRadius: -10.0)
                    ]
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          margin: EdgeInsets.only(
                              left: 24.0, right: 24.0, bottom: 10.0),
                          padding: EdgeInsets.only(
                              left: 30.0, right: 30.0, top: 14.0, bottom: 14.0),
                          child: Center(
                                  child:TextField(
                                controller: Username,
                                decoration: InputDecoration.collapsed(
                                  hintText: "Username",),
                              )),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.blue[100])),
                      Container(
                          margin: EdgeInsets.only(
                              left: 24.0, right: 24.0, top: 10.0),
                          padding: EdgeInsets.only(
                              left: 30.0, right: 0.0, top: 0, bottom: 0),
                          child: Center(
                            child:Row(
                                mainAxisSize: MainAxisSize.min,
                                children:[Expanded(child:TextFormField(
                              controller: Password,
                              decoration: InputDecoration(hintText: "Password",
                                  border: InputBorder.none,
                              ),
                              obscureText: _obscureText,
                            )),
                                    FlatButton(onPressed: toggle,
                                    child: Icon(Icons.remove_red_eye, color: _color,),
                                  shape: CircleBorder(),
                                )
                            ]),
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(70),
                              color: Colors.blue[100]))
                    ]
                )
            )
        )
    );

  }
}
