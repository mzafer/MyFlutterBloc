
import 'package:MyFlutterBloc/screens/Home.dart';
import 'package:MyFlutterBloc/screens/SignIn.dart';
import 'package:MyFlutterBloc/screens/Start.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

class Routes {
  
  static void configureRoutes(FluroRouter router) {

    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print("ROUTE WAS NOT FOUND !!!");
      return Container( child: Text("NOT FOUND..!!"));
    });

    router.define("/", handler: Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return Start();
    })); 
    
    
    router.define("/signIn", handler: Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return SignIn();
    })); 

    router.define("/home", handler: Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return Home();
    })); 
  }
}