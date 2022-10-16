import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';


/// Represents Homepage for Navigation
class Contacto extends StatefulWidget {
  final String cadena;

  const Contacto({super.key, required this.cadena});
  @override
  HomePage createState() => HomePage();
}

class HomePage extends State<Contacto> {
   primero() async {
     Response respuesta=await http.get(Uri.parse("https://dummyjson.com/products/categories"));   
   //  Response respuesta=await http.get(Uri.parse("https://flutterrmlendezf.000webhostapp.com/flutter%20seraca/api_seraca.php"));

      return jsonDecode(respuesta.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CONTACTOS'),
      ),
      body: FutureBuilder(
          future: primero(),
          builder: (BuildContext context , AsyncSnapshot s) {
            if(s.connectionState==ConnectionState.done){
              return mostrarLista(s.data);
            }else{
                   return  const CircularProgressIndicator();
            }
          }
          
          ),
    );
  }

  mostrarLista(List myProducts){
    return ListView.builder(
            itemCount: myProducts.length,
            itemBuilder: (context, index) {
              return Card(
                key: ValueKey(myProducts[index]),
                margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(myProducts[index])),
              );
            });
  }





}


