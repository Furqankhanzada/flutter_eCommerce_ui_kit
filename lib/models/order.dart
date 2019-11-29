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

  Order({this.firstname, this.lastname, this.email, this.username, this.country, this.state, this.city, this.phone, this.address, this.postalCode});
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
