import 'homeOption.dart';
import 'package:example/model/ErrorResult.dart';

class HomeOptionResponse {
  final List<HomeOption> options;
  final String error;

  HomeOptionResponse(this.options, this.error);

  HomeOptionResponse.init()
      : options = List(),
        error = "";

  HomeOptionResponse.fromJson(Map json)
      : options = (json["HomeOptions"] as List)
            .map((i) => new HomeOption.fromJson(i))
            .toList(),
        error = "";

  HomeOptionResponse.withErrorMap(Map errorValue)
      : options = List(),
        error = new ErrorResult.fromJsonError(errorValue).result;

  HomeOptionResponse.withError(String errorValue)
      : options = List(),
        error = errorValue;
}
