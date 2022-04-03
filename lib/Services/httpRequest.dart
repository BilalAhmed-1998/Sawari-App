
import 'dart:convert';

import 'package:http/http.dart';

class httpRequest {

  static Future<dynamic> getRequest(String url) async{

    Response response = await get(Uri.parse(url));

    print("RESPONSE");
    print(response.statusCode);

    try {
      if(response.statusCode == 200){
        return jsonDecode(response.body);
      }
      else{

        return "failed";
      }

    } on Exception catch (e) {

      return "failed";


    }


  }


}