class CleoUser {
  String name;
  String phoneNumber;
  String email;
  String password;
  String address;
  String shopname;
  String logo;

  CleoUser(
      this.name, this.phoneNumber, this.email, this.password, this.address,this.shopname,this.logo);

  Map<String, dynamic> toJson() => {
        'name': name,
        'phoneNumber': phoneNumber,
        'email': email,
        'password': password,
        'address': address,
        'shopname': shopname,
        'logo': logo
      };
}
