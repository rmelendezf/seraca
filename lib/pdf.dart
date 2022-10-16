import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:http/http.dart' as http;







/// Represents Homepage for Navigation
class PDF extends StatefulWidget {

  final String enlace;

  const PDF({super.key, required this.enlace});
  @override
  _HomePage createState() => _HomePage();
}


class _HomePage extends State<PDF> {
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

Future  primero() async {
final ByteData imageData = await NetworkAssetBundle(Uri.parse(widget.enlace)).load("");
final Uint8List bytes = imageData.buffer.asUint8List();

//var respuesta=await http.get(Uri.parse('https://reqres.in/api/products/3'));
//Map datos = jsonDecode(respuesta.body);
//print(datos);
//datos['data'].forEach((key, value) {
 // print(value['name']);
//}






   return bytes;
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OFERTA  DE  SERVICIO'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.bookmark,
              color: Colors.white,
              semanticLabel: 'Bookmark',
            ),
            onPressed: () {
              _pdfViewerKey.currentState?.openBookmarkView();
            },
          ),
        ],
      ),
      body:FutureBuilder(
        future: primero(),
         builder: (BuildContext context , AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
               }  
              else {
               return  SfPdfViewer.memory(snapshot.data);
              }
             }
           ),



      /* body:FutureBuilder(
        future: Future.delayed(Duration(seconds: 10)),
         builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
               }  
              else {
               return  SfPdfViewer.network(
                widget.enlace,
                key: _pdfViewerKey,
                 );
              }
             }
           ),*/
    
    );
  }
}