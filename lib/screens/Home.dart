import 'package:MyFlutterBloc/auth/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => Home());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'I am signed in',
            ),
            RaisedButton(
              child: const Text('Sign Out'),
              onPressed: () {
                context
                    .bloc<AuthBloc>()
                    .add(AuthEvent_SignOut());
              },
            ),
          ],
        ),
      ),
    );
  }
}
