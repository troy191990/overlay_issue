class ErrorResult {
  String result;
  ErrorResult({this.result});

  ErrorResult.initial() : result = '';

  ErrorResult.fromJsonError(Map<String, dynamic> json) {
    result = json['Result'];
  }
}
