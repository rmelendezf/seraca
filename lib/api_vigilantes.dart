import 'dart:convert';

//import 'dart:typed_data';

import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
//import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:http/http.dart' as http;
import 'nombre_vigilante.dart';

/// Represents Homepage for Navigation
// ignore: camel_case_types
class Api_vigilantes extends StatefulWidget {
  final String encadena;

  const Api_vigilantes({super.key, required this.encadena});
  @override
  // ignore: library_private_types_in_public_api
  _HomePage createState() => _HomePage();
}


class _HomePage extends State<Api_vigilantes> {
 
  late Future<List<Nombres_api>> _listaNomb;
    Future<List<Nombres_api>> _primero() async {
   // final respuesta = await http.get(Uri.parse('https://api.giphy.com/v1/gifs/trending?api_key=PmYoyrNJUlptKppYJNhajYVh7S70R2xk&limit=10&rating=g'));
    //final respuesta = await http.get(Uri.parse('https://flutterrmlendezf.000webhostapp.com/flutter%20seraca/api_seraca.php'));
    final respuesta = await http.get(Uri.parse('http://localhost/seraca/api_seraca_local.php'));
    List<Nombres_api> informacion = [];

    if (respuesta.statusCode == 200) {
      String bien = utf8.decode(respuesta.bodyBytes);
          
      final jsonDatos = jsonDecode(bien);
       // ignore: avoid_print
       print('se conecto a la url');
      // ignore: unused_local_variable
      //for (var intento in datos["data"]) {
        for (var intento in jsonDatos) {
        informacion.add(Nombres_api(intento ["cedula"], intento ["nombre"], intento ["apellido"], intento ["correo"],
                                intento ["avatar"], intento ["fecha"], ));
      }

     // ignore: avoid_print
     print(informacion);
      return informacion;
    } else {
      throw Exception('FALLA DE CONEXION');
    }
  }

  @override
  void initState() {
    super.initState();
    _listaNomb = _primero();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('PERSONAL DE VIGILANTES'),
        actions: [
         
         Row(
         // mainAxisAlignment: MainAxisAlignment.spaceAround,
         mainAxisSize: MainAxisSize.max,
         children: [
         // Expanded(child: 
          
          IconButton(
            icon: const Icon(Icons.add,semanticLabel: 'AGREGAR', ),
            focusColor: Color.fromARGB(255, 75, 3, 69),
            autofocus: true,
            color: Colors.yellow,  
            iconSize: 40,
            padding: const EdgeInsets.all(10),     
            splashRadius: 45, 
            tooltip: 'Agregar Personal',   
            hoverColor: Color.fromARGB(255, 106, 6, 80),
            disabledColor: Colors.black,
            splashColor: Color.fromARGB(255, 5, 104, 54),           
            onPressed: () {},         
          ),
         // ),
          SizedBox(width: 20 ,),

         // Expanded(child:
          IconButton(
            icon: const Icon(Icons.manage_search,semanticLabel: 'BUSCAR', ),
            focusColor: Color.fromARGB(255, 75, 3, 69),
            autofocus: true,
            color: Colors.yellow,  
            iconSize: 40,
            padding: const EdgeInsets.all(10),     
            splashRadius: 45, 
            tooltip: 'Buscar en Lista',   
            hoverColor: Color.fromARGB(255, 106, 6, 80),
            disabledColor: Colors.black,
            splashColor: Color.fromARGB(255, 5, 104, 54),           
            onPressed: () {},         
          ),
         // ),
            ],
         ),

        ],

      ),
       
