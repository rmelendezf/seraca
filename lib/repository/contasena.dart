import 'package:flutter/material.dart';
import 'package:flutter_seraca_1/api_vigilantes.dart';

class Contrasena extends StatefulWidget {
  const Contrasena({Key? key}) : super(key: key);

  @override
  _MyAppFormState createState() => _MyAppFormState();
}

class _MyAppFormState extends State<Contrasena> {
  String _nombre = '';
  String _email = '';
  String _password = '';
  TextEditingController usserController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 116, 204, 241),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 90.0),
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Login',
                style: TextStyle(fontFamily: 'NerkoOne', fontSize: 50.0),
              ),
              const Text(
                'ADMINISTRADOR',
                style: TextStyle(fontFamily: 'NerkoOne', fontSize: 20.0),
              ),
              SizedBox(
                width: 200.0,
                height: 20.0,
                child: Divider(color: Color.fromARGB(255, 23, 34, 180)),
              ),
              TextField(  
                cursorColor: Colors.black,          
                controller: usserController,
                enableInteractiveSelection: false,
                // autofocus: true,
                textCapitalization: TextCapitalization.characters,
                decoration: InputDecoration(
                     filled: true,
                    fillColor:Colors.black26,
                    hintText: 'Ingrese su nombre',
                    labelText: 'Usuario Administrador',
                    suffixIcon: Icon(Icons.verified_user),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0))), 
                onSubmitted: (valor) {
                  _nombre = valor;
                  print('El nombre es $_nombre');
                },
              ),
              const Divider(
                height: 15.0,
              ),
              TextField(

                //showCursor: true,
                //autofocus: false,
                cursorColor: Colors.black,
                controller: passwordController,
                enableInteractiveSelection: false,
                obscureText: true,
                decoration: InputDecoration(
                   filled: true,
                    fillColor:Colors.black26,
                    //filled: true,
                   // fillColor: Color.fromARGB(255, 118, 226, 121),
                    hintText: 'Ingrese su clave',
                    labelText: 'Password',
                    suffixIcon: const Icon(Icons.lock_outline),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0))),
                onSubmitted: (valor) {
                  _password = valor;
                  print('El Password es $_password');
                },
              ),
              const Divider(
                height: 15.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                      width: 100.0,
                      height: 50.0,
                      child: TextButton(
                          child: const Text(
                            'Cancelar',
                            style: TextStyle(
                                color: Color.fromARGB(179, 9, 112, 47),
                                fontSize: 20.0,
                                fontFamily: 'NerkoOne'),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          })),
                  SizedBox(
                    width: 100.0,
                    height: 50.0,
                    child: TextButton(
                      //    hoverColor: Colors.lightBlue,
                      child: const Text(
                        'Sing in',
                        style: TextStyle(
                            color: Color.fromARGB(179, 9, 112, 47),
                            fontSize: 20.0,
                            fontFamily: 'NerkoOne'),
                      ),

                      onPressed: () {
                        _nombre = usserController.text;
                        _password = passwordController.text;

                        if (_nombre == 'ramon' && _password == '18671986') {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Api_vigilantes()));
                          usserController.clear();
                          passwordController.clear();
                        } else {
                          showDialog(
                              barrierDismissible: false,
                              context: context,
                              builder: (_) {
                                Future.delayed(Duration(seconds: 3), () {
                                  Navigator.of(context).pop(true);
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        const Center(
                                          child: Icon(
                                            Icons.error_outline_sharp,

                                            //Icons.person_add_alt_1,
                                            color: Colors.amber,
                                            size: 50,
                                          ),
                                        ),
                                        Container(
                                          decoration: const BoxDecoration(
                                            color: Colors.transparent,
                                          ),
                                          child: const Text(
                                            'Ha habido un error',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 25.0,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: const EdgeInsets.all(1.0),
                                          color: Colors.white,
                                          width:
                                              MediaQuery.of(context).size.width,
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
                                            'USUARIO O CONTRASEÑA INCORRECTA',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 20.0,
                                                color: Colors.red),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              });
                          usserController.clear();
                          passwordController.clear();
                          // emailController.clear();

                          //   ]) );
                          print('error de usuario');
                        }

                        print('diste clic');
                      },
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
