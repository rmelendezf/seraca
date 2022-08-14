import 'package:flutter/material.dart';
//import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'profilePage.dart';
import 'registroPage.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

 String _nombre = '';
 String _password = '';
 TextEditingController  _usserPasswordController = TextEditingController();
 bool _isLoggedIn = false;
 bool passwordVisible = false;

 //GoogleSingIn _googleSingIn = GoogleSingIn(scopes: ['email']);



  @override
  Widget build(BuildContext context) {
   return Scaffold(
    appBar: AppBar(title: const Text('LOG IN')),
    body: ListView(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 50.0),
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(0.0,15.0),
                blurRadius: 15.0),
            ],
          ),
        child: Padding(
          padding: EdgeInsets.only(left: 16.0, right: 20.0, top: 16.0),
          child: Column(            
            children: <Widget>[
              Text('Login', style: TextStyle(fontFamily: 'Poppins-Bold', letterSpacing: .6)),

              Divider(),

              Text('Username'),
              TextField(
                decoration: const InputDecoration(
                  hintText: 'Username',
                  
                  helperStyle: TextStyle(color: Colors.grey, fontSize: 12.0 ),
                ),
                onChanged: (valor) => setState(() {
                  _nombre = valor;
                }),
              ),

              Divider(),

              Text('Password'),
              TextFormField(
                keyboardType: TextInputType.visiblePassword,
                controller: _usserPasswordController,
                obscureText: passwordVisible,
                maxLength: 10,
                decoration: InputDecoration(
                  hintText: 'password',
                  helperStyle: TextStyle(color: Colors.grey, fontSize: 12.0 ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      passwordVisible
                      ? Icons.visibility
                     : Icons.visibility_off,
                    //Icons.visibility_off,
                      color: Theme.of(context).primaryColorDark,        
                    ),
                    onPressed: (){
                      setState(() {
                        passwordVisible = !passwordVisible;
                      });
                    },
                  )
                ),
              ),

              Row(
               // mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [

                  TextButton(                    
                    child: Text('Registrarse'), style: TextButton.styleFrom( padding: EdgeInsets.fromLTRB(10, 10, 10, 10), primary: Colors.teal, ),
                    onPressed: () {
                      final route = MaterialPageRoute(builder:(context) {
                        return RegistroPage();
                      });
                      Navigator.push(context, route);
                    }, 
                  ),

                  SizedBox(width: 100),

                  TextButton(                    
                    child: Text('Log In'), style: TextButton.styleFrom( padding: EdgeInsets.fromLTRB(10, 10, 10, 10), primary: Colors.teal, ),
                    onPressed: () {
                      if (_nombre == 'administrador'){
                        if (_password == '18671986') {
                      final route = MaterialPageRoute(builder:(context) {
                        return ProfilePage();
                          });
                      Navigator.push(context, route);
                      }} else {
                        print ('error usuario');
                      };
                    }, 
                  )
                ],
              ),
            ],
          ),
         ),
        )
      ]
    ),
  ); }
}