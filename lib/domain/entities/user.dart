class User {
  final String? firstName, lastName, email, username, company, gender;

  const User({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.username,
    required this.company,
    required this.gender,
  });

  @override
  String toString() {
    return '{$firstName, $lastName, $email, $username, $company, $gender}';
  }
}
