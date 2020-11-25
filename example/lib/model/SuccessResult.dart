class SuccessResult {
  bool result;
  SuccessResult({this.result});

  SuccessResult.initial() : result = false;

  SuccessResult.fromJsonError(Map<String, dynamic> json) {
    result = json['Result'];
  }
}
