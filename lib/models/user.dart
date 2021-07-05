class User {
  String username;
  String email;
  String password;
  User({required this.username, required this.email, required this.password});
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
  UserCredential({required this.usernameOrEmail, required this.password});
}
