import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class ColorPickerTabsApp extends StatelessWidget {
  const ColorPickerTabsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ColorPickerTabsApp1(),
    );
  }
}

class ColorPickerTabsApp1 extends StatefulWidget {
  const ColorPickerTabsApp1({Key? key}) : super(key: key);

  @override
  _ColorPickerTabsApp1State createState() => _ColorPickerTabsApp1State();
}

class _ColorPickerTabsApp1State extends State<ColorPickerTabsApp1> {
  Color _color=Colors.red;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController (length: 3, child: Scaffold(
      appBar: AppBar(
        title: Text('color picker'),
        bottom: TabBar(
          tabs: [
            Tab(text: 'CSV',),
            Tab(text: 'Material',),
            Tab(text: 'Block',),
          ],
        ),
      ),
      body:TabBarView(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RaisedButton(onPressed: (){
                  showDialog(context: context, builder: (context){
                    return AlertDialog(
                      title: Text('choose color'),
                      content: Column(
                        children: [
                          ColorPicker(pickerColor: _color, onColorChanged: (color){
                            setState(() {
                              _color=color;
                            });})
                        ],
                      ),
                    );
                  });
                },child: Text('Change me'),color:_color ,),
                SizedBox(height: 5,),
                RaisedButton(onPressed: (){
                  showDialog(context: context, builder: (context){
                    return AlertDialog(
                      title: Text('choose color'),
                      content: Column(
                        children: [
                          SlidePicker(pickerColor: _color, onColorChanged: (color){
                            setState(() {
                              _color=color;
                            });})
                        ],
                      ),
                    );
                  });
                },child: Text('Change me again'),color:_color ,),
              ],
            ),
          ),
          Center(child:  RaisedButton(
            onPressed: (){
            showDialog(context: context, builder: (context){
              return AlertDialog(
                title: Text('choose color'),
                content: Column(
                  children: [
                    MaterialPicker(pickerColor: _color, onColorChanged: (color){
                      setState(() {
                        _color=color;
                      });})
                  ],
                ),
              );
            });
          },child: Text('Change me'),color:_color ,),),
          Center(child:  RaisedButton(
            onPressed: (){
            showDialog(context: context, builder: (context){
              return AlertDialog(
                title: Text('choose color'),
                content:Column(
                  children: [
                    BlockPicker(pickerColor: _color, onColorChanged: (c){
                      setState(() {
                        _color=c;
                      });
                    }),
                    RaisedButton(onPressed: ()=>Navigator.of(context).pop(),child: Text('close'),)
                  ],
                ) ,
              );
            });

          }
          ,child: Text('Change me'),color:_color ,),),


        ],
      ) ,
    ));
  }
}

