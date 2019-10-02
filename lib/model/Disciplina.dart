class Disciplina
{
  static int _id;
  static String _nom_disc;
  static double _creditos;
  static String _tipo_disc;
  static double _horas_obrig;
  static int _limite_faltas;
  static int _id_curso;

  void setId(int id){}
  void setNomDisc(String nom_disc){}
  void setCreditos(double creditos){}
  void setTipoDisc(String tipo_disc){}
  void setHorasObrig(double horas_obrig){}
  void setLimiteFaltas(int limite_faltas){}
  void setIdCurso(int id_curso){}

  int getId(){}
  String getNomDisc(){}
  double getCreditos(){}
  String getTipoDisc(){}
  double getHorasObrig(){}
  int getLimiteFaltas(){}
  int getIdCurso(){}

  bool cadastrarDisciplina(){}
  bool editarDisciplina(int id_disciplina){}
  bool removerDisciplina(int id_disciplina){}

  Disciplina getDisciplina(int id_disciplina){}
}