/// This class acts as an interface to the backend API service and provides
/// methods to fetch data from the API.
///
/// The parameter [path] is the path to the API endpoint.
/// The methods should always have a [url] parameter which is the suffix of the
/// path to the API endpoint.
abstract class IApiService {
  final String path;

  IApiService({
    required this.path,
  });

  Future<dynamic> get(String url, {dynamic args});

  Future<dynamic> post(String url, {dynamic data});
}
