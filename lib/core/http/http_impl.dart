import 'dart:convert';
import 'dart:developer';

import 'package:crypto_converter/core/http/http_manager.dart';
import 'package:crypto_converter/core/utils/server_config.dart';
import 'package:http/http.dart' as http;

import 'models/exception_models.dart';

class HttpImpl extends HttpManager {
  @override
  Future get({
    required String endpoint,
    Map<String, dynamic>? query,
  }) async {
    final url = Uri.https(
      ServerConfig.BASE_URL,
      ServerConfig.API_VERSION + endpoint,
      query,
    );

    try {
      final http.Response response = await http.get(url);
      if (response.statusCode == 200) {
        return response.body;
      }

      log('Log Response - ${response.body}');

      var errorMessage = response.body;
      final responseBody = json.decode(response.body) as Map<String, dynamic>;

      if (response.body.contains('error_message')) {
        responseBody.forEach((key, value) {
          if (key == 'status') {
            (value as Map).forEach((key, value) {
              if (key == 'error_message') {
                errorMessage = value.toString();
              }
            });
          }
        });
      }

      throw GenericException(errorMessage);
    } catch (e) {
      log('Log Exception - $e');
      throw RequestFailException(message: e.toString());
    }
  }
}
