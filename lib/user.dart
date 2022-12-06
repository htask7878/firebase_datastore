class user {
  String? name;
  String? email;
  String? phone;
  String? password;
  String? country;

  user({this.name, this.email, this.phone, this.password, this.country});

  user.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    password = json['password'];
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['password'] = this.password;
    data['country'] = this.country;
    return data;
  }
}
