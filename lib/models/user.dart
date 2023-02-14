class User {
  int? id;
  String? firstName;
  String? lastName;
  String? fullName;
  String? email;
  String? token;

  User({this.id, this.firstName, this.lastName, this.fullName, this.email,this.token});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    fullName = json['full_name'];
    email = json['email'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['full_name'] = fullName;
    data['email'] = email;
    data['token'] = token;
    return data;
  }
}