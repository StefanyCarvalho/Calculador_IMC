import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _peso = TextEditingController();
  final _altura = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String _result = "Informe sua altura e seu peso!";
  final _alturaFocus = FocusNode();

  void _calculateIMC() {
    if (_formKey.currentState.validate()) {
      double peso = double.parse(_peso.text);
      double altura = double.parse(_altura.text);
      double resultado = peso / (altura * altura);
      setState(() {
        if (resultado < 17) {
          _result = "Muito abaixo do peso";
        } else if (resultado <= 18.49) {
          _result = "Abaixo do peso";
        } else if (resultado <= 24.99) {
          _result = "Peso normal";
        } else if (resultado <= 29.99) {
          _result = "Acima do peso";
        } else if (resultado <= 34.99) {
          _result = "Obesidade I";
        } else if (resultado <= 39.99) {
          _result = "Obesidade II (severa)";
        } else if (resultado >= 40.00) {
          _result = "Obesidade III (mórbida)";
        }
      });
    }
  }

  void _resetState(FocusScopeNode scope) {
    scope.unfocus();
    setState(() {
      _peso.clear();
      _altura.clear();
      _formKey.currentState.reset();
      _result = "Informe sua altura e seu peso!";

    });
  }

  @override
  Widget build(BuildContext context) {
    final focus = FocusScope.of(context);
    return GestureDetector(
      onTap: focus.unfocus,
      child: Scaffold(
        // o Scaffold cria a tela em branco com propriedades necessarias para o app
        appBar: AppBar(
          //ele cria a barrinha roxa
          backgroundColor: Colors.deepPurple,
          title: Text("Calculadora de IMC"),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () => _resetState(focus),
            )
          ],
        ),
        body: SingleChildScrollView(
          //rolagem da tela
          padding: EdgeInsets.all(16.0),
          child: Form(
            //valida todos os campos dentro dele
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Icon(Icons.person, size: 100.0, color: Colors.deepPurple),
                TextFormField(
                  //ao botao ser pressionado no campo peso,
                  onFieldSubmitted: (_) => focus.requestFocus(_alturaFocus),
                  controller: _peso,
                  // ignore: missing_return
                  validator: (v) {
                    if (v.isEmpty) {
                      return "Insira o seu peso";
                    }
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Peso (kg):",
                    labelStyle: TextStyle(color: Colors.deepPurple),
                  ),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.deepPurple,
                      fontSize: 25.0,
                      fontWeight: FontWeight.w500),
                ),
                TextFormField(
                  focusNode: _alturaFocus,
                  controller: _altura,
                  // ignore: missing_return
                  validator: (v) {
                    if (v.isEmpty) {
                      return "Insira a sua altura";
                    }
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Altura:",
                    labelStyle: TextStyle(color: Colors.deepPurple),
                  ),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.deepPurple,
                      fontSize: 25.0,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 16.0,
                ),
                SizedBox(
                  // Ele aumenta o tamanho do elemento que esta nele
                  height: 48.0,
                  child: RaisedButton(
                    onPressed: _calculateIMC,
                    child: Text(
                      "Calcular",
                      style: TextStyle(fontSize: 16.0, color: Colors.white),
                    ),
                    color: Colors.deepPurple,
                  ),
                ),
                SizedBox(
                  height: 16.0,
                ),
                Text(
                  _result,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.deepPurple,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
