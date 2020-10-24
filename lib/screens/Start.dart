import 'package:MyFlutterBloc/auth/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Splash.dart';

class Start extends StatelessWidget {
  
  Start({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return BlocListener<AuthBloc, AuthState>(
        listener: ( context, state) {
          if (state is AuthState_Unauthenticated) {
            print('Route to Sign In');
            //Navigator.of(context).pushNamedAndRemoveUntil('/signIn', (route) => false);
            Navigator.of(context).pushNamed('/signIn');
          } else if (state is AuthState_Authenticated) {
            
            print('Route to Home');
            //Navigator.of(context).pushNamedAndRemoveUntil('/home', (route) => false);
            Navigator.of(context).pushNamed('/home');
          } 
        },
        child:Splash()
      );
  }
}
