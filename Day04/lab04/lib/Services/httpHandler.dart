import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lab04/Utilities/constants.dart';

class HttpServices{

  Future<dynamic> httpGet(String endPoint, {Map<String, String> headers}) async {
    Uri uri = Uri.parse('${Constants.baseUrl}$endPoint');
    Map<String, String> requestHeaders = {};
    if (headers != null) {
      requestHeaders = headers;
    } else {
      requestHeaders = {'Content-Type': 'application/json'};
    }
    http.Response response = await http.get(uri, headers: requestHeaders);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return jsonDecode(response.body);
    } else if (response.statusCode >= 500) {
      throw Exception("Something wrong happened!");
    }
  }
  Future<dynamic>  httpPost(String endPoint, String name, String job, {Map<String, String> headers}) async {

    Uri uri = Uri.parse('${Constants.baseUrl}$endPoint');
    Map<String, String> requestHeaders = {};
    if (headers != null) {
      requestHeaders = headers;
    } else {
      requestHeaders = {'Content-Type': 'application/json'};
    }
    http.Response response = await http.post(uri,headers: requestHeaders,
        body:jsonEncode(<String, String>{
          'name': name,
          'job':job,
        }),);
    if(response.statusCode == 201){
      return  jsonDecode(response.body);
    }else{
      throw Exception("Something wrong happened!");
    }
  }
}