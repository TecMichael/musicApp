import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'package:provider/provider.dart';
import 'package:vgym/utility/constants.dart' as Constants;
import '../model/responses/generic_response.dart';
import '../model/responses/home_response.dart';
import '../model/responses/item_by_category_response.dart';
import '../model/responses/login_response.dart';
import '../model/responses/user_item_relationship_response.dart';
import '../model/responses/user_request_response.dart';
import 'api_client.dart';
import 'cache_helper.dart';

class ApiService {
  ApiClient _apiClient = ApiClient();
  CacheHelper cacheHelper = CacheHelper();


  Future<ItemByCategoryResponse> fetchItemByCategory(id) async {
    var header = <String, String>{
      "AppId":"61eb0f547b6ce40034254030",
      "Authorization":'test_sk_H0e541nQ9SWMfmnJNUL1F9lG0',
      "Content-type": "application/json",
      "Accept": "application/json"
    };

    var data;
    final response = await _apiClient.getWithHeaders(Constants.GET_ITEM_BY_CATEGORY+id,header);
    data = json.decode(response);
    print("item by category response " + response.toString());

    return  ItemByCategoryResponse.fromJson(data);

  }

  Future<HomeResponse> fetchHomeData() async {
    var header = <String, String>{
      "AppId":"61eb0f547b6ce40034254030",
      "Authorization":'test_sk_H0e541nQ9SWMfmnJNUL1F9lG0',
      "Content-type": "application/json",
      "Accept": "application/json"
    };

    var data;
    final response = await _apiClient.getWithHeaders(Constants.GET_HOME_DATA,header);
    data = json.decode(response);
    print("item by category response " + response.toString());

    return  HomeResponse.fromJson(data);

  }

  Future<UserRequestsResponse> fetchUserRequests(user_id) async {
    var header = <String, String>{
      "AppId":"61eb0f547b6ce40034254030",
      "Authorization":'test_sk_H0e541nQ9SWMfmnJNUL1F9lG0',
      "Content-type": "application/json",
      "Accept": "application/json"
    };

    var data;
    final response = await _apiClient.getWithHeaders(Constants.GET_USER_REQUESTS+user_id
        ,header);
    data = json.decode(response);
    print("item by category response " + response.toString());

    return  UserRequestsResponse.fromJson(data);

  }

  Future<CheckUserItemRelationshipResponse> fetchUserItemRelationship(user_id,item_id) async {
    var header = <String, String>{
      "AppId":"61eb0f547b6ce40034254030",
      "Authorization":'test_sk_H0e541nQ9SWMfmnJNUL1F9lG0',
      "Content-type": "application/json",
      "Accept": "application/json"
    };

    var data;
    final response = await _apiClient.getWithHeaders(Constants.GET_USER_ITEM_RELATIONSHIP+user_id+'/'+item_id
        ,header);
    data = json.decode(response);
    print("item user relationship response " + response.toString());

    return  CheckUserItemRelationshipResponse.fromJson(data);

  }


  Future<SignInResponse> signInUser(email,password) async {
    var body = <String, dynamic>{
      'username': email,
      'password':password
    };
    var data;
    final response = await _apiClient.postForm(Constants.SIGN_IN,body);
    data = json.decode(response);
    print("login response " + response.toString());
    return  SignInResponse.fromJson(data);
  }

  Future<GenericResponse> postItem(name,description,catId,user_id) async {
    var body = <String, dynamic>{
      'name': name,
      'description':description,
      'category_id':catId,
      'image_url':'',
      'user_id':user_id
    };
    var data;
    final response = await _apiClient.postForm(Constants.CREATE_ITEM,body);
    data = json.decode(response);
    print("login response " + response.toString());
    return  GenericResponse.fromJson(data);
  }


  Future<GenericResponse> requestForItem(item_id,user_id,status) async {
    var body = <String, dynamic>{
      'item_id': item_id,
      'user_id':user_id,
      'status':status,
    };
    var data;
    final response = await _apiClient.postForm(Constants.REQUEST_ITEM,body);
    data = json.decode(response);
    print("item request response " + response.toString());
    return  GenericResponse.fromJson(data);
  }

  Future<String> signUpUser(password,email,firstname,lastname) async {
    var body = <String, dynamic>{
      'password':password,
      'email':email,
      'firstname':firstname,
      'lastname':lastname,
    };
    // var data;
    final response = await _apiClient.postForm(Constants.SIGN_UP,body);
    // data = json.decode(response);
    print("register response " + response.toString());
    return  response;
  }

  Future<String> downloadFile(String url, String fileName, String dir) async {
    HttpClient httpClient = new HttpClient();
    File file;
    String filePath = '';
    String myUrl = '';

    try {
      var request = await httpClient.getUrl(Uri.parse(url));
      var response = await request.close();
      if(response.statusCode == 200) {
        var bytes = await consolidateHttpClientResponseBytes(response);
        filePath = '$dir/$fileName';
        file = File(filePath);
        await file.writeAsBytes(bytes);
      }
      else
        filePath = 'Error code: '+response.statusCode.toString();
    }
    catch(ex){
      filePath = 'Can not fetch url';
    }

    return filePath;
  }
}

