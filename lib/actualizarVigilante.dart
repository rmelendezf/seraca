import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_seraca_1/api_vigilantes.dart';
import 'package:http/http.dart' as http;

//Future<List<Nuevo_usuario>> crearVigilante(

Future<Nuevo_usuario> crearVigilante(
  //ORIGINAL
  dynamic cedula,
  dynamic nombre,
  dynamic apellido,
  dynamic correo,
  dynamic avatar,
  dynamic fecha,
  // String evento
) async {
  Map<String, String> headers = {
    "Content-Type": "application/x-www-form-urlencoded"
  };

  /*var nuevobody = {
        'cedula': cedula,
        'nombre': nombre,
        'apellido': apellido,
        'correo': correo,
        'avatar': avatar,
        'fecha': fecha
      }*/

  final response = await http.post(
      Uri.parse(
          'http://localhost/seraca/apiSimple_local/items/updateSeraca.php'),
      headers: headers,
      body: json.encode({
        'cedula': cedula,
        'nombre': nombre,
        'apellido': apellido,
        'correo': correo,
        'avatar': avatar,
        'fecha': fecha
      }));

  print(response);
  print(cedula);
  print(nombre);
  print(apellido);
  print(correo);
  print(avatar);
  print(fecha);

  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.

    // String bien = utf8.decode(response.body);

    //  final jsonDatos = jsonDecode(bien);

/**Cambiar endata: User.fromJson(json.decode(json['data'])), */

    return Nuevo_usuario.fromJson(
        json.decode(json.encode(response.body))); //ORIGINAL

    //print(Nuevo_usuario);
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.

    throw "SE HA ACTUALIZADO UN REGISTRO";

    //throw Exception(response);
  }
}

//class List<Nuevo_usuario> {
class Nuevo_usuario {
  //ORIGINAL
  dynamic cedula;
  dynamic nombre;
  dynamic apellido;
  dynamic correo;
  dynamic avatar;
  dynamic fecha;
  // final String evento;

  // const List<Nuevo_usuario>(
  Nuevo_usuario(
      //ORIGINAL
      {this.cedula,
      this.nombre,
      this.apellido,
      this.correo,
      this.avatar,
      this.fecha
      //  required this.evento,
      });

  Nuevo_usuario.fromJson(Map<String, dynamic> json) {
    cedula = json['cedula'];
    nombre = json['nombre'];
    apellido = json['apellido'];
    correo = json['correo'];
    avatar = json['avatar'];
    fecha = json['fecha'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> NuevoUsuario = Map<String, dynamic>();
    NuevoUsuario['cedula'] = this.cedula;
    NuevoUsuario['nombre'] = this.nombre;
    NuevoUsuario['apellido'] = this.apellido;
    NuevoUsuario['correo'] = this.correo;
    NuevoUsuario['avatar'] = this.avatar;
    NuevoUsuario['fecha'] = this.fecha;
    return NuevoUsuario;
  }

  //factory List<Nuevo_usuario>.fromJson(Map<String, String> json) {
  /* factory Nuevo_usuario.fromJson(Map<String, dynamic> json) =>            //ORIGINAL
    //return List<Nuevo_usuario>( 
     Nuevo_usuario(                                              //ORIGINAL
        cedula: json['cedula'],
        nombre: json['nombre'],
        apellido: json['apellido'],
        correo: json['correo'],
        avatar: json['avatar'],
        fecha: json['fecha']
       // evento: json['evento']
        );
  }*/
}

//Void(Future showDialog) {}

//void main() {

//runApp( ActualizarVigilante());
//}

class ActualizarVigilante extends StatefulWidget {
  String cedulaAct;
  String nombreAct;
  String apellidoAct;
  String correoAct;
  String avatarAct;
  String fechaAct;
  ActualizarVigilante(this.cedulaAct, this.nombreAct, this.apellidoAct,
      this.correoAct, this.avatarAct, this.fechaAct,
      {super.key});
  // ActualizarVigilante({super.key});

  @override
  State<ActualizarVigilante> createState() {
    return _ActualizarVigilanteState();
  }
}

class _ActualizarVigilanteState extends State<ActualizarVigilante> {
  final _cedula = TextEditingController();
  final _nombre = TextEditingController();
  final _apellido = TextEditingController();
  final _correo = TextEditingController();
  final _avatar = TextEditingController();
  final _fecha = TextEditingController();
  final valor = TextEditingController();
  
  // final evento = 'registrarUsuario';

