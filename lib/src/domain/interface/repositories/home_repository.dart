import 'package:safe_password_with_hasura/src/domain/entities/password.dart';

abstract class IHomeRepository {
  Future<List<Password>> getSavePasswords();

  Future saveNewPassword(
      {required String password, required String applicationName});
  Future deletedPassword(
      {required String password, required String applicationName});
  Future logout();
}
