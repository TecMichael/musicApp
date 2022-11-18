import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:vgym/dashboard.dart';
import 'package:vgym/home_screen.dart';

import 'audio_module/screens/home_screen/cubit/record/record_cubit.dart';
import 'audio_module/screens/recordings_list/cubit/files/files_cubit.dart';
import 'routes.dart';
import 'screens/splash/splash_screen.dart';
import 'utility/user_store.dart';

void main() {
  runApp(  MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => UserStore()),
    ],
    child: const MyApp(),
  ),);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      builder: () {
        return MultiBlocProvider(
          providers: [
            BlocProvider<RecordCubit>(
              create: (context) => RecordCubit(),
            ),

            /// [FilesCubit] is provided before material app because it should start loading all files when app is opens
            /// asynschronous method [getFiles] is called in constructor of [Files Cubit].
            BlocProvider<FilesCubit>(
              create: (context) => FilesCubit(),
            ),
          ],
          child:

           MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Slimsic',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            fontFamily: "Gordita",
          ),
          home:  DashBoardScreen(),
          // home: SplashScreen(),
          // We use routeName so that we dont need to remember the name
          // initialRoute: HomeScreen.routeName,
          routes: routes,
        )


        );

      },
    );
  }
}
