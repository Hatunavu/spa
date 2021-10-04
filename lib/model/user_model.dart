class UserModel {
  String accessToken;
  String refreshToken;
  UserModel({required this.accessToken, required this.refreshToken});
  factory UserModel.fromJson(Map<String, dynamic> data) => UserModel(
      accessToken: data['access_token'], refreshToken: data['refresh_token']);

  Map<String, dynamic> toJson() =>
      {'access_token': accessToken, 'refresh_token': refreshToken};
}
