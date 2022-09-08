import 'package:hasura_connect/hasura_connect.dart';
import 'package:safe_password_with_hasura/constants.dart';
import 'package:safe_password_with_hasura/src/domain/interface/services/api_service.dart';

class HasuraApiServiceImp implements IApiService {
  @override
  Future get(String url, {args}) async {
    final hasura = HasuraConnect(url, headers: headers);

    final result = await hasura.query(args);
    return result["data"];
  }

  @override
  String get path => "";

  @override
  Future post(String url, {data}) async {
    final hasura = HasuraConnect(url, headers: headers);

    return await hasura.mutation(data);
  }
}
