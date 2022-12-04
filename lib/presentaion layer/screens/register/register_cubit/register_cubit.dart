import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinric_app/presentaion%20layer/screens/register/register_cubit/register_state.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialStates());

  static RegisterCubit get(context) => BlocProvider.of(context);

  bool obscureText = true;

  void passwordSecure() {
    obscureText = !obscureText;
    emit(RegisterPasswordSecureState());
  }
}
