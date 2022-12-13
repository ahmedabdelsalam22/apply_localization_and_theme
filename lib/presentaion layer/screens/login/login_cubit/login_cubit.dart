import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../notification_services/notification_service.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  bool obscureText = true;

  void passWordSecure() {
    obscureText = !obscureText;
    emit(LoginPasswordSecureState());
  }

  setNotification() {
    NotifyHelper notifyHelper = NotifyHelper();
    notifyHelper.initializeNotification();
    notifyHelper.displayNotification(
      title: "You can login now",
      body: 'or create drawer_account if you\'ve not',
    );

    emit(LoginNotificationState());
  }
}
