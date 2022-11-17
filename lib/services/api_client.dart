import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import '../model/responses/generic_response.dart';
import '../model/responses/login_response.dart';
import 'app_exceptions.dart';
import 'cache_helper.dart';

class ApiClient {
  final httpClient = http.Client();
  CacheHelper cacheHelper =CacheHelper();

  Future<Map<String,String>> getHeaders() async{
    SignInResponse res= await cacheHelper.getCurrentUser();
    // String token = res.data!.accessToken!;
    var headers = <String, String>{
      "Accept": "text/plain",
      'Content-Type': "application/json-patch+json",
      // 'Authorization': "Bearer $token"
    };

    return headers;
  }

  Future<dynamic> get(String url) async {
    var headers = await getHeaders();
    print('Api Get, url $url');
    var responseJson;
    try {
      final response = await http.get(Uri.parse(url),headers: headers);
      responseJson = _returnResponse(response);
    } on SocketException {
      print('No net');
      throw FetchDataException('No Internet connection');
    }
    print('api get recieved!');
    return responseJson;
  }

  Future<dynamic> getWithHeaders(String url, Map<String, String> header) async {
    print('Api Get, url $url');
    var responseJson;
    try {
      final response = await http.get(Uri.parse(url),headers: header);
      responseJson = _returnResponse(response);
    } on SocketException {
      print('No net');
      throw FetchDataException('No Internet connection');
    }
    print('api get recieved!');
    return responseJson;
  }
  
  Future<dynamic> postForm(String url, Map body) async {
    print('Api Post, url :' + url);
    print('parameters:' + body.toString());
    var headers = <String, String>{
      "Content-type": "application/json",
      "Accept": "application/json",
    };

    var responseJson;
    try {
      final response =
          await http.post(Uri.parse(url), body: json.encode(body),headers: headers);
      responseJson = _returnResponse(response);
    } on SocketException {
      print('No net');
      throw FetchDataException('No Internet connection');
    }
    print('api post.');
    print("responsejson" + responseJson.toString());

    return responseJson;
  }

  Future<dynamic> postFormWithHeader(String url, Map body) async {
    print('Api Post, url :' + url);
    print('parameters:' + body.toString());

    var headers = await getHeaders();

    var responseJson;
    try {
      final response = await http.post(Uri.parse(url), body: json.encode(body), headers: headers);
      responseJson = _returnResponse(response);
    } on SocketException {
      print('No net');
      throw FetchDataException('No Internet connection');
    }
    print('api post.');
    print("responsejson" + responseJson.toString());

    return responseJson;
  }

  Future<dynamic> postFormWithCustomHeader(String url, Map body,Map<String,String> customHeader) async {
    print('Api Post, url :' + url);
    print('parameters:' + body.toString());
    var responseJson;
    try {
      final response = await http.post(Uri.parse(url), body: json.encode(body), headers: customHeader);
      responseJson = _returnResponse(response);
    } on SocketException {
      print('No net');
      throw FetchDataException('No Internet connection');
    }
    print('api post.');
    print("responsejson" + responseJson.toString());

    return responseJson;
  }


  Future<dynamic> post(String url, String body) async {
    print('parameters:' + body.toString());

    var responseJson;
    try {
      final response = await http.post(Uri.parse(url), body: body);
      responseJson = _returnResponse(response);
    } on SocketException {
      print('No net');
      throw FetchDataException('No Internet connection');
    }
    print('api post.');
    print(responseJson.toString());

    return responseJson;
  }

  Future<dynamic> put(String url, dynamic body) async {
    print('Api Put, url $url');
    var responseJson;
    try {
      final response = await http.put(Uri.parse(url), body: body);
      responseJson = _returnResponse(response);
    } on SocketException {
      print('No net');
      throw FetchDataException('No Internet connection');
    }
    print('api put.');
    print(responseJson.toString());
    return responseJson;
  }

  Future<dynamic> delete(String url) async {
    print('Api delete, url $url');
    var apiResponse;
    try {
      final response = await http.delete(Uri.parse(url));
      apiResponse = _returnResponse(response);
    } on SocketException {
      print('No net');
      throw FetchDataException('No Internet connection');
    }
    print('api delete.');
    return apiResponse;
  }

  dynamic _returnResponse(http.Response response) {
    print("response :" + response.body.toString());

    var responseJson = response.body;

    print("response :" + responseJson.toString() +' status code:' +response.statusCode.toString());
    switch (response.statusCode) {
      case 200:
        return responseJson;
      case 201:
        return responseJson;
      case 302:
        return responseJson;
      case 400:
        // {
        //   final Map<String, dynamic> data = json.decode(response.body);
        //   // print (data['errors']);
        //   print ("values"+data.values.first.toString());
        //   var first = json.decode(data.values.first.toString());
        //   Map<String, dynamic> json2 = json.decode(first.toString());
        //   var phone = json2['Phone'].cast<String>();
        //
        //   print ("first"+phone[0]);
        //
        //
        //
        // }
        // return;

    // if(response.body.isNotEmpty){
        //   if(response.body.contains("\"errors\":")){
        //     GenericResponse genericResponse =
        //     GenericResponse.fromJson(jsonDecode(response.body));
        //     print(genericResponse.message);
        //
        //   }else{
        //     throw BadRequestException("oops an error occured");
        //   }
        // }else{
        //   throw BadRequestException("oops an error occured");
        //
        // }
        if(response.body.contains("\"message\":")){
          GenericResponse genericResponse =
          GenericResponse.fromJson(jsonDecode(response.body));
          print(genericResponse.message);
          throw BadRequestException(genericResponse.message);
        }else{
          throw BadRequestException(response.body);
        }
      case 401:
        if(response.body.contains("\"message\":")){
          GenericResponse genericResponse =
          GenericResponse.fromJson(jsonDecode(response.body));
          print(genericResponse.message);
          throw BadRequestException(genericResponse.message);
        }else{
          throw BadRequestException("oops an error occured");
        }

      case 403:
        GenericResponse genericResponse =
        GenericResponse.fromJson(jsonDecode(response.body));
        print(genericResponse.message);
        if(response.body.contains("\"message\":")){
          GenericResponse genericResponse =
          GenericResponse.fromJson(jsonDecode(response.body));
          print(genericResponse.message);
          throw BadRequestException(genericResponse.message);
        }else{
          throw UnauthorisedException('Error occured while Communicating with Server with StatusCode : ${response.statusCode}');
        }

      case 404:
        if(response.body.contains("\"message\":")){
          GenericResponse genericResponse =
          GenericResponse.fromJson(jsonDecode(response.body));
          print(genericResponse.message);
          throw BadRequestException(genericResponse.message);
        }else{
          throw BadRequestException("oops an error occured");
        }
      case 500:
        GenericResponse genericResponse =
        GenericResponse.fromJson(jsonDecode(response.body));
        print(genericResponse.message);
        throw BadRequestException(genericResponse.message);
      default:
        throw FetchDataException(
            'Error occured while Communicating with Server with StatusCode : ${response.statusCode}');
    }
  }
}
