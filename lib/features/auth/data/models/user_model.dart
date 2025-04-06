import 'package:eyego_movies_app/features/auth/domain/entities/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.name,
    required super.email,
    required super.uID,
  });

  factory UserModel.fromFirebaseUser(User user) =>
      UserModel(name: user.displayName!, email: user.email!, uID: user.uid);
}
