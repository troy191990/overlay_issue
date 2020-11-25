class Login {
  String email;
  String password;
  Login({this.email, this.password});

  Login.initial()
      : email = '',
        password = '';

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Email'] = this.email;
    data['Password'] = this.password;
    return data;
  }
}
