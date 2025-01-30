class LoginResponseModel {
  final String token;
  final Map<String, dynamic> user;

  LoginResponseModel({required this.token, required this.user});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      token: json['access_token'],
      user: json['user'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'access_token': token,
      'user': user,
    };
  }
}
