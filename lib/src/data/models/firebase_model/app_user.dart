// ignore_for_file: public_member_api_docs, sort_constructors_first
class AppUser {
  static const String collectionName = "users";
  String token;
  String imageUrl;
  String fullName;
  String email;
  String phone;
  AppUser({
    required this.token,
    required this.imageUrl,
    required this.fullName,
    required this.email,
    required this.phone,
  });

  //? to json
  Map<String, dynamic> toJson() {
    return {
      'token': token,
      'imageUrl': imageUrl,
      'fullName': fullName,
      'email': email,
      'phone': phone,
    };
  }

  //? from json
  factory AppUser.fromJson(Map<String, dynamic> json) {
    return AppUser(
      token: json['token'],
      imageUrl: json['imageUrl'],
      fullName: json['fullName'],
      email: json['email'],
      phone: json['phone'],
    );
  }
}
