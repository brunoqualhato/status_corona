const String  BASE_URL = "https://covid19-brazil-api.now.sh";

class EndPoints{

  static String listagemDeTodosPaises(){
    return "$BASE_URL/api/report/v1/countries";
  }
  static String listagemDeTodosEstadosBrasileiros(){
    return "$BASE_URL/api/report/v1";
  }
}