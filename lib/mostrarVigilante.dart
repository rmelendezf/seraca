import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_seraca_1/actualizarVigilante.dart';
import 'package:flutter_seraca_1/api_vigilantes.dart';
import 'package:flutter_seraca_1/curriculum.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_seraca_1/nombre_vigilante.dart';

class MostrarVigilante extends StatefulWidget {
  final String cedulaApi;

  const MostrarVigilante(this.cedulaApi, {Key? key}) : super(key: key);

  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<MostrarVigilante> {
  late Future<List<Nombres_api>> listaNomb;
  dynamic? _cedula;
  dynamic? _nombre;
  dynamic? _apellido;
  dynamic? _correo;
  dynamic? _avatar;
  dynamic? _fecha;

  late final String valor = widget.cedulaApi;

  Future<List<Nombres_api>> primero() async {
    String url =
        'http://localhost/seraca/api_seraca_local.php?evento=mostrarBotella&cedula=$valor';
    print(url);

    final respuesta = await http.get(Uri.parse(url));

    // .get(Uri.parse('http://localhost/seraca/api_seraca_local.php'));
    List<Nombres_api> informacion = [];

    if (respuesta.statusCode == 200) {
      String bien = utf8.decode(respuesta.bodyBytes);

      final jsonDatos = jsonDecode(bien);

      _cedula = jsonDatos["cedula"];
      _nombre = jsonDatos["nombre"];
      _apellido = jsonDatos["apellido"];
      _correo = jsonDatos["correo"];
      _avatar = jsonDatos["avatar"];
      _fecha = jsonDatos["fecha"];

      // ignore: avoid_print
      print('se conecto a la url');
      print(valor);
      print(_nombre);
      print(informacion);

      return informacion;
    } else {
      throw Exception('FALLA DE CONEXION');
    }
  }

  @override
  void initState() {
    super.initState();
    listaNomb = primero();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 141, 212, 243),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text('DATOS DEL VIGILANTE'),
      ),
      body: Center(
        child: Container(
          width: 900,
          height: 500,
          child: FutureBuilder(
              future: listaNomb,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  // return ListView(
                  return Column(
                    children: [
                      SizedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                                color: Color.fromARGB(255, 100, 171, 230),
                                width: 300,
                                height: 250,
                                child: Image.network(
                                  _avatar,
                                  fit: BoxFit.fill,
                                )),
                            
                            Container(
                                //      border_color:true,
                                //decoration:ColoredBox(color:  Colors.black),

                                //Border.all(color:  Colors.black),
                                //color:Colors.black) ,
                                color: Color.fromARGB(255, 100, 171, 230),
                                width: 200,
                                height: 300,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 10.0),
                                child: Column(
                                  // mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,

                                  children: [
                                    Expanded(
                                        child: Text("Cedula:    " + _cedula)),
                                    Expanded(
                                        child: Text("Nombre:    " + _nombre)),
                                    Expanded(
                                        child: Text("Apellido:  " + _apellido)),
                                    Expanded(
                                        child: Text("Correo:    " + _correo)),
                                    Expanded(
                                        child:
                                            Text("Fecha Ingreso: " + _fecha)),
                                  ],
                                )),
                            
                            Container(
                              //  color: Color.fromARGB(255, 100, 171, 230),
                              width: 130,
                              height: 200,
                              //padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [                                  
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Color.fromARGB(255, 57, 4, 114),
                                      onPrimary:
                                          Color.fromARGB(255, 229, 230, 225),
                                      shadowColor:
                                          Color.fromARGB(255, 134, 15, 7),
                                      elevation: 10,
                                      side: BorderSide(
                                          color:
                                              Colors.black,
                                          width: 1),
                                      shape: const BeveledRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(4))),
                                      textStyle: const TextStyle(
                                          color:
                                              Color.fromARGB(255, 114, 5, 10),
                                          fontSize: 20,
                                          fontStyle: FontStyle.normal),
                                    ),

                                    // padding: const EdgeInsets.all(30),
                                    child: const Text("Hoja de Vida",
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 211, 234, 7),
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.bold)),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => const Curriculum(
                                                enlace:
                                                    'https://flutterrmlendezf.000webhostapp.com/flutter%20seraca/curridulum%20ejemplo.pdf')),
                                      );

                                      // Perform some action
                                    },
                                  ),
                                  //  Divider(),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Color.fromARGB(255, 57, 4, 114),
                                      onPrimary:
                                          Color.fromARGB(255, 229, 230, 225),
                                      shadowColor:
                                          Color.fromARGB(255, 134, 15, 7),
                                      elevation: 10,
                                      side: const BorderSide(
                                          color:
                                              Colors.black,
                                          width: 1),
                                      shape: const BeveledRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(4))),
                                      textStyle: const TextStyle(
                                          color:
                                              Color.fromARGB(255, 114, 5, 10),
                                          fontSize: 20,
                                          fontStyle: FontStyle.normal),
                                    ),

                                    // padding: const EdgeInsets.all(30),
                                    child: const Text("Actualizar",
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 211, 234, 7),
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.bold)),
                                    onPressed: () {
                                      String cedulaAct = _cedula;
                                      String nombreAct = _nombre;
                                      String apellidoAct = _apellido;
                                      String correoAct = _correo;
                                      String avatarAct = _avatar;
                                      String fechaAct = _fecha;

                                      //  _ActualizarVigilante();

                                      Navigator.push(
                                          context,
                                          //  MaterialPageRoute(builder: (context) => Api_vigilantes()),
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ActualizarVigilante(
                                                      cedulaAct,
                                                      nombreAct,
                                                      apellidoAct,
                                                      correoAct,
                                                      avatarAct,
                                                      fechaAct)

                                              //  ActualizarVigilante()
                                              ));
                                      //cedulaController.clear();

                                      // Perform some action
                                    },
                                  ),
                                  //  Divider(),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Color.fromARGB(255, 57, 4, 114),
                                      onPrimary:
                                          Color.fromARGB(255, 229, 230, 225),
                                      shadowColor:
                                          Color.fromARGB(255, 134, 15, 7),
                                      elevation: 10,
                                      side: const BorderSide(
                                          color:
                                              Colors.black,
                                          width: 1),
                                      shape: const BeveledRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(4))),
                                      textStyle: const TextStyle(
                                          color:
                                              Color.fromARGB(255, 114, 5, 10),
                                          fontSize: 20,
                                          fontStyle: FontStyle.normal),
                                    ),

                                    // padding: const EdgeInsets.all(30),
                                    child: const Text("Borrar",
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 211, 234, 7),
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.bold)),
                                    onPressed: () {
                                      dialogoborrar(valor);

                                      // Future.delayed(Duration(seconds: 5), () {
                                      /* Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Api_vigilantes()));;*/
                                      //  });

                                      // Navigator.pop(context);
                                      // Navigator.push(
                                      //  context,
                                      //  MaterialPageRoute(
                                      //     builder: (context) =>
                                      //      Api_vigilantes()));

                                      // Perform some action
                                    },
                                  ),
                                ],
                              ),
                            ),
                            // ),
                          ],
                        ),
                      ),
                     // Divider(height:40),
                      SizedBox(height: 60),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 19, 32, 207),
                          onPrimary: Color.fromARGB(255, 225, 225, 230),
                          shadowColor: const Color.fromARGB(255, 134, 15, 7),
                          elevation: 10,
                          side: const BorderSide(
                              color: Colors.black,
                              width: 1),
                          shape: const BeveledRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(3))),
                          textStyle: const TextStyle(
                              color: Color.fromARGB(255, 114, 5, 10),
                              fontSize: 50,
                              fontStyle: FontStyle.normal),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Api_vigilantes()));
                        },
                        child: const Text("SALIR",
                            style: TextStyle(
                                color: Colors.yellow,
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold)),
                      ),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Text('REGISTRO  ELIMINADO');
                }

                return const Center(
                  child: CircularProgressIndicator(),
                );
              }),
        ),
      ),
    );
  }

  void dialogoborrar(String valor) {
    // _myalertdialog() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: Color(0xff000f73).withOpacity(0.9),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        title: Container(
          height: 200.0,
          width: 200.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              const Center(
                child: Icon(
                  Icons.warning,
                  color: Colors.amber,
                  size: 50,
                ),
              ),

              // AnimatedPage(),

              Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                child: Text(
                  'Advertencia',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25.0,
                  ),
                ),
              ),

              Container(
                margin: EdgeInsets.all(5.0),
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                height: 2.0,
              ),
            ],
          ),
        ),
        content: Text(
          '¿Está seguro de eliminar este registro?',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20.0, color: Colors.white),
        ),
        actions: <Widget>[
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Container(
              width: 80.0,
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                color: Color(0xff00C217),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: OutlinedButton(
                  child: const Text('SI'),
                  style: OutlinedButton.styleFrom(
                      primary: Colors.black,
                      backgroundColor: Colors.amber,
                      padding: const EdgeInsets.all(10)),
                  onPressed: () async {
                    var param = {"cedula": valor};
                    String url =
                        'http://localhost/seraca/apiSimple_local/items/deleteSeraca.php';
                    final resp = await http.post(Uri.parse(url),
                        headers: <String, String>{
                          'Content-Type': 'application/json; charset=UTF-8',
                        },
                        body: json.encode(param)
                        //var encryptedBosy = jsonEncode({'body': encrypted.base64});
                        );

                    showDialog(
                        context: context,
                        builder: (context) {
                          Future.delayed(Duration(seconds: 4), () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Api_vigilantes()));
                          });
                          return AlertDialog(
                            backgroundColor:
                                const Color(0xff000f73).withOpacity(0.9),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            title: SizedBox(
                              height: 200.0,
                              width: 550.0,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  const Center(
                                    child: Icon(
                                      Icons.delete,
                                      color: Colors.amber,
                                      size: 50,
                                    ),
                                  ),
                                  Container(
                                    decoration: const BoxDecoration(
                                      color: Colors.transparent,
                                    ),
                                    child: const Text(
                                      'Operacion Exitosa',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 25.0,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.all(1.0),
                                    color: Colors.white,
                                    width: MediaQuery.of(context).size.width,
                                    height: 2.0,
                                  ),
                                  const Divider(),
                                  Container(
                                    // padding: const EdgeInsets.only(top: 30.0),
                                    width: 500.0,
                                    height: 40.0,
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                    ),
                                    child: const Text(
                                      'EL REGISTRO HA SIDO ELIMINADO',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 20.0, color: Colors.red),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        });
                  }),
            ),
            Container(
              width: 80.0,
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                color: Color(0xffFF0000),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: OutlinedButton(
                child: const Text('NO'),
                style: OutlinedButton.styleFrom(
                    primary: Colors.black,
                    backgroundColor: Colors.amber,
                    padding: const EdgeInsets.all(10)),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ]),
        ],
      ),
    );
  }  
}
