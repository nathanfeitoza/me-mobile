class Aluno
{
  static int _id;
  static String _nom_alu;
  static double _tot_cred;
  static String _data_nasc;
  static double _mgp;
  static int _id_curso;
  
  void setId(int id){}
  void setNomAluno(String nom_alu){}
  void setTotCred(double tot_cred){}
  void setDataNasc(int data_nasc){}
  void setMgp(int mgp){}
  void setIdCurso(int id_curso){}
  
  int getId(){}
  String getNomAluno(){}
  double getTotCred(){}
  int getDataNasc(){}
  int getMgp(){}
  int getIdCurso(){}

  bool cadastrarAluno(){}
  bool editarAluno(int id_aluno){}
  bool removerAluno(int id_aluno){}

  Aluno getAluno(int id_aluno){}
}