class Order {
  String firstname;
  String lastname;
  String email;
  String username;
  String country;
  String state;
  String city;
  String phone;
  String address;
  String postalCode;

  Order({required this.firstname, required this.lastname, required this.email, required this.username, required this.country, required this.state, required this.city, required this.phone, required this.address, required this.postalCode});
  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
        firstname: json['firstname'],
        lastname: json['lastname'],
        email: json['email'],
        username: json['username'],
        country: json['country'],
        state: json['state'],
        city: json['city'],
        phone: json['phone'],
        address: json['address'],
        postalCode: json['postalCode']
    );
  }
}
