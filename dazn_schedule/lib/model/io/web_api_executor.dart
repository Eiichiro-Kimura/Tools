import 'dart:convert';
import 'package:http/http.dart' as http;

class WebApiExecutor {

  static Future<WebApiResponse> get(WebApiGetRequest request) async =>
      WebApiResponse(await http.get(request.url, headers: request.headers));

  static Future<WebApiResponse> post(WebApiPostRequest request) async =>
      WebApiResponse(
          await http.post(request.url,
              headers: request.headers,
              body: request.body,
              encoding: request.encoding
          )
      );
}

class WebApiGetRequest {

  WebApiGetRequest(this.url, this.headers);

  final String url;
  final Map<String, String> headers;
}

class WebApiPostRequest {

  WebApiPostRequest(this.url, this.headers, this.body, this.encoding);

  final String url;
  final Map<String, String> headers;
  final dynamic body;
  final Encoding encoding;
}

class WebApiResponse {

  WebApiResponse(this._response);

  final http.Response _response;

  bool get isSuccess => 200 == _response.statusCode;
  String get body => _response.body;
  dynamic get bodyObject => json.decoder.convert(body);
  Map<String, String> get headers => _response.headers;
}
