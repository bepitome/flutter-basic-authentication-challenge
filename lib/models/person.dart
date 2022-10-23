class Person {
  String? sId;
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? username;
  String? company;
  String? password;
  String? gender;

  Person(
      {this.sId,
      this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.username,
      this.company,
      this.password,
      this.gender});

  Person.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    username = json['username'];
    company = json['company'];
    password = json['password'];
    gender = json['gender'];
  }
}
