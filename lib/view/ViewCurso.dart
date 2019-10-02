import 'package:flutter/material.dart';
import 'package:flutter_app/model/Curso.dart';

class ViewCurso extends StatelessWidget {
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  TextEditingController codigoDisciplinaController = TextEditingController();
  TextEditingController nomeDisciplinaController = TextEditingController();
  TextEditingController creditosDiscController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              title: Text("Curso"),
              centerTitle: true,
              backgroundColor: Colors.blue[900],
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.refresh),
                  onPressed: () {},
                )
              ],
              bottom: TabBar(tabs: [
                Tab(icon: Icon(Icons.tv)),
                Tab(icon: Icon(Icons.add))
              ]),
            ),
            body: TabBarView(children: [
              SingleChildScrollView(
                  padding: EdgeInsets.all(10.0),
                  child: Form(
                      key: _formKey,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            TextFormField(
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    labelText: "Código",
                                    labelStyle: TextStyle(
                                        color: Colors.blue, fontSize: 20.0)),
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Colors.green, fontSize: 20.0),
                                controller: codigoDisciplinaController,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "Insira a quantidade de créditos!";
                                  } else if (int.parse(value) < 0) {
                                    return "Valor inválido!";
                                  }
                                  return null;
                                }),
                            TextFormField(
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                    labelText: "Nome",
                                    labelStyle: TextStyle(
                                        color: Colors.blue, fontSize: 20.0)),
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Colors.green, fontSize: 20.0),
                                controller: nomeDisciplinaController,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "Insira o nome do curso!";
                                  }
                                  return null;
                                }),
                            TextFormField(
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    labelText: "Créditos",
                                    labelStyle: TextStyle(
                                        color: Colors.blue, fontSize: 20.0)),
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Colors.green, fontSize: 20.0),
                                controller: creditosDiscController,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "Insira a quantidade de créditos!";
                                  }
                                  return null;
                                }),
                            Padding(
                              padding:
                              const EdgeInsets.symmetric(vertical: 20.0),
                              child: RaisedButton(
                                color: Colors.blue,
                                onPressed: () {
                                  if (_formKey.currentState.validate()){
                                    Curso curso = new Curso();

                                    //curso.id = codigoDisciplinaController;
                                    // salvar dados.
                                  }
                                },
                                child: Text(
                                  'Salvar',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                              ),
                            )
                          ]))),
              Center(child: Text("Adicionar")),
            ])));
  }
}
