
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class ColorPickerApp extends StatelessWidget {
  const ColorPickerApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ColorPickerApp1(),
    );
  }
}

class ColorPickerApp1 extends StatefulWidget {
  const ColorPickerApp1({Key? key}) : super(key: key);

  @override
  _ColorPickerApp1State createState() => _ColorPickerApp1State();
}

class _ColorPickerApp1State extends State<ColorPickerApp1> {
  Color _color=Colors.red;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Color Picker'),
      ),
      body:Center(
        child: RaisedButton(
          color:_color ,
          child: Text('choose color',style: TextStyle(color: Colors.white),),
          onPressed: (){
            var x=AlertDialog(
              title: Text('choose color'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                  children: [
                    SingleChildScrollView(
                      child: BlockPicker(pickerColor: _color, onColorChanged: (c){
                        setState(() {
                          _color=c;
                        });
                      },
                      //availableColors: [Colors.red,],
                )

                    ),
                    SizedBox(height: 20,),
                    RaisedButton(onPressed: ()=>Navigator.of(context).pop(),
                    child: Text('close'),)
                  ],
                ),


            );
            showDialog(context: context, builder: (ctx)=>x);
          },
        ),
      ) ,
    );
  }
}

