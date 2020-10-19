class SigninResponse{
  final String token;
  final String fullName;
  final String email;
  final String employeeID;
  final String username;

  SigninResponse({this.token, this.fullName, this.email, this.employeeID,
    this.username});

  factory SigninResponse.fromJson(Map<String, dynamic> json){
    return SigninResponse(token: json['token'], fullName: json['fullName'],
        email: json['email'], employeeID: json['employeeID'], username: json['username']);
  }
}