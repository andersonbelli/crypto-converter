abstract class HttpManager {
  HttpManager();

  Future<dynamic> get({
    required String endpoint,
    Map<String, dynamic>? query,
  });
}
