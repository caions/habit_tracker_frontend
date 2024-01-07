import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  Future<List<dynamic>> fetchData() async {
    final Uri url = Uri.parse('http://localhost:8000/habits');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      //  print('Dados da API: ${response.body}');
      // Retornar os dados como uma lista dinâmica (ou ajuste conforme necessário)
      return jsonDecode(response.body);
    } else {
      print('Erro na requisição: ${response.statusCode}');
      // Ou lança uma exceção em caso de erro, dependendo do seu tratamento de erro desejado.
      throw Exception('Erro na requisição: ${response.statusCode}');
    }
  }
}
