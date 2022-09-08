import 'package:safe_password_with_hasura/src/domain/entities/user.dart';

abstract class ILoginRepository {
  Future login({required UserEntity user});
  Future register({required UserEntity user});
}
