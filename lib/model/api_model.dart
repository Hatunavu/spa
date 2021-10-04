class LoginRequestModel {
  String username;
  String password;
  String grantType;
  String userType;

  LoginRequestModel(
      {required this.username,
      required this.password,
      required this.grantType,
      required this.userType});

  Map<String, dynamic> toJson() {
    // debugger();
    Map<String, dynamic> map = {
      'username': username.trim(),
      'password': password.trim(),
      'grant_type': grantType.trim(),
      'user_type': userType.trim()
    };

    return map;
  }
}
