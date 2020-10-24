
import 'package:MyFlutterBloc/item/bloc/items_bloc.dart';
import 'package:MyFlutterBloc/screens/Home.dart';
import 'package:MyFlutterBloc/screens/SignIn.dart';
import 'package:MyFlutterBloc/screens/Start.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        return BlocProvider.value(
          value: getItemsBloc(),
          child: Home());      
    })); 
  }

  static ItemsBloc _itemsBloc;
  static ItemsBloc getItemsBloc(){
    if(_itemsBloc == null) {
      _itemsBloc = new ItemsBloc();      
    }
    return _itemsBloc;
  }

  
}