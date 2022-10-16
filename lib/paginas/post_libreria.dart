import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_seraca_1/api_vigilantes.dart';
import 'package:http/http.dart' as http;


Future <Nuevo_usuario> crearVigilante(             //ORIGINAL
    dynamic cedula, 
    dynamic nombre,
    dynamic apellido,
    dynamic correo,
    dynamic avatar,
    dynamic fecha,
   // String evento
    )
     async {
      Map<String, String> headers = {
"Content-Type": "application/x-www-form-urlencoded"    
};
      
  final response =
      await http.post(Uri.parse('http://localhost/seraca/api_post_local.php?evento=registrarUsuario'),
            headers: headers, 

            body: {
              'cedula': cedula,
              'nombre': nombre,
              'apellido': apellido,
              'correo': correo,
              'avatar': avatar,
              'fecha': fecha        
          }
        );
        

        



         print(response);
         print(cedula);

  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.

    
     // String bien = utf8.decode(response.body);

    //  final jsonDatos = jsonDecode(bien);
      
     
/**Cambiar endata: User.fromJson(json.decode(json['data'])), */

    return Nuevo_usuario.fromJson(json.decode(json.encode(response.body))); //ORIGINAL
        
     //print(Nuevo_usuario);
  } else {                                                    
    // If the server did not return a 201 CREATED response,
    // then throw an exception.

   
    
     throw  "NUEVO REGISTRO CREADO";
    
    
    //throw Exception(response);
  }
  
}

//class List<Nuevo_usuario> {
class Nuevo_usuario {                                       //ORIGINAL
   dynamic cedula;
  dynamic nombre;
  dynamic apellido;
  dynamic correo;
  dynamic avatar;
  dynamic fecha;
 // final String evento;


 // const List<Nuevo_usuario>(
   Nuevo_usuario(                                     //ORIGINAL
      { this.cedula,
       this.nombre,
       this.apellido,
       this.correo,
       this.avatar,
       this.fecha
    //  required this.evento,
      });

      Nuevo_usuario
  .fromJson(Map<String, dynamic> json) {
    cedula = json['cedula'];
    nombre = json['nombre'];
    apellido = json['apellido'];
    correo = json['correo'];
    avatar = json['avatar'];
    fecha = json['fecha'];
  }

  

   Map<String, dynamic> toJson() {
    final Map<String, dynamic> NuevoUsuario =  Map<String, dynamic>();
    NuevoUsuario['cedula'] = this.cedula;
    NuevoUsuario['nombre'] = this.nombre;
    NuevoUsuario['apellido'] = this.apellido;
    NuevoUsuario['correo'] = this.correo;
    NuevoUsuario['avatar'] = this.avatar;
    NuevoUsuario['fecha'] = this.fecha;
    return NuevoUsuario;
  }  
}

void main() {
  runApp( Post_libreria());
}

class Post_libreria extends StatefulWidget {
   Post_libreria({super.key});

  @override
  State<Post_libreria> createState() {
    return _Post_libreriaState();
  }
}

class _Post_libreriaState extends State<Post_libreria> {
  final _cedula = TextEditingController();
  final _nombre = TextEditingController();
  final _apellido = TextEditingController();
  final _correo = TextEditingController();
  final _avatar = TextEditingController();
  final _fecha = TextEditingController();
 // final evento = 'registrarUsuario';

   //Future<Nuevo_usuario>? futureAlbum
   //;             //ORIGINAL
  Future<Nuevo_usuario>? futureAlbum
  ;

