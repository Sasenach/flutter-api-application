import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    required int id,
    required String userName,
    required String email,
    String? password,
    String? accessToken,
    String? refreshToken,
    String? salt,
    String? hashPassword,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

// class User extends ManagedObject<_User> implements _User {}

// class _User {
//   @primaryKey
//   int? id;
//   @Column(unique: true, indexed: true)
//   String? userName;
//   @Column(unique: true, indexed: true)
//   String? email;
//   @Serialize(input: true, output: false)
//   String? password;
//   @Column(nullable: true)
//   String? accessToken;
//   @Column(nullable: true)
//   String? refreshToken;

//   @Column(omitByDefault: true)
//   String? salt;
//   @Column(omitByDefault: true)
//   String? hashPassword;

//   ManagedSet<Note>? noteList;
// }