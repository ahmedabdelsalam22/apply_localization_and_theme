abstract class LoginStates {}

class LoginInitialState extends LoginStates {}

class LoginPasswordSecureState extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginSuccessState extends LoginStates {}

class LoginErrorState extends LoginStates {
  final String error;

  LoginErrorState(this.error);
}

class LoginNotificationState extends LoginStates {}
