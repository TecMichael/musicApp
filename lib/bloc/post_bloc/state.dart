
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../../model/responses/login_response.dart';
import '../../model/responses/sign_up_response.dart';


abstract class AppState extends Equatable {
  @override
  List<Object> get props => [];
}

class InitialState extends AppState {

  @override
  List<Object> get props => [];
}

class LoadingState extends AppState {
  @override
  List<Object> get props => [];
}

class LoadedState extends AppState {
 final  String? message,phone;

 LoadedState({ this.message,this.phone});

  @override
  List<Object> get props => [];
}

class LoadFailureState extends AppState {
  final String? error;

  LoadFailureState({@required this.error});

  @override
  List<Object> get props => [error.toString()];
}

class SignUpPostedState extends AppState {
  final  String? phone,userId;
  final SignUpResponse? signUpResponse;
  SignUpPostedState({ this.phone,this.userId,this.signUpResponse});

  @override
  List<Object> get props => [];
}

class SignInPostedState extends AppState {
  final SignInResponse? signInResponse;
  SignInPostedState({ this.signInResponse});

  @override
  List<Object> get props => [];
}

