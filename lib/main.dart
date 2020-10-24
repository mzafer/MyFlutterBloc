import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import 'Application.dart';
import 'Routes.dart';
import 'auth/bloc/auth_bloc.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build();
  runApp(
    MultiBlocProvider(
      providers: [
        
        BlocProvider<AuthBloc>(
          create: (context) =>
            AuthBloc()
              ..add(AuthEvent_AppStarted())
        ),
      ],
      child: MyApp())
  );

}

 

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  MyApp({Key key}) :
    super(key: key) {
    final router = FluroRouter();
    Routes.configureRoutes(router);
    Application.router = router;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      onGenerateRoute: Application.router.generator,
      initialRoute: "/",
    );
  }
}
