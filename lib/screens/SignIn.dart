import 'package:MyFlutterBloc/auth/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignIn extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
             Text(
              'I am signed out',
            ), 
            RaisedButton(
              child: const Text('Sign In'),
              onPressed: () {
                context
                    .bloc<AuthBloc>()
                    .add(AuthEvent_SignIn(user: 'PlayerOne'));
              },
            ),
          ],
        ),
      ),
    );
  }
}
