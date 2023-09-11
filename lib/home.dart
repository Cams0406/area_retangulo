import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _controllerBase = TextEditingController();
  TextEditingController _controllerAltura = TextEditingController();
  String _textoResultado="";
  void _calcular() {

    double? base = double.tryParse(_controllerBase.text);
    double? altura = double.tryParse(_controllerAltura.text);
    double? area;

    if(base == null || altura == null) {
        setState(() {
          _textoResultado =
          "Número inválido, digite números maiores de zero e ponto decimal";
        });
    
    }else{
      area = base * altura;
        setState(() {
         _textoResultado = area.toString();
         _controllerBase.clear();
         _controllerAltura.clear();
        });
    }
  }

  
 @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
    title: Text("Área do Retangulo"),
    backgroundColor: Colors.pink,
     ),
     body: Container(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(32),
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Center(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 32),
          child: Image(
            image: AssetImage("imagens/retangulo.png"),
            width:300
          ),
        ),
        ),
        Center(
          child: Padding(
            padding: EdgeInsets.only(bottom: 32),
            child: Text("Qual é a área do seu retângulo",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 25,
              color: Colors.blue,
              decoration: TextDecoration.underline),
            )
            )),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Base" ),
              style: TextStyle(fontSize: 25),
              controller: _controllerBase,
            ),
           TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Altura" ),
              style: TextStyle(fontSize: 25),
              controller: _controllerAltura, 
        ),
        Padding(
          padding: EdgeInsets.only(top:10),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(10),
            backgroundColor: Colors.black,
            textStyle: TextStyle(
              fontSize: 25
            )
            ),
            onPressed: _calcular,
            child: Text(
              "Calcular",
              style: TextStyle(color: Colors.red),
            ),
          )
        ),
        Center(
          child: Padding(
          padding: EdgeInsets.all(20),
          child: Text(
            _textoResultado,
            style: TextStyle(fontSize: 25, color: Colors.amber),
          ),  
          ),
        )
      ]
        ),
      ),
     )
    ) ;
  }