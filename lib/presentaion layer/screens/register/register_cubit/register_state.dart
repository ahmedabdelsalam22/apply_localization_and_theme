abstract class RegisterStates {}

class RegisterInitialStates extends RegisterStates {}

class RegisterPasswordSecureState extends RegisterStates {}

class RegisterLoadingState extends RegisterStates {}

class RegisterSuccessState extends RegisterStates {}

class RegisterErrorState extends RegisterStates {
  final String error;

  RegisterErrorState(this.error);
}
