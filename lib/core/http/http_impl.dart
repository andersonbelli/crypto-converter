import 'dart:developer';

import 'package:crypto_converter/core/http/http_manager.dart';
import 'package:crypto_converter/core/utils/server_config.dart';
import 'package:http/http.dart' as http;

import 'models/exception_models.dart';

class HttpImpl extends HttpManager {
  @override
  Future get(String endpoint) async {
    final url =
        Uri.https(ServerConfig.BASE_URL, ServerConfig.API_VERSION + endpoint);

    try {
      final http.Response response = await http.get(url);
      if (response.statusCode == 200) {
        return response.body;
      }

      log('Log Response - ${response.body}');
      throw GenericException(response.body);
    } catch (e) {
      log('Log Exception - $e');
      throw RequestFailException(message: e.toString());
    }
  }
}
