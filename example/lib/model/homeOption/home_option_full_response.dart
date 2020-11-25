import 'homeOption_response.dart';

class HomeOptionFull {
  int statusCode;
  HomeOptionResponse options;
  String error;

  HomeOptionFull(
    this.statusCode,
    this.options,
    this.error,
  );

  HomeOptionFull.init()
      : statusCode = 200,
        options = HomeOptionResponse.init(),
        error = "";

  HomeOptionFull.fromJson(Map<String, dynamic> json)
      : statusCode = json["StatusCode"],
        options = HomeOptionResponse.fromJson(json["Result"][0]),
        error = json["Error"];

  HomeOptionFull.withApiCreatedError(Map<String, dynamic> json)
      : statusCode = json["StatusCode"],
        options = HomeOptionResponse.withErrorMap(json["Error"][0]),
        error = HomeOptionResponse.withErrorMap(json["Error"][0]).error;

  HomeOptionFull.withError(String error)
      : statusCode = 500,
        options = HomeOptionResponse.withError(error),
        error = error;
}
