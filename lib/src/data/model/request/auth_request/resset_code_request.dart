class ResetCodeRequest {
  String? resetCode;

  ResetCodeRequest({this.resetCode});

  ResetCodeRequest.fromJson(Map<String, dynamic> json) {
    resetCode = json['resetCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['resetCode'] = this.resetCode;
    return data;
  }
}
