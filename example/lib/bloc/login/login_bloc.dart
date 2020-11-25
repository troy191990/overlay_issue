import 'package:example/model/login/auth_full_response.dart';
import 'package:example/repository/login/login_repository.dart';

class LoginBloc {
  final LoginRepository _repository = LoginRepository();

  init() {
    AuthorizationFull response = _repository.init();
    return response;
  }

  login(String email, String password) async {
    AuthorizationFull response = await _repository.login(email, password);

    return response;
  }


}

final loginBloc = LoginBloc();
