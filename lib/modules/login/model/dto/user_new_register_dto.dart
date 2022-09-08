import 'package:equatable/equatable.dart';
import 'package:faker/faker.dart';
import 'package:safe_password_with_hasura/modules/login/model/dto/user_login_dto.dart';
import 'package:safe_password_with_hasura/src/domain/entities/user.dart';

class UserNewRegisterDto extends UserEntity with EquatableMixin {
  final String nickname;

  UserNewRegisterDto({
    required super.email,
    required super.password,
    required this.nickname,
  });

  @override
  List<Object?> get props => [
        nickname,
        super.email,
        super.password,
      ];

  static UserLoginDto fake() {
    return UserLoginDto(
      email: faker.internet.email(),
      password: faker.internet.password(),
    );
  }

  static UserLoginDto from(Map<String, String> json) {
    return UserLoginDto(
      email: json['email'] as String,
      password: json['password'] as String,
    );
  }

  static Map<String, String> to(UserLoginDto object) {
    return {
      'email': object.email,
      'password': object.password,
    };
  }
}
