import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:provider/provider.dart';

import '../../bloc/post_bloc/bloc.dart';
import '../../home_screen.dart';
import '../../services/api_service.dart';
import '../../services/cache_helper.dart';
import '../../size_config.dart';
import '../../utility/user_store.dart';
import '../splash/components/body.dart';
import '../sign_in/sign_in_screen.dart';

class SplashScreen extends StatefulWidget {
  static String routeName = "/splash";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  CacheHelper _cacheHelper = CacheHelper();
  bool? isUserLoggedIn = false;

  @override
  void initState() {

    _cacheHelper.isLoggedIn().then((value) => {
      setState(() {
        isUserLoggedIn = value;
      }),

      if(isUserLoggedIn!){
        Provider.of<UserStore>(context,listen:false).fetchCurrentUser(),
        startTime()
  }
      else{
        startTime(),
      }
    });
    super.initState();
  }

  startTime() async {
    var duration = new Duration(seconds: 3);
    return new Timer(duration, route);
  }

  route() {
    if (!isUserLoggedIn!) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => BlocProvider<AppBloc>(
          create: (context) => AppBloc(apiService: ApiService()),
          child: SignInScreen()),
      ),
    );
    } else {

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => BlocProvider<AppBloc>(
            create: (context) => AppBloc(apiService: ApiService()),
            child: HomeScreen()),
        ));

    }
  }

  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}
