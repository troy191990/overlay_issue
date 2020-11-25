import 'package:example/model/login/authorization.dart';

class AuthorizationResponse {
  final Authorization auth;
  final String error;

  AuthorizationResponse(this.auth, this.error);

  AuthorizationResponse.init()
      : auth = Authorization.initial(),
        error = "";

  AuthorizationResponse.fromJson(Map json)
      : auth = new Authorization.fromJson(json),
        error = new Authorization.fromJson(json).token;

  AuthorizationResponse.withError(String errorValue)
      : auth = Authorization(),
        error = errorValue;

  AuthorizationResponse.withErrorMap(Map errorValue)
      : auth = Authorization(),
        error = new Authorization.fromJsonError(errorValue).token;
}
