/**import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_seraca_1/api_vigilantes.dart';
//import 'package:flutter_seraca_1/nombre_vigilante.dart';
import 'package:flutter_seraca_1/repository/nuevo_usuario.dart';
import 'package:http/http.dart' as http;

class RegistroPage extends StatefulWidget {
  const RegistroPage({Key? key}) : super(key: key);

  @override
  State<RegistroPage> createState() => _RegistroPageState();
}

class _RegistroPageState extends State<RegistroPage> {
  final url = Uri.parse("http://localhost/seraca/api_seraca_local.php");
  final headers = {"Content-Type": "application/json;charset=UTF-8"};
  late Future<Usuario> usuario;
  final cedula = TextEditingController();
  final nombre = TextEditingController();
  final apellido = TextEditingController();
  final correo = TextEditingController();
  final avatar = TextEditingController();
  final fecha = TextEditingController();

  //String nombre = '';
  //String correo = '';
  //String password = '';
  //TextEditingController  usserController = TextEditingController();
  // TextEditingController  cedulaController = TextEditingController();
  // TextEditingController  correoController = TextEditingController();
  // TextEditingController  apellidoController = TextEditingController();
  // TextEditingController  fechaController = TextEditingController();
  // TextEditingController  avatarController = TextEditingController();

  // TextEditingController  passwordController = TextEditingController();
  //bool passwordVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Ingrese Datos'),
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
          children: [
            crearCedula(),
            Divider(),

            crearNombre(),
            Divider(),
            crearApellido(),
            Divider(),
            crearcorreo(),
            Divider(),
            crearAvatar(),
            Divider(),
            crearFecha(),
            Divider(),
            //  creaPassword(),

            const SizedBox(width: 100),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              TextButton(
                child: const Text('Cancelar'),
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                  primary: Colors.teal,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                  // ignore: sort_child_properties_last
                  child: const Text('Registrar'),
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                    primary: Colors.teal,
                  ),
                  onPressed: () {







                    saveUsuario();
                  /*  usuario = getUsuario();
                     Navigator.push(
                  context,
                 // MaterialPageRoute(builder: (context) => Api_vigilantes(usuario)),
                   MaterialPageRoute(builder: (context) => Api_vigilantes(encadena: 'http://localhost/seraca/api_seraca_local.php'))
                );*/
                    //Navigator.of(context).pop();
                  })

            ])
          ],
        ));
  }
 /*
  @override
  void initState() {
    super.initState();
    usuario = getUsuario();
  }


  Future<Usuario> getUsuario() async {
    final res = await http.get(url); //texto

    if (res.statusCode == 200) {
      final json = jsonDecode(res.body);
      final Usuario user = Usuario.fromJson(json);

      return user;
    }
    return Future.error('No se pudo cargar la informacion de usuario');
  }*/

 /** void saveUsuario() async {
   /* var user = {
      "cedula": cedula.text,
      "nombre": nombre.text,
      "apellido": apellido.text,
      "correo": correo.text,
      "avatar": avatar.text,
      "fecha": fecha.text*/
      var user= await .crearespecialidad()


    };
   // await   http.post(url, headers: headers, body: jsonEncode(user));

   /* setState(() {
      usuario = getUsuario();
    });*/
  }

  crearFecha() {
   // String fecha = '';
   // TextEditingController fechaController = TextEditingController();
    return TextField(
      controller: fecha,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        hintText: 'Fecha de Registro',
        labelText: 'Fecha',
        suffixIcon: const Icon(Icons.accessibility),
        icon: const Icon(Icons.account_circle),
      ),
     /** onChanged: (valor) {
        setState(() {
          fecha = valor;
        });
      },*/
    );
  }

  crearAvatar() {
   // String avatar = '';
   // TextEditingController avatarController = TextEditingController();
    return TextField(
      controller: avatar,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        hintText: 'URL imagen de la Persona',
        labelText: 'Avatar',
        suffixIcon: Icon(Icons.accessibility),
        icon: Icon(Icons.account_circle),
      ),
     /** onChanged: (valor) {
        setState(() {
          avatar = valor;
        });
      },*/
    );
  }

  crearApellido() {
   // String apellido = '';
   // TextEditingController apellidoController = TextEditingController();
    return TextField(
      controller: apellido,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        hintText: 'Apellido de la Persona',
        labelText: 'Apellido',
        suffixIcon: Icon(Icons.accessibility),
        icon: Icon(Icons.account_circle),
      ),
     /** onChanged: (valor) {
        setState(() {
          apellido = valor;
        });
      },*/
    );
  }

  crearCedula() {
   // String cedula = '';
  //  TextEditingController cedulaController = TextEditingController();
    return TextField(
      controller: cedula,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        hintText: 'Cedula de la Persona',
        labelText: 'Cedula',
        suffixIcon: Icon(Icons.accessibility),
        icon: Icon(Icons.account_circle),
      ),
     /* onChanged: (valor) {
        setState(() {
          cedula = valor;
        });
      },*/
    );
  }

  crearNombre() {



    //String nombre = '';
    //TextEditingController usserController = TextEditingController();
    return TextField(
      controller: nombre,
      decoration: InputDecoration(
        hintText: 'Nombre',
        labelText: 'nombre',
        helperStyle: TextStyle(color: Colors.black, fontSize: 1.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        suffixIcon: Icon(Icons.accessibility),
        icon: Icon(Icons.account_circle),
      ),
      /*onChanged: (valor) => setState(() {
        nombre = valor;
      }),*/
    );
  }

  crearcorreo() {
  //  TextEditingController correoController = TextEditingController();
  //  String correo = '';
    return TextField(
      controller: correo,
      keyboardType: TextInputType.emailAddress,
      // controller: correoController,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        hintText: 'ejemplo@gmail.com',
        labelText: 'correo',
        suffixIcon: Icon(Icons.alternate_email),
        icon: Icon(Icons.email),
      ),
      /*onChanged: (valor) {
        setState(() {
          correo = valor;
        });
      },*/
    );
  }*/
}*/
