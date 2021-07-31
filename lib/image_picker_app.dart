import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class ImagePickerApp extends StatelessWidget {
  const ImagePickerApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:ImagePickerApp1() ,
    );
  }
}


class ImagePickerApp1 extends StatefulWidget {
  const ImagePickerApp1({Key? key}) : super(key: key);

  @override
  _ImagePickerAppState createState() => _ImagePickerAppState();
}

class _ImagePickerAppState extends State<ImagePickerApp1> {

   File _image=File('file.txt');
  ImagePicker _picker=ImagePicker() ;


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: Text('Image Picker'),
        ),
        body:_image ==null?
        Center(child: Text('no image selected'),) :
      Image.file(_image),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add_a_photo),
          onPressed: (){
            var alert=AlertDialog(
              title: Text('choose your picture'),
              content: Container(
                height: 150,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Divider(color: Colors.red,thickness: 1.5,),
                    Card(
                      elevation: 30,
                      color: Colors.blue.shade300,
                      child: ListTile(
                        leading: Icon(Icons.image),
                        title: Text('gallery'),
                        onTap:()async{ await showPicker(ImageSource.gallery);},
                      ),
                    ),
                    Card(
                      elevation: 30,
                      color: Colors.blue.shade300,
                      child: ListTile(
                        leading: Icon(Icons.image),
                        title: Text('camera'),
                        onTap:()async{ await showPicker(ImageSource.camera);},
                      ),
                    )
                  ],
                ),
              ),
            );

            showDialog(context: context, builder: (context){return alert;});
           // showDialog(context: context, builder: builder)
          },
        ),

    );
  }

  showDialogFn(BuildContext context) {
    var alert=AlertDialog(
      title: Text('choose your picture'),
      content: Container(
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Divider(color: Colors.red,thickness: 1.5,),
            Card(
              elevation: 30,
              color: Colors.blue.shade300,
              child: ListTile(
                leading: Icon(Icons.image),
                title: Text('gallery'),
                onTap:()async{ await showPicker(ImageSource.gallery);},
              ),
            ),
            Card(
              elevation: 30,
              color: Colors.blue.shade300,
              child: ListTile(
                leading: Icon(Icons.image),
                title: Text('gallery'),
                onTap:()async{ await showPicker(ImageSource.camera);},
              ),
            )
          ],
        ),
      ),
    );

    showDialog(context: context, builder: (context)=>alert);

  }



  showPicker(ImageSource src)async{
 var picker=  await _picker.getImage(source: src);

 setState(() {
   if(picker !=null){
     _image=File(picker.path);
   }else{
     print('no image');
   }
 });

  }



}
