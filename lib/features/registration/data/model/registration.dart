class Registration {
  String? firstName;
  String? lastName;
  String? email;
  String? userName;
  String? password;


  Registration.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    userName = json['userName'];
    password = json['password'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['firstName'] = this.firstName;
  //   data['lastName'] = this.lastName;
  //   data['email'] = this.email;
  //   data['userName'] = this.userName;
  //   data['password'] = this.password;
  //   return data;
  // }
}