class UserEntity {
  final String name;
  final String email;
  final String uID;

  const UserEntity({
    required this.email,
    required this.name,
    required this.uID,
  });

  Map<String, dynamic> toMap() => {'name': name, 'email': email, 'uID': uID};
}
