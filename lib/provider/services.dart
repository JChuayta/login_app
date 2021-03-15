import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/user_model.dart';

Future<dynamic> getJson(Uri url) async {
  http.Response response = await http.get(url);
  print(json.decode(response.body).toString());
  return json.decode(response.body);
}

final String API_URL = 'limservip.herokuapp.com';

Future<List<User>> autenticando(String user, String pass) async {
  var uri =
      new Uri.http(API_URL, 'api/loguear', {'usuario': user, 'password': pass});
  print(uri.toString());
  return await getJson(uri).then(((data) =>
      data['data'].map<User>((item) => User.fromJson(item)).toList()));
}
