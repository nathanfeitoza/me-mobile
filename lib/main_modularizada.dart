import 'package:flutter/material.dart';
import 'package:flutter_app/view/view_aluno.dart';

void main() => runApp(
      MaterialApp(title: "Título", home: MyApp()),
    );

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  TextEditingController codigoDisciplinaController = TextEditingController();
  TextEditingController nomeDisciplinaController = TextEditingController();
  TextEditingController creditosDiscController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
            appBar: AppBar(
              title: Text("Magister App"),
              centerTitle: true,
              backgroundColor: Colors.blue[900],
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.refresh),
                  onPressed: () {},
                )
              ],
              bottom: TabBar(tabs: [
                Tab(icon: Icon(Icons.announcement)),
                Tab(icon: Icon(Icons.cake)),
                Tab(icon: Icon(Icons.cloud))
              ]),
            ),
            body: TabBarView(children: [
              _gerarDisciplina(),
              Center(child: AlunnoView()),
              Center(child: Text("Professor 123"))
            ])));
  }

  TextFormField _criarTextFormField(String label, double fontSize,
      TextEditingController controller, Function valida) {
    TextFormField text = TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.blue, fontSize: fontSize)),
      textAlign: TextAlign.left,
      style: TextStyle(color: Colors.green, fontSize: fontSize),
      controller: controller,
      validator: valida,
    );
    return text;
  }

  SingleChildScrollView _gerarDisciplina() {
    SingleChildScrollView viewDisciplina = SingleChildScrollView(
        padding: EdgeInsets.all(10.0),
        child: Form(
            key: _formKey,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  _criarTextFormField("Código", 20.0,
                      codigoDisciplinaController, _validarCodigo),
                  _criarTextFormField("Disciplina", 20.0,
                      nomeDisciplinaController, _validarDisciplina),
                  _criarTextFormField("Créditos", 20.0, creditosDiscController,
                      _validarCredito),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: RaisedButton(
                      color: Colors.blue,
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          _formKey.currentState.save();
                        }
                      },
                      child: Text(
                        'Salvar',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  )
                ])));

    return viewDisciplina;
  }

  String _validarDisciplina(String value) {
    if (value.isEmpty) {
      return "Insira o nome da disciplina!";
    }
    return null;
  }

  String _validarCredito(String value) {
    if (value.isEmpty) {
      return "Insira a quantidade de créditos!";
    }
    return null;
  }

  String _validarCodigo(String value) {
    if (value.isEmpty) {
      return "Insira a quantidade de créditos!";
    } else if (int.parse(value) < 0) {
      return "Valor inválido!";
    }
    return null;
  }
}
