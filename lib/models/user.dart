class User {
  String name;
  String username;
  User({this.name, this.username});
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      username: json['username'],
    );
  }
}
