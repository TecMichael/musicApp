library constants;

import 'dart:convert';

const String BASE_URL = "https://innovativehill.com/frindid/web/api/";

// http client constants
var headers = <String, String>{
  "Accept": "application/x-www-form-urlencoded",
  'Content-Type': 'application/x-www-form-urlencoded',
  'app_key': 'vvv'
};



var sessionDetails = jsonEncode(<String, String>{
  'session_id': "101",
  'session_token': "Sportixe_c962f2fbe7e7c1c5e5a51438db9b06c9"
});

// secure storage keys
const String CHECK_LOGIN_STATUS = "loginstatus";
const String SESSION_ID = "session_id";
const String SESSION_TOKEN = "session_token";
const String LOGGED_IN_USER = "user";

const String IMAGE_BASE_URL="https://test-gobspay.herokuapp.com/api/";


// API fetch paths
const String SIGN_UP = BASE_URL + "user/register";
const String SIGN_IN = BASE_URL + "user/login";
const String CREATE_ITEM = BASE_URL + "item/create";
const String REQUEST_ITEM = BASE_URL + "item/create_request";

const String GET_USER_REQUESTS = BASE_URL + "user/requests/";
const String GET_USER_ITEM_RELATIONSHIP = BASE_URL + "item/relationship/";

const String GET_ITEM_BY_CATEGORY = BASE_URL +  "items/";
const String GET_HOME_DATA = BASE_URL +  "home";




