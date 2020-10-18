part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

   @override
  List<Object> get props => [];
}

/*
Status when the user's authentication status is not initialized yet
*/
class AuthState_Initial extends AuthState {}

/*
Status when the user's authentication status could not be determined due to internet connection issue/ server issue / timeout etc
*/
class AuthState_Unknown extends AuthState {
  final String reason;

  const AuthState_Unknown({this.reason});
  @override
  List<Object> get props => [reason];

  @override
  String toString() => 'Authentication unknown reason: $reason'; 
}

/*
Status when the user is authenticated and is registered
*/
class AuthState_Authenticated extends AuthState {
  final String user;

  AuthState_Authenticated({@required this.user});
  @override
  List<Object> get props => [user];
}


/*
Status when the user is authenticated but is not registered
*/
class AuthState_Unregistered extends AuthState {
  final String user;

  const AuthState_Unregistered(this.user);

  @override
  List<Object> get props => [user];
  
}

/*
Status when the user is not authenticated
*/
class AuthState_Unauthenticated extends AuthState {
  final String reason;
  static const String SIGN_OUT = 'SIGN_OUT';

  const AuthState_Unauthenticated({this.reason});

  @override
  List<Object> get props => [reason];
  
}

