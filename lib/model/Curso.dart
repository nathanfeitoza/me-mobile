import 'package:flutter_app/helpers/HelperCurso.dart';
import 'Professor.dart';

class Curso {

  int _id;
  String _nome;
  double _totalCreditos;
  int _idCoordenador;
  Professor _coordenadaor;
  
  int get id => _id;
  get nome =>   this._nome;
  double get totalCredito => this._totalCreditos;
  int get idCoordenador => this._idCoordenador;
    
  set id(int id) => this._id = id;  
  set nome(String nome) => this._nome = nome;
  set totalCredito(double credito) => this._totalCreditos = credito;
  set coordenador(Professor professor){
    this._coordenadaor = professor;
    this._idCoordenador = this._coordenadaor.id;
  } 
  
  Curso();

  Curso.fromMap(Map map){
    _id = map[HelperCurso.idColumn];
    _nome = map[HelperCurso.nomeColumn];
    _totalCreditos = map[HelperCurso.totalCreditoColumn];
    _idCoordenador = map[HelperCurso.idCoordenadorColumn];
  }

  Map toMap() {
    Map<String, dynamic> map = {
      HelperCurso.nomeColumn: nome,
      HelperCurso.totalCreditoColumn: totalCredito,
      HelperCurso.idCoordenadorColumn: idCoordenador,
    };

    if(id != null){
      map[HelperCurso.idColumn] = id;
    }
    return map;
  }

  @override
  String toString() {
    return "Contact(id: $id, nome: $nome, créditos: $totalCredito, coordenador: $idCoordenador)";
  }
  
  
}
  
  