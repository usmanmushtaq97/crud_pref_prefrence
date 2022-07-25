import 'dart:convert';
class UserDetailsModel {
  String? firstname;
  String? lastname;
  String? email;
  String? mobile;
  String? dateJoin;
  UserDetailsModel(
      {this.firstname, this.lastname, this.email, this.mobile, this.dateJoin});

  static Map<String, dynamic> toJson(
          {required UserDetailsModel userDetailsModel}) =>
      {
        "firstname": userDetailsModel.firstname,
        "lastname": userDetailsModel.lastname,
        "email": userDetailsModel.email,
        "mobile": userDetailsModel.mobile,
        "dateJoin": userDetailsModel.dateJoin,
      };
  factory UserDetailsModel.fromJson(Map<String, dynamic> jsonData) {
    return UserDetailsModel(
        firstname: jsonData['firstname'],
        lastname: jsonData['lastname'],
        email: jsonData['email'],
        mobile: jsonData['mobile'],
        dateJoin: jsonData['dateJoin']);
  }
  static String encode(List<UserDetailsModel> userDetail) => json.encode(userDetail
      .map<Map<String, dynamic>>((user) => UserDetailsModel.toJson(userDetailsModel: user))
      .toList());

  static List<UserDetailsModel> decode(String userDetails) =>
      (json.decode(userDetails) as List<dynamic>)
          .map<UserDetailsModel>((e) => UserDetailsModel.fromJson(e))
          .toList();
}
