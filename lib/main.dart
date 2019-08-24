import 'package:flutter/material.dart';

void main(){
 runApp(MaterialApp(
   home: Home(),
 ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( //ele cria a barrinha roxa
        backgroundColor: Colors.deepPurple,
        title: Text("Calculadora de IMC"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.refresh),
              onPressed: () {
              })
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Icon(Icons.person, size: 100.0, color: Colors.deepPurple),
          TextField(keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: "Peso (kg):",
            labelStyle: TextStyle(color: Colors.deepPurple),
          ),
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.deepPurple, fontSize: 25.0, fontWeight: FontWeight.w500),
          ),

          TextField(keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: "Altura:",
              labelStyle: TextStyle(color: Colors.deepPurple),
            ),
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.deepPurple, fontSize: 25.0, fontWeight: FontWeight.w500),
          ),

        ],
      ),
    );
  }
}
