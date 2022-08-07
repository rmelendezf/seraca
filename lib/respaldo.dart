import 'dart:convert';

//import 'dart:typed_data';

import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
//import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:http/http.dart' as http;
import 'nombres.dart';

/// Represents Homepage for Navigation
class Referencia extends StatefulWidget {
  final String encadena;

  const Referencia({super.key, required this.encadena});
  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<Referencia> {
  late Future<List<Nombres>> _listaNomb;

  Future<List<Nombres>> _primero() async {
    final respuesta = await http.get(Uri.parse('https://api.giphy.com/v1/gifs/trending?api_key=PmYoyrNJUlptKppYJNhajYVh7S70R2xk&limit=10&rating=g'));

    List<Nombres> informacion = [];

    if (respuesta.statusCode == 200) {
      String bien = utf8.decode(respuesta.bodyBytes);

      final datos = jsonDecode(bien);

      // ignore: unused_local_variable
      for (var intento in datos["data"]) {
        informacion.add(Nombres(intento["title"], intento ["images"]["downsized"]["url"]));
      }

     print('POR AQUI PASE');
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
        title: const Text('REFERENCIAS'),
      ),
      body: FutureBuilder(
          future: _listaNomb,
          builder: (BuildContext context , AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView(
                children: _milistaGifs(snapshot.data),
              );
            } else if (snapshot.hasError) {
              return Text('HAY UN ERROR');
            }

            return Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }


  List<Widget> _milistaGifs(List<Nombres>data) {
  List<Widget> _gifs = [];
 

  for (var gif in data) {
    _gifs.add(Card(child: Column(
      children: [
        Image.network(gif.url),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(gif.nombre),
          )
      ],
        )));
    
  }

  return _gifs;
 }




}


