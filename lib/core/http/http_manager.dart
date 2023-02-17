abstract class HttpManager {
  HttpManager();

  Future<dynamic> get(
    String endpoint,
  );
}
