import 'package:flutter/material.dart';

class RegistroPage extends StatefulWidget {
  const RegistroPage({Key? key}) : super(key: key);

  @override
  State<RegistroPage> createState() => _RegistroPageState();
}

class _RegistroPageState extends State<RegistroPage> {

  //String _nombre = '';
 // String _email = '';
//  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Input de Texto'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: [
          _crearInput(),
          Divider(),
          _crearEmail(),
          Divider(),
          _creaPassword(),
        ],
      )
    );    
  }
}





_crearInput() {
  String _nombre = '';

  return TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0)
              ),
              hintText: 'Nombre de la Persona',
              labelText: 'Nombre',
              suffixIcon: Icon(Icons.accessibility),
              icon: Icon(Icons.account_circle),
            ),
            onChanged: (valor) {
              setState(() {
                _nombre = valor;
              });              
            },
          );
}

void setState(Null Function() param0) {
}

_crearEmail() {
  String _email = '';
  return TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0)
              ),
              hintText: 'ejemplo@gmail.com',
              labelText: 'email',
              suffixIcon: Icon(Icons.alternate_email),
              icon: Icon(Icons.email),
            ),
            onChanged: (valor) {
              setState(() {
                _email= valor;
              });              
            },
          );
}


_creaPassword() {
  String _password = '';
  return TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0)
              ),
              hintText: 'ejemplo@gmail.com',
              labelText: 'email',
              suffixIcon: Icon(Icons.password),
              icon: Icon(Icons.password),
            ),
            onChanged: (valor) {
              setState(() {
                _password= valor;
              });              
            },
          );

}

