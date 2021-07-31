
import 'package:flutter/material.dart';
import 'package:multi_image_picker2/multi_image_picker2.dart';

class MultiImageApp extends StatelessWidget {
  const MultiImageApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiImageApp1(),
    );
  }
}


class MultiImageApp1 extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MultiImageAppState();
  }
}

class MultiImageAppState extends State<MultiImageApp1>{
  List<Asset> _images=<Asset>[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('photo'),
        actions: [
          IconButton(onPressed: getImage, icon: Icon(Icons.image))
        ],
      ),
      body:
      GridView.count(crossAxisCount: 3,
        children: List.generate(_images.length, (index) {
         // return Image.asset(_images[index].toString());
          return AssetThumb(asset: _images[index], width: 200, height: 200);
        }),),
    );
  }


  Future getImage()async{
    List<Asset> list= await MultiImagePicker.pickImages(maxImages: 200,
    enableCamera: true,
    selectedAssets: _images,
    materialOptions: MaterialOptions(selectCircleStrokeColor: 'red'));

    setState(() {
      _images=list;
    });
    
 }

}
