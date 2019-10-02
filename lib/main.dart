import 'package:flutter/material.dart';
import 'package:flutter_app/view/ViewCurso.dart';
import 'package:flutter_app/view/ViewAluno.dart';
import 'package:flutter_app/view/ViewDisciplina.dart';

void main() {
  runApp(new MyApp());
}
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Generated App',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: const Color(0xFF2196f3),
        accentColor: const Color(0xFF2196f3),
        canvasColor: const Color(0xFFfafafa),
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Magister Mobile'),
      ),
      body: PageView(children: [
      SingleChildScrollView(
    padding: EdgeInsets.all(10.0),
    child: Form(
        key: _formKey,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 20.0),
                child: RaisedButton(
                  color: Colors.blue,
                  onPressed: cursoPressed,
                  child: Text(
                    'Curso',
                    style: TextStyle(
                        color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
              Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 20.0),
                child: RaisedButton(
                  color: Colors.blue,
                  onPressed: disciplinaPressed,
                  child: Text(
                    'Displina',
                    style: TextStyle(
                        color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
              Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 20.0),
                child: RaisedButton(
                  color: Colors.blue,
                  onPressed: alunoPressed,
                  child: Text(
                    'Aluno',
                    style: TextStyle(
                        color: Colors.white, fontSize: 20),
                  ),
                ),
              )
            ]
        )
    )
    )
    ]),

    );
  }
  void cursoPressed() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ViewCurso()),
    );
  }
  void alunoPressed(){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ViewAluno()),
    );
  }
  void disciplinaPressed(){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ViewDisciplina()),
    );
  }

}
