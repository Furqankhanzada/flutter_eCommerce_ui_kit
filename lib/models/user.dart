class User {
  String username;
  String email;
  String password;
  User({this.username, this.email, this.password});
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      username: json['username'],
      email: json['email'],
      password: json['password']
    );
  }
}

class UserCredential {
  String usernameOrEmail;
  String password;
  UserCredential({this.usernameOrEmail, this.password});
}
