import 'package:example/model/login/auth_response.dart';

class AuthorizationFull {
  int statusCode;
  AuthorizationResponse authorization;
  String error;

  AuthorizationFull(
    this.statusCode,
    this.authorization,
    this.error,
  );

  AuthorizationFull.fromJson(Map<String, dynamic> json)
      : statusCode = json["StatusCode"],
        authorization = AuthorizationResponse.fromJson(json["Result"][0]),
        error = json["Error"];

  AuthorizationFull.init()
      : statusCode = 200,
        authorization = AuthorizationResponse.init(),
        error = "";

  AuthorizationFull.withApiCreatedError(Map<String, dynamic> json)
      : statusCode = json["StatusCode"],
        authorization = AuthorizationResponse.withErrorMap(json["Error"][0]),
        error = AuthorizationResponse.withErrorMap(json["Error"][0]).error;

  AuthorizationFull.withError(String error)
      : statusCode = 500,
        authorization = AuthorizationResponse.withError(error),
        error = error;
}
