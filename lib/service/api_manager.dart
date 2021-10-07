import 'dart:convert';
import 'package:jobswire/model/model.dart';
import 'package:http/http.dart' as http;

class ApiManager {
  static ApiManager? _instance;

  ApiManager._();

  static ApiManager? get instance {
    if (_instance == null) {
      _instance = ApiManager._();
    }
    return _instance;
  }

  Future<List<Model>> getAllModel() async {
    final getUser = await http.get(Uri.parse('https://remoteok.io/api'));
    final List responseBody = jsonDecode(getUser.body);
    return responseBody.map((e) => Model.fromJson(e)).toList();
  }
}
