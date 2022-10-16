import 'dart:convert';
import 'dart:ui';
import 'package:flutter/services.dart';
import 'package:flutter_seraca_1/actualizarVigilante.dart';
import 'package:flutter_seraca_1/curriculum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_seraca_1/main.dart';
import 'package:flutter_seraca_1/mostrarVigilante.dart';
import 'package:flutter_seraca_1/paginas/post_libreria.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_seraca_1/nombre_vigilante.dart';

// ignore: camel_case_types
class Api_vigilantes extends StatefulWidget {
  const Api_vigilantes({Key? key}) : super(key: key); 

  @override
  // ignore: library_private_types_in_public_api
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<Api_vigilantes> {
  late Future<List<Nombres_api>> listaNomb;
  String _cedulaControler = '';
  final _cedula = TextEditingController();
  TextEditingController cedulaController = TextEditingController();
  late String cedulaApi;
  Future<List<Nombres_api>> primero() async {
    // final respuesta = await http.get(Uri.parse('https://api.giphy.com/v1/gifs/trending?api_key=PmYoyrNJUlptKppYJNhajYVh7S70R2xk&limit=10&rating=g'));
    //final respuesta = await http.get(Uri.parse('https://flutterrmlendezf.000webhostapp.com/flutter%20seraca/api_seraca.php'));
    final respuesta = await http.get(Uri.parse(
        'http://localhost/seraca/api_seraca_local.php?evento=mostrarUsuario'));
    // .get(Uri.parse('http://localhost/seraca/api_seraca_local.php'));
    List<Nombres_api> informacion = [];

    if (respuesta.statusCode == 200) {
      String bien = utf8.decode(respuesta.bodyBytes);

      final jsonDatos = jsonDecode(bien);
      // ignore: avoid_print
      print('se conecto a la url');
      // ignore: unused_local_variable
      //for (var intento in datos["data"]) {
      for (var intento in jsonDatos) {
        informacion.add(Nombres_api(
          intento["cedula"],
          intento["nombre"],
          intento["apellido"],
          intento["correo"],
          intento["avatar"],
          intento["fecha"],
        ));
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
    listaNomb = primero();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text('PERSONAL DE VIGILANTES'),
        actions: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              IconButton(
                  icon: const Icon(
                    Icons.add,
                    semanticLabel: 'AGREGAR',
                  ),
                  autofocus: false,
                  color: Colors.yellow,
                  iconSize: 40,
                  padding: const EdgeInsets.all(10),
                  splashRadius: 30,
                  tooltip: 'Agregar Personal',
                  hoverColor: Color.fromARGB(255, 13, 16, 179),
                  disabledColor: Colors.black,
                  splashColor: const Color.fromARGB(255, 5, 104, 54),
                  onPressed: () {
                    final route = MaterialPageRoute(builder: (context) {
                      return Post_libreria();

                    });

                    setState(() {
                      
                      listaNomb = primero();
                    });
                   // Navigator.pop(context);

                    
                    Navigator.push(context, route);
                  }),

              const SizedBox(
                width: 20,
              ),

              IconButton(
                icon: const Icon(
                  Icons.manage_search,
                  semanticLabel: 'BUSCAR',
                  
                ),
                autofocus: true,
                color: Colors.yellow,
                iconSize: 40,
                padding: const EdgeInsets.all(10),
                splashRadius: 30,
                tooltip: 'Buscar en Lista',
                hoverColor: Color.fromARGB(255, 13, 16, 179),
                disabledColor: Colors.black,
                splashColor: const Color.fromARGB(255, 5, 104, 54),
                onPressed: () {
                  _buscaralertdialog();
                  // Navigator.pop(context);
                },
              ),

              const SizedBox(
                width: 20,
              ),

              IconButton(
                icon: const Icon(
                  Icons.exit_to_app_sharp,
                  semanticLabel: 'INICIO',
                ),
                autofocus: true,
                color: Colors.yellow,
                iconSize: 40,
                padding: const EdgeInsets.all(10),
                splashRadius: 30,
                tooltip: 'Volper a inicio',
                hoverColor: Color.fromARGB(255, 13, 16, 179),
                disabledColor: Colors.black,
                splashColor: const Color.fromARGB(255, 5, 104, 54),
                onPressed: () {
                  Navigator.push(
                      context,
                      //  MaterialPageRoute(builder: (context) => Api_vigilantes()),
                      MaterialPageRoute(
                          builder: (context) =>
                              MiPrimeraApp()));
                  // Navigator.pop(context);
                },
              ),
              // ),
            ],
          ),
        ],
      ),
      body: FutureBuilder(
          future: listaNomb,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return GridView.count(
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount:
                    3, //PARA MOSTRAR EL NUMERO DE COLUMNAS QUE DESEAMOS VISUALIZAR EN PANTALLA

                children: _otraListNombre(snapshot.data),
              );
            } else if (snapshot.hasError) {
              return const Text('HAY UN ERROR');
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
      otroNombre.add(Card(
        color: Colors.teal[100],

          
          child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        Expanded(
            
            child: Image.network(
          gif.avatar,
          fit: BoxFit.fill,
        )),

        Divider(),

        Expanded(
            child: Container(
                height: 300,
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: Text("Cedula:  "+gif.cedula)),
                    Divider(),
                    Expanded(child: Text("Nombre:  "+gif.nombre)),
                     Divider(),
                    Expanded(child: Text("Apellido:  "+gif.apellido)),
                     Divider(),
                    Expanded(child: Text("Correo:  "+gif.correo)),
                     Divider(),
                    Expanded(child: Text("Fecha:  "+gif.fecha)),
                  ],
                ))),