  //Future<Nuevo_usuario>? _futureAlbum;             //ORIGINAL
  Future<Nuevo_usuario>? _futureAlbum;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('REGRESAR'),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8.0),
        child: (_futureAlbum == null) ? buildColumn() : buildFutureBuilder(),
      ),
    );
    // );
  }

  Column buildColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        // crearCedula(valor:widget.cedulaAct),
        Divider(),
        crearNombre(valor: widget.nombreAct),
        Divider(),
        crearApellido(valor: widget.apellidoAct),
        Divider(),
        crearcorreo(valor: widget.correoAct),
        Divider(),
        crearAvatar(valor: widget.avatarAct),
        Divider(),
        crearFecha(valor: widget.fechaAct),
        Divider(),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          ElevatedButton(
            onPressed: (){ 
              if (_nombre == "" || _apellido  == "" || _correo == "" || _avatar == "" || _fecha == "") {

                  RevisarDatos();
                   
                  


                } else {

                 // async

              /*   var param = {"cedula": _cedula};
                  if (_nombre == "" || _
                  if  
                    await http.post(
                        Uri.parse(
                            'http://localhost/seraca/apiSimple_local/items/deleteSeraca.php'),
                        headers: <String, String>{
                          'Content-Type': 'application/json; charset=UTF-8',
                        },
                        body: json.encode(param)
                        //var encryptedBosy = jsonEncode({'body': encrypted.base64});
                        );*/

              /*  _futureAlbum = crearVigilante(
                     widget.cedulaAct, 
                    _nombre.text,
                    _apellido.text, 
                    _correo.text, 
                    _avatar.text, 
                    _fecha.text);*/

              setState(() {
                _futureAlbum = crearVigilante(widget.cedulaAct, _nombre.text,
                    _apellido.text, _correo.text, _avatar.text, _fecha.text);
              });

              //  evento);
              // body['evento']);
              // print(_futureAlbum);

              //   print(evento);
              print(widget.cedulaAct);
              print(_nombre.text);
              print(_apellido.text);
              print(_correo.text);
              print(_avatar.text);
              print(_fecha.text);

              AvisoActualizado();
            }

              // Navigator.pop(context);
            },
            child: const Text('ACTUALIZAR'),
          ),
          Divider(),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('CANCELAR'),
          ),
        ])
      ],
    );
  }

  // FutureBuilder<List<Nuevo_usuario>> buildFutureBuilder() {
  FutureBuilder<Nuevo_usuario> buildFutureBuilder() {
    //ORIGINAL
    // return FutureBuilder<List<Nuevo_usuario>>(
    return FutureBuilder<Nuevo_usuario>(
      //  ORIGINAL
      future: _futureAlbum,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text("HAY DATOS");
          return Text(
              snapshot.data!.cedula); //POR QUE SOLO CEDULA           ORIGINAL
          print('si hay datos');
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
          print('error en el futuer Builder, solo cedula');
        }

        return const CircularProgressIndicator();
      },
    );
  }

  /*crearCedula({required String valor}) {
    return TextField(      
      controller: _cedula,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        hintText: 'Cedula de la Persona',
        labelText: valor,
        suffixIcon: Icon(Icons.accessibility),
        icon: Icon(Icons.account_circle),
      ),
    );
  }*/

  crearNombre({required String valor}) {
     // TextEditingController _nombre = valor as TextEditingController;
    return TextField(
      autofocus: true,
      keyboardType: TextInputType.name,
      textCapitalization: TextCapitalization.words,
      maxLength: 20,
      maxLines: 1,
      scrollPhysics: ClampingScrollPhysics(),
     
     // onTap: () => valor,
     // onSubmitted: (value) => valor,
      //onEditingComplete: () => valor ,
      //readOnly: true,  //protege el registro muy interesante
      //restorationId: valor,
      //obscuringCharacter: valor,
      //onChanged: (value) => valor,
      controller: _nombre,
      decoration: InputDecoration(
        hintText: 'Nombre de la persona',
        labelText: valor,
        helperStyle: TextStyle(color: Colors.black, fontSize: 1.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        suffixIcon: Icon(Icons.accessibility),
        icon: Icon(Icons.account_circle),
      ),
    );
  }

  crearApellido({required String valor}) {
    controller: valor;
    return TextField( 
      autofocus: true,
      keyboardType: TextInputType.name,
      textCapitalization: TextCapitalization.words,
      maxLength: 20,  
      maxLines: 1,
      scrollPhysics: ClampingScrollPhysics(), 
      controller: _apellido,
      decoration: InputDecoration(
        
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        hintText: 'Apellido de la Persona',
        labelText: valor,
        suffixIcon: Icon(Icons.accessibility),
        icon: Icon(Icons.account_circle),
      ),
    );
  }

  crearcorreo({required String valor}) {
    return TextField(
      autofocus: true,
      maxLines: 1,
      scrollPhysics: ClampingScrollPhysics(),
      controller: _correo,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        hintText: 'ejemplo@gmail.com',
        labelText: valor,
        suffixIcon: Icon(Icons.alternate_email),
        icon: Icon(Icons.email),
      ),
    );
  }

  crearAvatar({required String valor}) {
    return TextField(
      autofocus: true,
      keyboardType: TextInputType.url,
      maxLines: 1,
      scrollPhysics: ClampingScrollPhysics(),
      controller: _avatar,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        hintText: 'URL imagen de la Persona',
        labelText: valor,
        suffixIcon: Icon(Icons.accessibility),
        icon: Icon(Icons.account_circle),
      ),
    );
  }

  crearFecha({required String valor}) {
    return TextField(
      autofocus: true,
      keyboardType: TextInputType.datetime,
      maxLength: 10,
      controller: _fecha,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        hintText: 'Fecha de Registro',
        labelText: valor,
        suffixIcon: const Icon(Icons.accessibility),
        icon: const Icon(Icons.account_circle),
      ),
    );
  }

  void AvisoActualizado() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (_) {
          Future.delayed(Duration(seconds: 4), () {
            Navigator.pop(context);
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
                      Icons.person_add_alt_1,
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
                      'EL REGISTRO HA SIDO ACTUALIZADO',
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
  
  void RevisarDatos() {

    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (_) {
          Future.delayed(Duration(seconds: 4), () {
            Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Api_vigilantes()));
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
                      Icons.person_add_alt_1,
                      color: Colors.amber,
                      size: 50,
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.transparent,
                    ),
                    child: const Text(
                      'Datos Incorrectos',
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
                      'POR FAVOR REVISE LOS CAMPOS E INTENTE DE NUEVO',
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
