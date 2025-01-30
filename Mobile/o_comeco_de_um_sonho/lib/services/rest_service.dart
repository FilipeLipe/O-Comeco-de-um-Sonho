import 'dart:convert';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:o_comeco_de_um_sonho/data/dao/fotos_dao.dart';

import '../data/models/Foto.dart';


class RestService {
  static String baseUrl = 'http://192.168.15.152:8084/o_comeco_de_um_sonho_api/';

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

}
