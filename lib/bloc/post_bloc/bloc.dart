import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vgym/model/responses/generic_response.dart';
import 'package:provider/provider.dart';
import '../../model/responses/login_response.dart';
import '../../model/responses/sign_up_response.dart';
import '../../services/api_service.dart';
import '../../services/cache_helper.dart';
import '../../utility/user_store.dart';
import 'event.dart';
import 'state.dart';


class AppBloc extends Bloc<AppEvent,AppState>{
 final ApiService apiService;

  AppBloc( {required this.apiService}) : super(InitialState());

AppState get initialState => InitialState();

@override
Stream<AppState> mapEventToState(AppEvent event) async* {
  CacheHelper cacheHelper = CacheHelper();
  if (event is SignUpEvent) {
    yield LoadingState();
    try{
      var responseString = await apiService.signUpUser(event.password,event.email,event.firstname,event.lastname);
      var data = json.decode(responseString);
      var errorListener = GenericResponse.fromJson(data);
      if(errorListener.error!){
        yield LoadFailureState(error: responseString);
      }
      else{
        SignUpResponse response = SignUpResponse.fromJson(data);
        yield SignUpPostedState(userId: response.data!.user!.id.toString(),
            signUpResponse: response);
      }
    }catch(e){
      yield LoadFailureState(error: e.toString());
    }
  }

  if (event is SignInEvent) {
    yield LoadingState();
    try{
      SignInResponse response = await apiService.signInUser(event.email,event.password);
     if(response.error==false) {
       cacheHelper.loginUser(response);
       yield SignInPostedState(signInResponse: response);
     }else{
       yield LoadFailureState(error: response.message);
     }
    }catch(e){
      yield LoadFailureState(error: e.toString());
    }
  }

  if (event is PostItemEvent) {
    yield LoadingState();
    try{
     var user= Provider.of<UserStore>(event.context!,listen: false).currUser;
      GenericResponse response = await apiService.postItem(event.name,event.description,event.category_id,user!.id);
      if(response.error==false) {
        yield SignInPostedState();
      }else{
        yield LoadFailureState(error: response.message);
      }
    }catch(e){
      yield LoadFailureState(error: e.toString());
    }
  }




}

}