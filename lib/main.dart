import 'package:flutter/material.dart';
import 'package:flutter_seraca_1/pdf.dart';

import 'contactos.dart';
import 'respaldo.dart';


//primero debemos importar los paquetes

void main() => runApp( const MiPrimeraApp());
 //la primera funcion main es la que llama a el primer widget de todo el programa; en mi caso MiprimeraAplicacion
 //a traves del metodo runApp
 //ahora debemos crear ese primer widget

 class MiPrimeraApp extends StatelessWidget {
   const MiPrimeraApp({Key? key}) : super(key: key);
 
   @override
   Widget build(BuildContext context) {
    // seguidamente colocamos un material app que es un patron de diseño de google
     return const MaterialApp(
      //el Material app me pide un parametro title para mi nombre interno de la app
      //y un widget home que es el que llama y crea el widget de inicio de mi aplicacion privada q llame inicio
      //o puede usar otro nombre
      title: 'Mi Primera App',
      home: Inicio(),
     );
   }
 }
// importante saber la diferencia y en que momento usar un StatelessWidget y un StateFullWidget

 class Inicio extends StatefulWidget {
   const Inicio({Key? key}) : super(key: key);
 
   @override
   State<Inicio> createState() => _InicioState();
 }
 
 class _InicioState extends State<Inicio> {
   @override
   Widget build(BuildContext context) {
    final elevatedButtonStyle = ElevatedButton.styleFrom(
      primary: Color.fromARGB(255, 57, 4, 114),
      onPrimary: Color.fromARGB(255, 200, 216, 22)
    );

     return Scaffold(
      //a diferencia del materialApp el Scaffold nos pide un appbar
      //el AppBarr es la franja superior de la pantalla y nos pide el tietle
      appBar: AppBar(
        title: const Text('SERENOS   ACARIGUA, C.A.'),

      ),
       
      //tambien nos pide un body y al body podemos colocarle un center
      //el center y algunos otros widget tienen la propiedad de tener widget hijos (child)
      backgroundColor: Colors.grey[300],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //asi como el column hay muchos widget quw aceptan varios hijos children
        //como el ListView que permite navegar entre las imagenes
        //podemos usar funciones de MainAxisAligment y MainAxisize
        children: [
          const Text('BIENVENIDOS'),
          Container(
            //agregregue una imagen
            padding: const EdgeInsets.all(50.0),
            child: Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTiNtFSaO6Hsk-i8FeqWylxl_F9jf-99-x6iA&usqp=CAU'
             ),
            
          ),
          
           Row( 
            
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [


                  ElevatedButton(
                    style: elevatedButtonStyle,
                    child: Text('CONTINUAR'),
                   onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage(title: 'REGRESAR',)),
                );
              },
                  ),

                  ElevatedButton(
                    style: elevatedButtonStyle,
                    child: Text('SALIR'),
                    onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TerceraRoute()),
                    );
                  },
                  ), 


                ], 
       
             
              )

         ],


            
      ),

           
            
            
            
      );
          
       
        
      
   }
 }
 
class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 
  
  String mensaje = "REGRESAR";

  
  

  @override
  Widget build(BuildContext context) {

    final elevatedButtonStyle = ElevatedButton.styleFrom(
      primary: Color.fromARGB(255, 57, 4, 114),
      onPrimary: Color.fromARGB(255, 200, 216, 22)
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      backgroundColor: Colors.grey[350],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            
            SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            
              child:    Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                // Content of my Row

                //Item 1/4
                ElevatedButton(
                   style: elevatedButtonStyle,
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    
                    child: const Text("OFERTA DE SERVICIO"),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PDF(enlace: 'https://flutterrmlendezf.000webhostapp.com/flutter%20seraca/OFERTA%20DE%20SERVICIO%20ALIVENSA.pdf')),
                    );
                  },
                ),
                //Item 2/4
                ElevatedButton(
                   style: elevatedButtonStyle,
                  child: Container(
                    padding: const EdgeInsets.all(15),
                   
                    child: const Text("NUESTROS CONTACTOS"),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Contacto(cadena: 'https://dummyjson.com/products/categories')),
                    );
                  },
                ),

                //Item 3/4

                ElevatedButton(
                   style: elevatedButtonStyle,
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    
                    child: const Text("REFERENCIAS"),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Referencia(encadena: 'https://api.giphy.com/v1/gifs/trending?api_key=PmYoyrNJUlptKppYJNhajYVh7S70R2xk&limit=10&rating=g')),
                    );
                  },
                ),

                //Item 4/4
                ElevatedButton(
                   style: elevatedButtonStyle,
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    
                    child: const Text("SALIR"),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TerceraRoute()),
                    );
                  },
                ),
              ],
            ),
              ),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[Expanded(child: 
                 Container(
                  
            //agregregue una imagen
            padding: const EdgeInsets.all(10.0),
            child: Image.network('https://media.giphy.com/media/lX7evzxckskndyUAUv/giphy.gif'
             ),
                 )
            
              )
              ],
            ),
          ],
        ),
      ),
    );
  }
}


class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("REGRESAR"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('EN CONSTRUCCION'),
        ),
      ),
    );
  }
}

class TerceraRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GRACIAS  POR  PREFERIRNOS", style: TextStyle(fontSize: 16)),
      ),
      body: Center(
        child:  Image(
               image: NetworkImage('https://media.giphy.com/media/kNc8zFSkl4W40Cn5OV/giphy.gif'),
               height: 300,
            ),
            ),

       
        );
      
    
  }
}


//class MyAppState extends State<MyApp>{
// late PdfViewerController _pdfViewerController;


