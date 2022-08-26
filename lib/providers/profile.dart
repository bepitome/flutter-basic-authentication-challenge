//             "id": 8013930,
//             "first_name": "Webster",
//             "last_name": "Kigelman",
//             "email": "wkigelman0@skyrock.com",
//             "username": "wkigelman0",
//             "company": "Yata",
//             "password": "RzxNePWmk1U",
//             "gender": "Male"

enum Gender {
  male,
  female,
}

class Profile {
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String username;
  final String company;
  final Gender gender;

  Profile({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.username,
    required this.company,
    required this.gender,
  });

  static Profile get dummyProfile {
    return Profile(
      id: 1,
      firstName: 'yousif',
      lastName: 'alarfaj',
      email: 'test@test.com',
      username: 'ymaarfaj',
      company: 'Aramco',
      gender: Gender.male,
    );
  }
}