        Divider(),

        Expanded(
            child: Container(
               // alignment: Alignment.topLeft,
                height: 200,
                //padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    //ButtonBar(
                     // children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: const Color.fromARGB(255, 57, 4, 114),
                            onPrimary: const Color.fromARGB(255, 229, 230, 225),
                            shadowColor: const Color.fromARGB(255, 134, 15, 7),
                            elevation: 10,
                            side: const BorderSide(
                                color: Color.fromARGB(255, 90, 68, 229),
                                width: 2),
                            shape: const BeveledRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            textStyle: const TextStyle(
                                color: Color.fromARGB(255, 114, 5, 10),
                                fontSize: 20,
                                fontStyle: FontStyle.normal),
                          ),

                          // padding: const EdgeInsets.all(30),
                          child: const Text("Hoja de Vida",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 211, 234, 7),
                                  fontSize: 10.0,
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
                       // Divider(
                        //  height: 100,
                        //  thickness: 5,
                        //  indent: 20,
                        //  endIndent: 0,
                        //  color: Colors.white,
                        //),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: const Color.fromARGB(255, 57, 4, 114),
                            onPrimary: const Color.fromARGB(255, 229, 230, 225),
                            shadowColor: const Color.fromARGB(255, 134, 15, 7),
                            elevation: 10,
                            side: const BorderSide(
                                color: Color.fromARGB(255, 90, 68, 229),
                                width: 2),
                            shape: const BeveledRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            textStyle: const TextStyle(
                                color: Color.fromARGB(255, 114, 5, 10),
                                fontSize: 20,
                                fontStyle: FontStyle.normal),
                          ),

