import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class AppEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class SignInEvent extends AppEvent {
  final  String? email,password;
   final BuildContext? context;
  SignInEvent({required this.email,this.password,this.context});
  @override
  List<Object> get props => [];
}

class PostItemEvent extends AppEvent {
  final  String? name,description,category_id;
  final BuildContext? context;
  PostItemEvent({ this.name,this.description,this.context,this.category_id});
  @override
  List<Object> get props => [];
}

class SignUpEvent extends AppEvent{
  final  String? password,email,firstname,lastname;
  SignUpEvent({this.password,this.firstname,this.lastname,this.email});
  @override
  List<Object> get props => [];
}

