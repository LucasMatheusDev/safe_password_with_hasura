import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:safe_password_with_hasura/modules/home/model/entities/password_dto.dart';
import 'package:safe_password_with_hasura/src/domain/entities/password.dart';
import 'package:safe_password_with_hasura/src/domain/interface/repositories/home_repository.dart';
import 'package:safe_password_with_hasura/src/domain/interface/services/api_service.dart';

class HomeRepositoryImp implements IHomeRepository {
  final IApiService _apiService;

  HomeRepositoryImp({required IApiService apiService})
      : _apiService = apiService;

  @override
  Future<List<Password>> getSavePasswords() async {
    final endPoint = dotenv.env['HASURA_URL'];
    final currentUser = FirebaseAuth.instance.currentUser;
    String query = '''
query MyQuery {
  password(where: {user_id: {_eq: "${currentUser!.uid}"}}) {
    value
    application_name
  }
}

''';
    final result = await _apiService.get(endPoint.toString(), args: query);
    final List passwordList = (result["password"] as List);
    return passwordList.map((password) => PasswordDto.from(password)).toList();
  }

  @override
  Future saveNewPassword(
      {required String password, required String applicationName}) async {
    final currentUser = FirebaseAuth.instance.currentUser;
    final endPoint = dotenv.env['HASURA_URL'];
    String query = '''
mutation MyMutation {
  insert_password(objects: {value: "$password", application_name: "$applicationName", user_id: "${currentUser!.uid}"}) {
    affected_rows
  }
}

''';
    return await _apiService.post(endPoint.toString(), data: query);
  }

  @override
  Future deletedPassword(
      {required String password, required String applicationName}) async {
    final currentUser = FirebaseAuth.instance.currentUser;
    final endPoint = dotenv.env['HASURA_URL'];
    String query = '''
mutation MyMutation {
  delete_password(where:
  {application_name: {_eq: "$applicationName"},
  user_id: {_eq: "${currentUser!.uid}"},
  value: {_eq: "$password"}}) {
    affected_rows
  }
}


''';
    return await _apiService.post(endPoint.toString(), data: query);
  }

  @override
  Future logout() async {
    return FirebaseAuth.instance.signOut();
  }
}
