import 'package:equatable/equatable.dart';
import 'package:faker/faker.dart';
import 'package:safe_password_with_hasura/modules/login/model/dto/user_new_register_dto.dart';
import 'package:safe_password_with_hasura/src/domain/entities/user.dart';

class UserLoginDto extends UserEntity with EquatableMixin {
  UserLoginDto({
    required super.email,
    required super.password,
  });

  @override
  List<Object?> get props => [
        email,
        password,
      ];

  static UserNewRegisterDto fake() {
    return UserNewRegisterDto(
      nickname: faker.person.name(),
      email: faker.internet.email(),
      password: faker.internet.password(),
    );
  }

  static UserNewRegisterDto from(Map<String, String> json) {
    return UserNewRegisterDto(
      nickname: json['nickname'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
    );
  }

  static Map<String, String> to(UserNewRegisterDto object) {
    return {
      'nickname': object.nickname,
      'email': object.email,
      'password': object.password,
    };
  }
}
