class ResetPasswordRequest {
  String? email;
  String? newPassword;

  ResetPasswordRequest({this.email, this.newPassword});

  ResetPasswordRequest.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    newPassword = json['newPassword'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['newPassword'] = this.newPassword;
    return data;
  }
}
