import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:user_application/User.dart';
class ApiService {
  Future<UserModel> fetchApi(id) async {
    var url = 'https://reqres.in/api/users/$id';

    var response = await http.get(Uri.parse(url));

    if(response.statusCode == 200){
      var dataResponse = jsonDecode(response.body)['data'];

      UserModel user = UserModel.fromJson(dataResponse);

      return user;
    } else {
      throw Exception('Failed Get API');
    }
  }
}