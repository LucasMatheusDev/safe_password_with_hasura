import 'package:faker/faker.dart';
import 'package:safe_password_with_hasura/src/domain/entities/password.dart';

class PasswordDto extends Password {
  PasswordDto({required super.value, required super.applicationName});

  static PasswordDto from(Map<String, dynamic> json) {
    return PasswordDto(
      value: json["value"],
      applicationName: json["application_name"],
    );
  }

  static Map<String, dynamic> to(PasswordDto passwordDto) {
    return {
      "value": passwordDto.value,
      "applicationName": passwordDto.applicationName,
    };
  }

  static fake() {
    return PasswordDto(
      value: faker.randomGenerator.string(25, min: 9),
      applicationName: faker.company.name(),
    );
  }
}
