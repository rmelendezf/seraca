import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'nombres.dart';

class Referencia extends StatefulWidget {
  final String encadena;

  const Referencia({super.key, required this.encadena});
  @override
  HomePage createState() => HomePage();
}

class HomePage extends State<Referencia> {
  late Future<List<Nombres>> _listaNomb;

  Future<List<Nombres>> _primero() async {
    final respuesta = await http.get(Uri.parse('https://api.giphy.com/v1/gifs/trending?api_key=PmYoyrNJUlptKppYJNhajYVh7S70R2xk&limit=10&rating=g'));
    //final respuesta = await http.get(Uri.parse('https://flutterrmlendezf.000webhostapp.com/flutter%20seraca/api_seraca.php'));
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
        title: const Text('REGRESAR'),
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


