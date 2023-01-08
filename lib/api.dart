import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
class CallApi{

    PostApi(body) async{
      var url = 'https://api.json-generator.com/templates/Y0-BtdWFvhsx/data';
      final res = await http.post(Uri.parse(url));
      if (res.statusCode== 200){
        var model_ = json.decode(res.body);

      }
    }


}