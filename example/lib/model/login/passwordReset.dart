class PasswordReset {
  String password;
  String passwordConfirm;
  String email;
  PasswordReset({this.passwordConfirm, this.password, this.email});

  PasswordReset.initial()
      : passwordConfirm = '',
        password = '',
        email = '';

  Map<String, dynamic> toJsonPrivate() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ConfirmPassword'] = this.passwordConfirm;
    data['Password'] = this.password;
    return data;
  }

  Map<String, dynamic> toJsonPublic() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Email'] = this.email;
    return data;
  }
}