      body: FutureBuilder(
          future: _listaNomb,
          builder: (BuildContext context , AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
             // return ListView(
              return GridView.count(
                crossAxisCount: 2,
                
                children: _otraListNombre(snapshot.data),
              );
            } else if (snapshot.hasError) {
              return Text('HAY UN ERROR');
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }

  
  List<Widget> _otraListNombre(List<Nombres_api> data) {
  List<Widget> otroNombre = [];
 

  for (var gif in data) {
    otroNombre.add(Card(child: 
         //  Container(
           //height: 10,
           // padding: const EdgeInsets.symmetric(vertical: 10.0),
         // child:// 
         Row(
           mainAxisAlignment: MainAxisAlignment.end,
           // mainAxisSize: MainAxisSize.min,

           children: [
             Expanded(child:  Image.network(gif.avatar, fit: BoxFit.fill,)),

             Expanded(
               //child:  Padding(
               //padding: const EdgeInsets.symmetric(vertical: 8.0),
               // mainAxisAlignment: MainAxisAlignment.end,
               child: Container(
                 height: 200,
                 padding: const EdgeInsets.symmetric(vertical: 10.0),
                 child:    
                  Column(
            
                   children: [
                     Expanded(child:Text(gif.cedula)),
                     Expanded(child:Text(gif.nombre)),
                     Expanded(child:Text(gif.apellido)),
                     Expanded(child:Text(gif.correo)),
                     Expanded(child:Text(gif.fecha)),
                   ] ,
                 
                  )
               )
              ),


              Expanded(
                  //child:  Padding(
                  //padding: const EdgeInsets.symmetric(vertical: 8.0),
                  // mainAxisAlignment: MainAxisAlignment.end,
                child: Container(
                  
                  height: 200,
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child:    
                   Column(
                     children: [
                        ButtonBar(
                          
                          alignment: MainAxisAlignment.start,
                          children: [
                            ElevatedButton(
                             style: ElevatedButton.styleFrom(
                                
                                primary: Color.fromARGB(255, 57, 4, 114),
                                onPrimary: Color.fromARGB(255, 229, 230, 225),
                                shadowColor: Color.fromARGB(255, 134, 15, 7),
                                elevation: 10,
                                side: BorderSide(color: Color.fromARGB(255, 90, 68, 229), width: 2),
                                shape: const BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),   
                                textStyle: const TextStyle(
                                 color: Color.fromARGB(255, 114, 5, 10),
                                 fontSize: 20,
                                 fontStyle: FontStyle.normal
                               ),
                             ),
                                       
                                // padding: const EdgeInsets.all(30),                    
                             child: const Text("Hoja de Vida", style: TextStyle(color: Color.fromARGB(255, 211, 234, 7), fontSize: 10.0, fontWeight: FontWeight.bold)),
                             onPressed: () {
                                 // Perform some action
                             },            
                           ),


                           ElevatedButton(
                             style: ElevatedButton.styleFrom(
                                primary: Color.fromARGB(255, 57, 4, 114),
                                onPrimary: Color.fromARGB(255, 229, 230, 225),
                                shadowColor: Color.fromARGB(255, 134, 15, 7),
                                elevation: 10,
                                side: BorderSide(color: Color.fromARGB(255, 90, 68, 229), width: 2),
                                shape: const BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),   
                                textStyle: const TextStyle(
                                 color: Color.fromARGB(255, 114, 5, 10),
                                 fontSize: 20,
                                 fontStyle: FontStyle.normal
                               ),
                             ),
                                       
                                // padding: const EdgeInsets.all(30),                    
                             child: const Text("Acrtualizar", style: TextStyle(color: Color.fromARGB(255, 211, 234, 7), fontSize: 10.0, fontWeight: FontWeight.bold)),
                             onPressed: () {
                                 // Perform some action
                             },            
                           ),

                           ElevatedButton(
                             style: ElevatedButton.styleFrom(
                                primary: Color.fromARGB(255, 57, 4, 114),
                                onPrimary: Color.fromARGB(255, 229, 230, 225),
                                shadowColor: Color.fromARGB(255, 134, 15, 7),
                                elevation: 10,
                                side: BorderSide(color: Color.fromARGB(255, 90, 68, 229), width: 2),
                                shape: const BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),   
                                textStyle: const TextStyle(
                                 color: Color.fromARGB(255, 114, 5, 10),
                                 fontSize: 20,
                                 fontStyle: FontStyle.normal
                               ),
                             ),
                                       
                                // padding: const EdgeInsets.all(30),                    
                             child: const Text("Borrar", style: TextStyle(color: Color.fromARGB(255, 211, 234, 7), fontSize: 10.0, fontWeight: FontWeight.bold)),
                             onPressed: () {
                                 // Perform some action
                             },            
                           ),                     
                         ],
                        ),            
                                         // ),          
                      ],
                   )   

         
                         //   )
                )
              ),
           ]
         )
      ));
  }

  return otroNombre;
 }




}
