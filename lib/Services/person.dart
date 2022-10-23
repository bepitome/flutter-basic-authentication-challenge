class Person {
  Result? result;

  Person({this.result});

  Person.fromJson(Map<String, dynamic> json) {
    result = json['result'] != null ? Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (result != null) {
      data['result'] = result!.toJson();
    }
    return data;
  }
}

class Result {
  String? sId;
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? username;
  String? company;
  String? password;
  String? gender;

  Result(
      {this.sId,
      this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.username,
      this.company,
      this.password,
      this.gender});

  Result.fromJson(Map<String, dynamic> json) {
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['id'] = id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    data['username'] = username;
    data['company'] = company;
    data['password'] = password;
    data['gender'] = gender;
    return data;
  }
}
