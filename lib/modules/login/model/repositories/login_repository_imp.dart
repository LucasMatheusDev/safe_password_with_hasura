import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:safe_password_with_hasura/modules/login/model/dto/user_new_register_dto.dart';
import 'package:safe_password_with_hasura/src/domain/entities/user.dart';
import 'package:safe_password_with_hasura/src/domain/interface/repositories/login_repository.dart';
import 'package:safe_password_with_hasura/src/domain/interface/services/api_service.dart';

/// This class is responsible for [registerUser] and [loginUser].
class LoginRepositoryImp implements ILoginRepository {
  final IApiService _apiService;

  LoginRepositoryImp({required IApiService apiService})
      : _apiService = apiService;

  @override
  Future<User?> login({required UserEntity user}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    await auth.signInWithEmailAndPassword(
      email: user.email,
      password: user.password,
    );

    return auth.currentUser;
  }

  @override
  Future<User?> register({required UserEntity user}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    await auth.createUserWithEmailAndPassword(
      email: user.email,
      password: user.password,
    );

    if (user is UserNewRegisterDto) {
      await auth.currentUser?.updateDisplayName(
        user.nickname,
      );
    }
    await _saveUserDataInDB(
      email: user.email,
      password: user.password,
      uid: auth.currentUser!.uid,
    );
    return auth.currentUser;
  }

  Future<void> _saveUserDataInDB({
    required String email,
    required String password,
    required String uid,
  }) async {
    final endPoint = dotenv.env['HASURA_URL'];
    final currentUser = FirebaseAuth.instance.currentUser;
    String query = '''
mutation MyMutation {
  insert_users(objects: {email: "$email", password: "$password", uid: "${currentUser!.uid}"}) {
    affected_rows
  }
}

''';
    await _apiService.post(endPoint.toString(), data: query);
  }
}