  @override
  Widget build(BuildContext context) { 
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 116, 204, 241),
      appBar: AppBar(
        title: const Text('REGRESAR'),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8.0),
        child: (futureAlbum
         == null) ? buildColumn() : buildFutureBuilder(),
        
      ),
     
    );
    // );
  }

  Column buildColumn() {
    return
      
      
      Column(
      
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(child: 

        ListView(
             // scrollDirection: Axis.vertical,
              //child:


       // Expanded(child:Container (height: 600,
                //padding: const EdgeInsets.symmetric(horizontal: 10.0),
                //child: Column(
                //  crossAxisAlignment: CrossAxisAlignment.start,
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

        ElevatedButton(
          style: ElevatedButton.styleFrom(
                
                primary: Color.fromARGB(255, 44, 101, 223),
                onPrimary: Color.fromARGB(255, 225, 225, 230),
                shadowColor: const Color.fromARGB(255, 134, 15, 7),
                elevation: 10,
                side: const BorderSide(
                    color: Color.fromARGB(255, 36, 53, 206), width: 1),
                shape: const BeveledRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(3))),
                textStyle: const TextStyle(
                    color: Color.fromARGB(255, 114, 5, 10),
                    fontSize: 50,
                    fontStyle: FontStyle.normal),
              ),
     
          onPressed: () {

            if (_cedula == "" || _nombre == "" || _apellido  == "" || _correo == "" || _avatar == "" || _fecha == "") {

                  RevisarNuevosDatos();
                   
                  


                } else {


            setState(() {
              futureAlbum
               = crearVigilante(
                  _cedula.text,
                  _nombre.text,
                  _apellido.text,
                  _correo.text,
                  _avatar.text,
                  _fecha.text);              
            });
           

            
                   

                    AvisoCreado(); 

                 

                   

                    

          }
          },
          child: const Text("REGISTRAR",
                  style: TextStyle(
                      color: Color.fromARGB(255, 235, 236, 226),
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold)),
        ),
                  ]

                )
                )
       // ))
      ]
      
    );
  }

 // FutureBuilder<List<Nuevo_usuario>> buildFutureBuilder() {
  FutureBuilder<Nuevo_usuario> buildFutureBuilder() {                       //ORIGINAL
    // return FutureBuilder<List<Nuevo_usuario>>(
    return FutureBuilder<Nuevo_usuario>(                //  ORIGINAL
      future: futureAlbum
      ,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text("HAY DATOS");
          return Text(snapshot.data!.cedula); //POR QUE SOLO CEDULA           ORIGINAL
          print('si hay datos');
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
          print('error en el futuer Builder, solo cedula');
        }

        return const CircularProgressIndicator();
      },
    );
  }

  crearCedula() {
    return TextField(
      autofocus: true,
      keyboardType: const TextInputType.numberWithOptions(),
      style: const TextStyle(color: Colors.red),
      cursorColor: Colors.red,
      maxLength: 10,
      controller: _cedula,
      decoration: InputDecoration(
        
        filled: true,
                    fillColor:Colors.black26,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        hintText: 'Cedula de la Persona',
        labelText: 'Ejemp: 1234567890',
        suffixIcon: const Icon(Icons.accessibility, color: Colors.red),
        icon: const Icon(Icons.account_circle, color: Colors.red),
      ),
    );
  }

  crearNombre() {
    return TextField(
      autofocus: true,
      keyboardType: TextInputType.name,
      textCapitalization: TextCapitalization.words,
      maxLines: 1,
      scrollPhysics: ClampingScrollPhysics(),
      maxLength: 20,
      controller: _nombre,
      decoration: InputDecoration(
        filled: true,
                    fillColor: Colors.black26,
        hintText: 'Nombre',
        labelText: 'Ejemp: Roberto Antonio',
        //helperStyle: TextStyle(color: Colors.black, fontSize: 1.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        suffixIcon: Icon(Icons.accessibility),
        icon: Icon(Icons.account_circle),
      ),
    );
  }

  crearApellido() {
    return TextField(
      autofocus: true,
      keyboardType: TextInputType.name,
      textCapitalization: TextCapitalization.words,
      maxLength: 20,
      maxLines: 1,
      scrollPhysics: ClampingScrollPhysics(),
      controller: _apellido,
      decoration: InputDecoration(
        filled: true,
                    fillColor: Colors.black26,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        hintText: 'Apellido',
        labelText: 'Ejemp: Rodriguez Uzcategui',
        suffixIcon: Icon(Icons.accessibility),
        icon: Icon(Icons.account_circle),
      ),
    );
  }

  crearcorreo() {
    return TextField(
      autofocus: true, 
      keyboardType: TextInputType.emailAddress, 
      maxLines: 1,
      scrollPhysics: ClampingScrollPhysics(),    
      controller: _correo,      
      decoration: InputDecoration(
        filled: true,
                    fillColor:Colors.black26,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        hintText: 'Correo',
        labelText: 'ejemplo@gmail.com',
        suffixIcon: Icon(Icons.alternate_email),
        icon: Icon(Icons.email),
      ),
    );
  }

  crearAvatar() {
    return TextField(
      autofocus: true,
      keyboardType: TextInputType.url,
      maxLines: 1,
      scrollPhysics: ClampingScrollPhysics(),
      controller: _avatar,
      decoration: InputDecoration(
        filled: true,
                    fillColor: Colors.black26,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        hintText: 'URL imagen de la Persona',
        labelText: 'Ejemp: https://thumbs.dreamstime.com/z/gov-25007858.jpg',
        suffixIcon: Icon(Icons.accessibility),
        icon: Icon(Icons.account_circle),
      ),
    );
  }

  crearFecha() {
    return TextField(
      autofocus: true,
      keyboardType: TextInputType.datetime,
        maxLength: 10,
      controller: _fecha,
      decoration: InputDecoration(

        filled: true,
                    fillColor: Colors.black26,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        hintText: 'Fecha de Registro', 
        labelText: 'Ejemp: DD/MM/AAAA',
        suffixIcon: const Icon(Icons.accessibility),
        icon: const Icon(Icons.account_circle),
      ),
    );
  }
  
  void AvisoCreado() {
    showDialog(
        barrierDismissible: true,
        context: context,
        builder: (_) {
       //   Future.delayed(Duration(seconds: 3), () {
       //    Navigator.of(context).pop(true);
       //   });
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
                      'Registro Exitoso',
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
                      '¿DESEA REALIZAR OTRO REGISTRO?',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20.0, color: Colors.red),
                    ),
                  )
                ],
              ),
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
                  onPressed: ()  {

                    Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Post_libreria()));



                 // final route = MaterialPageRoute(builder: (context) {
                    //  return Post_libreria();

                   // });


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


                  Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Api_vigilantes()));




                 // Navigator.pop(context);
                },
              ),
            ),
          ]),
        ],



          );
        });
  }
  
  void RevisarNuevosDatos() {

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
