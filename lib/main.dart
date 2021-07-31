

import 'package:flatter_ui2/color_picker_app.dart';
import 'package:flatter_ui2/color_picker_tabs-app.dart';
import 'package:flatter_ui2/image_picker_app.dart';
import 'package:flatter_ui2/multi_image_app.dart';
import 'package:flatter_ui2/text_form_app.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ColorPickerTabsApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 double _value=0.0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(

        child:Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
    //         Transform.rotate(h: _value,
    // height: _value,
    // color: Colors.green,
    // ),
    // ),
    // Text('value : ${_value.round()}'),
             Container(
               padding: EdgeInsets.symmetric(horizontal: 20),
               transform: Matrix4.rotationZ(_value),
               child: Text('My Shop',style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),),
               decoration: BoxDecoration(
                   color: Colors.deepOrange,
                 borderRadius: BorderRadius.circular(10),
                 boxShadow: [BoxShadow(
                   color: Colors.black,
                   blurRadius: 10
                 )]
               ),
             ),
          Slider(value: _value, onChanged: (double val){
            setState(() {
              _value=val;
            });
          }
          ,min: 0,
          max: 100,
          inactiveColor: Colors.red,
          activeColor: Colors.green,)

          ],
        )
      ),
       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
