import 'package:flutter_app/helpers/HelperProfessor.dart';

class Professor {
  
  int _id;
  String _nome;
  int _matricula;
  String _img;

  int get id => _id;
  String get nome => _nome;
  int get matricula => _matricula;
  String get img => _img;

  set id(int id) => this._id = id;
  set nome(String nome) => this._nome = nome;
  set matricula(int matricula) => this._matricula = matricula;
  set img(String img) => this._img = img;

  Professor();

  Professor.fromMap(Map map){
    _id = map[HelperProfessor.idColumn];
    _nome = map[HelperProfessor.nomeColumn];
    _matricula = map[HelperProfessor.matriculaColumn];
   }

  Map toMap() {
    Map<String, dynamic> map = {
      HelperProfessor.nomeColumn: nome,
      HelperProfessor.matriculaColumn: matricula
    };

    if(id != null){
      map[HelperProfessor.idColumn] = id;
    }
    return map;
  }
}