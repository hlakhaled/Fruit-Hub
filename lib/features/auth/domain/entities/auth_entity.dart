class AuthEntity {
  final String email;
  final String name;
  final String uid;

  const AuthEntity({
    required this.email,
    required this.name,
    required this.uid,
  });

  toMap() {
    return ({'name': name, 'email': email, 'uid': uid});
  }
}