                          // padding: const EdgeInsets.all(30),
                          child: const Text("Actualizar",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 211, 234, 7),
                                  fontSize: 10.0,
                                  fontWeight: FontWeight.bold)),
                          onPressed: () {

                               String cedulaAct = gif.cedula; 
                              String nombreAct = gif.nombre; 
                               String apellidoAct =gif.apellido; 
                               String correoAct = gif.correo; 
                               String avatarAct = gif.avatar;
                               String fechaAct = gif.fecha;   

                              //  _ActualizarVigilante();      

                               Navigator.push(
                                 context,
                                 //  MaterialPageRoute(builder: (context) => Api_vigilantes()),
                                 MaterialPageRoute(
                                   builder: (context) => 
                                   ActualizarVigilante(cedulaAct, nombreAct, apellidoAct, correoAct, avatarAct, fechaAct) 

                                 //  ActualizarVigilante() 
                                  )
                               );
                               cedulaController.clear();



                            // Perform some action
                          },
                        ),
                      //  Divider(),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: const Color.fromARGB(255, 57, 4, 114),
                            onPrimary: const Color.fromARGB(255, 229, 230, 225),
                            shadowColor: const Color.fromARGB(255, 134, 15, 7),
                            elevation: 10,
                            side: const BorderSide(
                                color: Color.fromARGB(255, 90, 68, 229),
                                width: 2),
                            shape: const BeveledRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            textStyle: const TextStyle(
                                color: Color.fromARGB(255, 114, 5, 10),
                                fontSize: 20,
                                fontStyle: FontStyle.normal),
                          ),

                          // padding: const EdgeInsets.all(30),
                          child: const Text("Borrar",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 211, 234, 7),
                                  fontSize: 10.0,
                                  fontWeight: FontWeight.bold)),
                          onPressed: () {
                            String datoaborrar = gif.cedula;
                            // ignore: avoid_print
                            print(datoaborrar);
                            _myalertdialog(datoaborrar);
                          },
                        ),                      
                  ],
                )
                )),
      ])));
    }

    return otroNombre;
  }

  void _myalertdialog(String datoaborrar) {
    // _myalertdialog() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: const Color(0xff000f73).withOpacity(0.9),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        title: SizedBox(
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
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                ),
                child: const Text(
                  'Advertencia',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25.0,
                  ),
                ),
              ),

              Container(
                margin: const EdgeInsets.all(5.0),
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                height: 2.0,
              ),
            ],
          ),
        ),
        content: const Text(
          '¿Está seguro de eliminar este registro?',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20.0, color: Colors.white),
        ),
        actions: <Widget>[
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Container(
                width: 80.0,
                margin: const EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                  color: const Color(0xff00C217),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: OutlinedButton(
                  // ignore: sort_child_properties_last
                  child: const Text('SI'),
                  style: OutlinedButton.styleFrom(
                      primary: Colors.black,
                      backgroundColor: Colors.amber,
                      padding: const EdgeInsets.all(10)),
                  onPressed: () async {
                    var param = {"cedula": datoaborrar};
                    await http.post(
                        Uri.parse(
                            'http://localhost/seraca/apiSimple_local/items/deleteSeraca.php'),
                        headers: <String, String>{
                          'Content-Type': 'application/json; charset=UTF-8',
                        },
                        body: json.encode(param)
                        //var encryptedBosy = jsonEncode({'body': encrypted.base64});
                        );

                    setState(() {
                      listaNomb = primero();
                    });
                    Navigator.pop(context);

                    AvisoBorrado(); 


                  },
                )
              ),
            Container(
              width: 80.0,
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                color: const Color(0xffFF0000),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: OutlinedButton(
                // ignore: sort_child_properties_last
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
    // }
  }

  void _buscaralertdialog() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: const Color(0xff000f73).withOpacity(0.9),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        title: SizedBox(
          height: 200.0,
          width: 200.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Center(
                child: Icon(
                  Icons.border_color,
                  color: Colors.amber,
                  size: 50,
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                ),
                child: const Text(
                  'Ingrese cedula del Vigilante',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25.0,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(5.0),
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                height: 2.0,
              ),
              const Divider(),
              Container(
                  // padding: const EdgeInsets.only(top: 30.0),
                  width: 300.0,
                  height: 40.0,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: TextField(
                    controller: cedulaController,
                    decoration: InputDecoration(
                      // contentPadding: EdgeInsets.fromLTRB(5, 5, 5, 5) ,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(2.0)),
                      hintText: 'Cedula de la Persona',
                      // labelText: 'Escriba cedula',
                      // suffixIcon: Icon(Icons.accessibility),
                      icon: const Icon(Icons.account_circle),
                    ),
                  )),
            ],
          ),
        ),
        content: const Text(
          'Por favor verifique que la cedula sea la correcta y pulse "BUSCAR"',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20.0, color: Colors.white),
        ),
        actions: <Widget>[
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Container(
              width: 150.0,
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                color: const Color(0xff00C217),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: OutlinedButton(
                // ignore: sort_child_properties_last
                child: const Text('BUSCAR'),
                style: OutlinedButton.styleFrom(
                    primary: Colors.black,
                    backgroundColor: Colors.amber,
                    padding: const EdgeInsets.all(10)),
                onPressed: () {
                  _cedulaControler = cedulaController.text;
                  // print(_cedula.text);

                  Navigator.push(
                      context,
                      //  MaterialPageRoute(builder: (context) => Api_vigilantes()),
                      MaterialPageRoute(
                          builder: (context) =>
                              MostrarVigilante(_cedulaControler)));
                  cedulaController.clear();
                  // Navigator.pop(context)
                  //  String valor;
                  //   _mostrarVigdialogo( valor: _cedula.text);
                },
              ),
            ),
            Container(
              width: 150.0,
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                color: const Color(0xffFF0000),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: OutlinedButton(
                // ignore: sort_child_properties_last
                child: const Text('SALIR'),
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

  AvisoBorrado() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (_) {
          Future.delayed(Duration(seconds:4), () {
            Navigator.of(context).pop(true);
          });
          return AlertDialog(
            backgroundColor: const Color(0xff000f73).withOpacity(0.9),
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
                      style: TextStyle(fontSize: 20.0, color: Colors.red),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }





}
