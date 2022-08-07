import 'package:flutter/material.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "SERENOS ACARIGUA, C.A.",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const Logo(),
    );
  }
}



class Logo extends StatefulWidget {
 const Logo({key}) : super (key : key);
    
  @override
    LogoState createState() => LogoState();
  }
    
  class LogoState extends State<Logo> {
    @override 
  Widget build(BuildContext context) {
    String mensaje = "CONTINUAR";
    return Scaffold(
      appBar: AppBar(
        
        title: const Text(" SERENOS  ACARIGUA C.A,           BIENVENIDOS"),
      ),
      backgroundColor: Colors.grey[600],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ElevatedButton(
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  border: Border.all(color: Colors.black, width: 4.0),
                  borderRadius: const BorderRadius.all(Radius.circular(32.0)),
                ),
                child: const Text("CONTINUAR"),
                       
                
              ),
              onPressed: () {const Image(
               image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS1Ip7kBhC6Dna9CtExeL5Nr58IfdkwCwSv6W2xUaeMNGcMXekPAvG1QufXEbOLjIDoOC8&usqp=CAU'),
               height: 140,
            );
            child: const Text("GRACIAS POR PREFERIRNOS");
                
              },
            ),
            const Image(
               image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS1Ip7kBhC6Dna9CtExeL5Nr58IfdkwCwSv6W2xUaeMNGcMXekPAvG1QufXEbOLjIDoOC8&usqp=CAU'),
               height: 140,
            ),
          ],
        ),
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

//class MiPrimerCajon
class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  
  String mensaje = "CONTINUAR";

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  ///intento 2
  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }
  
  

  @override
  Widget build(BuildContext context) {
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
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      border: Border.all(color: Colors.black, width: 4.0),
                      borderRadius: const BorderRadius.all(Radius.circular(32.0)),
                    ),
                    child: const Text("OFERTA DE SERVICIO"),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SecondRoute()),
                    );
                  },
                ),
                //Item 2/4
                ElevatedButton(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      border: Border.all(color: Colors.black, width: 4.0),
                      borderRadius: const BorderRadius.all(Radius.circular(32.0)),
                    ),
                    child: const Text("NUESTROS CONTACTOS"),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SecondRoute()),
                    );
                  },
                ),

                //Item 3/4

                ElevatedButton(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      border: Border.all(color: Colors.black, width: 4.0),
                      borderRadius: const BorderRadius.all(Radius.circular(32.0)),
                    ),
                    child: const Text("REFERENCIAS"),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SecondRoute()),
                    );
                  },
                ),

                //Item 4/4
                ElevatedButton(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      border: Border.all(color: Colors.black, width: 4.0),
                      borderRadius: const BorderRadius.all(Radius.circular(32.0)),
                    ),
                    child: const Text("SALIR"),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyApp()),
                    );
                  },
                ),
              ],
            ),
              ),
            const Text('Pulse para evaluar la calidad de nuestro servicio', style: TextStyle(fontSize: 25)),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  onPressed: _incrementCounter,
                  child: const Icon(Icons.add),
                ),
                ElevatedButton(
                  onPressed: _decrementCounter,
                  child: const Icon(Icons.remove),
                ),
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
        title: const Text("VOLER"),
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
