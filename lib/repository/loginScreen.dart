import 'package:flutter/material.dart';
import 'package:flutter_seraca_1/repository/contasena.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _nombre = '';
  String _password = '';
  TextEditingController _usserController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  //bool _isLoggedIn = false;
  bool passwordVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
//appBar: AppBar(title: const Text('REGRESAR')),
        body: Center(
            child: Container(
             width: 320,
             height: 600,
             decoration: const BoxDecoration(
              image: DecorationImage(

                  //  image: NetworkImage("https://p4.wallpaperbetter.com/wallpaper/813/391/666/cube-geometry-blender-blue-wallpaper-preview.jpg"),
                  image: NetworkImage(
                      "https://flutterrmlendezf.000webhostapp.com/flutter%20seraca/Image%20banesco%202.jpg"),

                  //  https://flutterrmlendezf.000webhostapp.com/flutter%20seraca/Image%20banesco%202.jpg
                  fit: BoxFit.cover
                  )),
          child: ListView(
              //  padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 200.0),
              children: [
                Padding(
                    padding: const EdgeInsets.only(
                        left: 13.0, right: 13.0, bottom: 0.0, top: 365),
                    child: Container(
                      width: 200,
                      height: 200,
                      alignment: Alignment.bottomCenter,
                      //   width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5.0),
                        boxShadow: const [
                          BoxShadow(
                              color: Color.fromARGB(255, 7, 92, 10),
                              offset: Offset(100.00, 100.0),
                              blurRadius: 60.0),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 10.0, right: 10.0, top: 5.0),
                        child: Column(
                          children: <Widget>[
                            Align(
                              alignment: Alignment(0, 1),
                              child: GreenBox(),
                            ),
                            const Divider(),
                            Expanded(
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                        height: 35,
                                        width: 228,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(right: 5),
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              primary: const Color.fromARGB(
                                                  255, 11, 118, 62),
                                              onPrimary: Colors.white,
                                              // shadowColor: Color.fromARGB(255, 134, 15, 7),
                                              elevation: 2,
                                              side: const BorderSide(
                                                  color: Color.fromARGB(
                                                      255, 7, 92, 10),
                                                  width: 0),
                                              shape:
                                                  const BeveledRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  3))),
                                              //        padding: EdgeInsets.symmetric(horizontal: 60, vertical: 0),
                                              minimumSize: Size(239, 40),
                                              textStyle: const TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 114, 5, 10),
                                                  fontSize: 40,
                                                  fontStyle: FontStyle.normal),
                                            ),
                                            child: const Text("INICIAR SESION2",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 11.0,
                                                    fontWeight:
                                                        FontWeight.normal)),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                        )),
                                    Container(
                                        height: 35,
                                        width: 35,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border.all(
                                              color: const Color.fromARGB(
                                                  255, 11, 89, 14),
                                            )),
                                        child: const Expanded(
                                          child: Icon(
                                            Icons.wallpaper,
                                            color: Color.fromARGB(
                                                255, 20, 130, 24),
                                            // size: ,
                                          ),
                                        )),
                                  ]),
                            ),
                            Expanded(
                                child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 1, vertical: 5),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.white,
                                  onPrimary:
                                      const Color.fromARGB(255, 160, 193, 31),
                                  // shadowColor: Color.fromARGB(255, 134, 15, 7),
                                  elevation: 2,
                                  side: const BorderSide(
                                      color: Color.fromARGB(255, 7, 92, 10),
                                      width: 0),
                                  shape: const BeveledRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(3))),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 0, vertical: 2),
                                  minimumSize: Size(300, 35),
                                  textStyle: const TextStyle(
                                      color: Color.fromARGB(255, 114, 5, 10),
                                      fontSize: 10,
                                      fontStyle: FontStyle.normal),
                                ),

                                // padding: const EdgeInsets.all(30),
                                child: const Text("OPERACIONES RAPIDAS",
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 4, 81, 7),
                                        fontSize: 11.0,
                                        fontWeight: FontWeight.normal)),
                                onPressed: () {},
                              ),
                            )),
                            TextButton(
                                // ignore: sort_child_properties_last
                                child: const Text('Registrarse'),
                                style: TextButton.styleFrom(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 10, 10, 10),
                                  primary: const Color.fromARGB(
                                                  255, 11, 118, 62),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Contrasena()),
                                    //  MaterialPageRoute(builder: (context) => Api_vigilantes(encadena: 'http://localhost/seraca/api_seraca_local.php')),
                                  );
                                }),
                          ],
                        ),
                      ),
                    )),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.local_phone,
                        semanticLabel: 'CONTACTANOS',
                      ),
                      //focusColor: Color.fromARGB(255, 75, 3, 69),
                      autofocus: false,
                      color: Colors.white,
                      iconSize: 20,
                      padding: const EdgeInsets.all(10),
                      //splashRadius: 20,
                      tooltip: 'Contactanos',
                      //hoverColor: const Color.fromARGB(255, 106, 6, 80),
                      //   disabledColor: Colors.black,
                      splashColor: const Color.fromARGB(255, 5, 104, 54),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.info,
                        semanticLabel: 'INFORMACION',
                      ),
                      //    focusColor: Color.fromARGB(255, 75, 3, 69),
                      autofocus: false,
                      color: Colors.white,
                      iconSize: 20,
                      padding: const EdgeInsets.all(10),
                      //splashRadius: 20,
                      tooltip: 'Informacion',
                      //  hoverColor: Color.fromARGB(255, 106, 6, 80),
                      //  disabledColor: Colors.black,
                     // splashColor: const Color.fromARGB(255, 5, 104, 54),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.build,
                        semanticLabel: 'CLAVE DINAMICA',
                      ),
                      //    focusColor: Color.fromARGB(255, 75, 3, 69),
                      autofocus: false,
                      color: Colors.white,
                      iconSize: 20,
                      padding: const EdgeInsets.all(10),
                      //splashRadius: 20,
                      tooltip: 'ClaveDinamica',
                      //    hoverColor: Color.fromARGB(255, 106, 6, 80),
                      //   disabledColor: Colors.black,
                      //splashColor: const Color.fromARGB(255, 5, 104, 54),
                      onPressed: () {},
                    ),
                  ],
                ),
              ]),
        )));
  }

  // ignore: non_constant_identifier_names
  GreenBox() {
    return Container(
      width: 200,
      height: 50,
      //   color: Colors.green,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  "https://flutterrmlendezf.000webhostapp.com/flutter%20seraca/imagen%20banesco.png"),
              //fit: BoxFit.cover
              )),
    );
  }
}
