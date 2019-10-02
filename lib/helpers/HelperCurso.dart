import 'package:flutter_app/helpers/HelperBase.dart';
import 'package:flutter_app/helpers/HelperProfessor.dart';
import 'package:flutter_app/model/Curso.dart';
import 'package:sqflite/sqflite.dart';


class HelperCurso extends HelperBase<Curso> {

  static final  String cursoTable = "tb_curso";
  static final String idColumn = "id";
  static final String nomeColumn = "nome";
  static final String totalCreditoColumn = "total_credito";
  static final String idCoordenadorColumn = "id_coordenador";
  static final HelperCurso _instance = HelperCurso.getInstance();


  factory HelperCurso() => _instance;
  HelperCurso.getInstance();

  @override
  Future<Database> createTable() async {
    return db.then((db){
      db.execute("CREATE TABLE IF NOT EXISTS $cursoTable($idColumn INTEGER PRIMARY KEY, $nomeColumn TEXT, $totalCreditoColumn DOUBLE,"
             "$idCoordenadorColumn INTEGER,"
             "FOREIGN KEY($idCoordenadorColumn) REFERENCES ${HelperProfessor.professorTable}.(${HelperProfessor.idColumn}))");

      return db;
    });

  }

  @override
  Future<int> delete(int id) async {
    return db.then((database) async {
     return await database.delete(cursoTable, where: "$idColumn = ?", whereArgs: [id]);
    });

  }

  @override
  Future<List> getAll() async => db.then((database) async {
      List listMap = await database.rawQuery("SELECT * FROM $cursoTable");
      List<Curso> lista = List();
      for(Map m in listMap){
        lista.add(Curso.fromMap(m));
      }
      return lista;
   });

  @override
  Future<Curso> getFirst(int id) async => db.then((database) async{
    List<Map> maps = await database.query(cursoTable,
      columns: [idColumn, nomeColumn, totalCreditoColumn, idCoordenadorColumn],
      where: "$idColumn = ?",
      whereArgs: [id]);

    if(maps.length > 0){
      return Curso.fromMap(maps.first);
    } else {
      return null;
    }
      });

  @override
  Future<int> getNumber() async {
   return Sqflite.firstIntValue(
     await db.then((database){
        return database.rawQuery("SELECT COUNT(*) FROM $cursoTable");
     }));
  }

  @override
  Future<Curso> save(Curso curso) async {
     db.then((database) async{
     await database.insert(cursoTable, curso.toMap());
    });
    return null;
  }

  @override
  Future<int> update(Curso data) async => await db.then((database){
    return database.update(cursoTable,
        data.toMap(),
        where: "$idColumn = ?",
        whereArgs: [data.id]);
    });

  //Future<Database> get db async {
     //if(_db != null){
       //return _db;
     //} else {
       //_db = await createTable();
       //return _db;
     //}
  //}
}