import 'package:example/model/enums.dart';

class Authorization {
  String displayName;
  String token;
  UserTypeEnum userType;
  Authorization({this.userType, this.displayName, this.token});

  Authorization.initial()
      : userType = UserTypeEnum.Unkown,
        token = '',
        displayName = '';

  Authorization.fromJson(Map<String, dynamic> json) {
    userType = _getUserTypeFromString(json['UserType']);
    displayName = json['DisplayName'];
    token = json['Result'];
  }
Authorization.fromJsonError(Map<String, dynamic> json) {
    userType = _getUserTypeFromString(json['UserType']);
    displayName = json['DisplayName'];
    token = json['Result'];
  }
  _getUserTypeFromString(String value) {
    UserTypeEnum userTypeEnum = UserTypeEnum.values
        .firstWhere((e) => e.toString() == "UserTypeEnum.$value");

    return userTypeEnum;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['UserType'] = this.userType;
    data['DisplayName'] = this.displayName;
    data['Result'] = this.token;
    return data;
  }
}
