import 'dart:convert';
import 'package:http/http.dart' as http;

class WebApiExecutor {

  static Future<WebApiResponse> get(WebApiGetRequest request) async =>
      WebApiResponse(await http.get(request.uri, headers: request.headers));

  static Future<WebApiResponse> post(WebApiPostRequest request) async =>
      WebApiResponse(
          await http.post(request.uri,
              headers: request.headers,
              body: request.body,
              encoding: request.encoding
          )
      );
}

class WebApiGetRequest {

  WebApiGetRequest(this._uri, this.headers);

  final String _uri;
  final Map<String, String> headers;

  Uri get uri => Uri.tryParse(_uri);
}

class WebApiPostRequest {

  WebApiPostRequest(this._uri, this.headers, this.body, this.encoding);

  final String _uri;
  final Map<String, String> headers;
  final dynamic body;
  final Encoding encoding;

  Uri get uri => Uri.tryParse(_uri);
}

class WebApiResponse {

  WebApiResponse(this._response);

  final http.Response _response;

  bool get isSuccess => 200 == _response.statusCode;
  String get body => _response.body;
  dynamic get bodyObject => json.decoder.convert(body);
  Map<String, String> get headers => _response.headers;
}
