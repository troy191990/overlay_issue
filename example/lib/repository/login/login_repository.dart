import 'package:example/model/login/auth_full_response.dart';
import 'package:example/repository/login/login_api_provider.dart';

class LoginRepository {
  LoginApiProvider _apiProvider = LoginApiProvider();

  AuthorizationFull init() {
    return AuthorizationFull.init();
  }

  Future<AuthorizationFull> login(String email, String password) {
    return _apiProvider.login(email, password);
  }
}
