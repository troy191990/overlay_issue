import 'package:dio/dio.dart';
import 'package:example/model/login/auth_full_response.dart';
import 'package:example/model/login/login.dart';
import 'package:example/repository/baseRepository.dart';

class LoginApiProvider {
  Future<AuthorizationFull> login(String email, String password) async {
    try {
      var login = Login.initial();
      login.email = email;
      login.password = password;

      return AuthorizationFull.init();
    } on DioError catch (e) {
      print("Exception occured - login: $e");
      if (e.response != null && e.response.statusCode == 400) {
        return AuthorizationFull.withApiCreatedError(e.response.data);
      } else if (e.response != null && e.response.statusCode == 500) {
        return AuthorizationFull.withApiCreatedError(e.response.data);
      } else {
        var errorText = BaseApiProvider.handleError(e);
        return AuthorizationFull.withError(errorText);
      }
    } catch (error) {
      return AuthorizationFull.withError("Unknown error occured");
    }
  }
}
