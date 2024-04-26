class RegisterRequest {
  String? name;
  String? email;
  String? password;
  String? rePassword;
  String? phone;

  RegisterRequest(
      {this.name, this.email, this.password, this.rePassword, this.phone});

  RegisterRequest.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    password = json['password'];
    rePassword = json['rePassword'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['password'] = this.password;
    data['rePassword'] = this.rePassword;
    data['phone'] = this.phone;
    return data;
  }
}
