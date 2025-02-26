import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:o_comeco_de_um_sonho/data/dao/fotos_dao.dart';
import 'package:o_comeco_de_um_sonho/data/models/ContentGemini.dart';

import '../data/models/Foto.dart';


class RestService {
  static String baseUrl = 'http://192.168.15.152:8084/o_comeco_de_um_sonho_api/';

  static String? geminiKey = dotenv.env['GEMINI_API_KEY'];
  static String geminiUrl = 'https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent?key=';

  static FotosDao fotosDao = FotosDao.instance;

  Future<bool> salvarFoto(Foto foto) async {
    try {
      String jsonBody = json.encode(foto.toJson());
      final response = await http.post(
        Uri.parse('${baseUrl}Mobile/insertFoto'),
        headers: {'Content-Type': 'application/json'},
        body: jsonBody,
      );

      if (response.statusCode == 200) {
        String resultado = response.body;
        return resultado == 'true';
      }
    } catch (e) {
      print('Erro ao salvar foto: $e');
      return false;
    }
    return false;
  }

  static Future<ContentGemini?> perguntarGemini(String pergunta) async {
    try {
      ContentGemini content =  ContentGemini.withText(pergunta);
      String jsonBody = json.encode(content.toJson());

      final response = await http.post(
        Uri.parse('${geminiUrl}${geminiKey}'),
        headers: {'Content-Type': 'application/json'},
        body: jsonBody,
      );

      if (response.statusCode == 200) {
        String resultado = response.body;
        final Map<String, dynamic> decoded = jsonDecode(response.body);

        return ContentGemini.fromApi(decoded);
      }
    } catch (e) {
      print('Erro ao chamar Api: $e');
      return null;
    }
    return null;
  }

}
