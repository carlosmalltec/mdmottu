
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';


import 'interceptor/dio_connectivity_request_retrier.dart';
import 'interceptor/retry_interceptor.dart';
import 'network_request.dart';

class Network {
  Dio _client;

  Network(this._client) {
    BaseOptions options = BaseOptions(
      sendTimeout: 5000,
      connectTimeout: 5000,
      receiveTimeout: 8000,
      maxRedirects: 1,
      responseType: ResponseType.json,
      contentType: 'application/json',
      followRedirects: false,
      receiveDataWhenStatusError: true,
    );
    _client.options.sendTimeout = 5000;
    _client.options.connectTimeout = 5000;
    _client.options.receiveTimeout = 8000;
    _client.options.maxRedirects = 1;
    _client.options.responseType = ResponseType.json;
    _client.options.contentType = 'application/json';
    _client.options.followRedirects = false;
    _client.options.receiveDataWhenStatusError = true;

    _client = Dio(options);

    _client.interceptors.add(
      RetryOnConnectionChangeInterceptor(
         requestRetrier:DioConnectivityRequestRetrier(
          dio: Dio(),
          connectivity: Connectivity(),
        ),
        
      ),
    );
  }

  Future<Response> post(String url, {NetworkRequest? body, bool isAuth = false, showServiceToast = true}) async {
    try {
      Map<String, dynamic> _headers = <String, dynamic>{};
      _headers[Headers.contentTypeHeader] = Headers.jsonContentType;
      _headers[Headers.acceptHeader] = Headers.jsonContentType;

      var _data = await _client.post(url, data: body?.toMap(), options: Options(headers: _headers));
      return Response(requestOptions: _data.requestOptions, statusCode: _data.statusCode, statusMessage: _data.statusMessage, data: _data);
    } on DioError catch (er) {
      debugPrint('POST ERROR: NETWORK STATUS CODE ===> ${er.response!.statusCode}');
      debugPrint('POST ERROR: NETWORK STATUS MESSAGE ===> ${er.response!.statusMessage}');
      debugPrint('POST ERROR: NETWORK TYPE ===> ${er.type}');
      var _status = er.response?.statusCode;
      var _message = er.response?.statusMessage;
      var _data = er.response?.data ?? [];
      return Response(requestOptions: er.requestOptions, statusCode: _status, statusMessage: _message, data: _data);
    }
  }

  Future<Response> get(String url, {NetworkRequest? body, NetworkRequest? headers, bool isAuth = true}) async {
    try {

      Map<String, dynamic> _headers = <String, dynamic>{};
      _headers = headers != null ? headers.toMap() : <String, dynamic>{};

      _headers[Headers.contentTypeHeader] = Headers.jsonContentType;
      _headers[Headers.acceptHeader] = Headers.jsonContentType;

      return await _client.get(
        Uri.encodeFull(url),
        options: Options(headers: _headers),
        queryParameters: body != null ? body.toMap() : {},
      );
    } on DioError catch (er) {
      debugPrint('ERROR: NETWORK STATUS CODE ===> ${er.response?.statusCode}');
      debugPrint('ERROR: NETWORK STATUS MESSAGE ===> ${er.response?.statusMessage}');
      debugPrint('ERROR: NETWORK TYPE ===> ${er.type}');
      var _statusCode = er.response?.statusCode?.toInt();
      var _statusMessage = er.response?.statusMessage.toString();
      var _data = er.response?.data ?? [];
      return Response(requestOptions: er.requestOptions, statusCode: _statusCode, statusMessage: _statusMessage, data: _data);
    }
  }
}
