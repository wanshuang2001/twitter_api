/*
import 'dart:async';
import 'dart:convert';

import 'package:dart_twitter_api/api/abstract_twitter_client.dart';
import 'package:http/http.dart';
import 'package:oauth1/oauth1.dart' as oauth1;

/// A function used to transform the response.
///
/// To prevent large computations from blocking the thread, response bodies are
/// decoded in an isolate by default.
typedef TransformResponse<T> = FutureOr<T> Function(Response response);

const Duration _kDefaultTimeout = Duration(seconds: 10);

/// The default implementation for [AbstractTwitterClient].
///
/// Requests throw a [TimeoutException] when a request hasn't returned a
/// response for some time determined by [defaultTimeout].
///
/// If the received [Response.statusCode] is not a success (2xx), it is returned
/// as a [Future.error]. To handle these responses, catch the error and check
/// for the type to be a [Response].
class TwitterClient extends AbstractTwitterClient {
  TwitterClient({
    required this.consumerKey,
    required this.consumerSecret,
    required this.token,
    required this.secret,
    this.defaultTimeout = _kDefaultTimeout,
  });

  String consumerKey;
  String consumerSecret;
  String token;
  String secret;

  /// The time it takes for a request to time out and throw a [TimeoutException].
  ///
  /// A request can override the default timeout independently.
  final Duration defaultTimeout;

  oauth1.Platform get _platform {
    return oauth1.Platform(
      'https://api.twitter.com/oauth/request_token',
      'https://api.twitter.com/oauth/authorize',
      'https://api.twitter.com/oauth/access_token',
      oauth1.SignatureMethods.hmacSha1,
    );
  }

  oauth1.ClientCredentials get _clientCredentials {
    return oauth1.ClientCredentials(
      consumerKey,
      consumerSecret,
    );
  }

  oauth1.Client get oauthClient {
    return oauth1.Client(
      _platform.signatureMethod,
      _clientCredentials,
      oauth1.Credentials(token, secret),
    );
  }

  @override
  Future<Response> get(
    Uri uri, {
    Map<String, String>? headers,
    Duration? timeout,
  }) {
    return oauthClient
        .get(uri, headers: headers)
        .timeout(timeout ?? defaultTimeout)
        .then((response) {
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return response;
      } else {
        return Future.error(response);
      }
    });
  }

  @override
  Future<Response> post(
    Uri uri, {
    Map<String, String>? headers,
    dynamic body,
    Encoding? encoding,
    Duration? timeout,
  }) {
    return oauthClient
        .post(uri, headers: headers, body: body, encoding: encoding)
        .timeout(timeout ?? defaultTimeout)
        .then((response) {
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return response;
      } else {
        return Future.error(response);
      }
    });
  }

  @override
  Future<Response> multipartRequest(
    Uri uri, {
    List<MultipartFile>? files,
    Map<String, String>? headers,
    String method = 'POST',
    Duration? timeout,
  }) async {
    final request = MultipartRequest(method, uri);

    if (files != null) {
      request.files.addAll(files);
    }

    if (headers != null) {
      request.headers.addAll(headers);
    }

    return Response.fromStream(await oauthClient.send(request))
        .timeout(timeout ?? defaultTimeout)
        .then((response) {
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return response;
      } else {
        return Future.error(response);
      }
    });
  }
}
*/


import 'dart:async';
import 'dart:convert';
import 'package:dart_twitter_api/api/abstract_twitter_client.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

typedef TransformResponse<T> = FutureOr<T> Function(Response response);

const Duration _kDefaultTimeout = Duration(seconds: 10);

class TwitterClient extends AbstractTwitterClient {

  TwitterClient({
    required this.consumerKey,
    required this.consumerSecret,
    required this.token,
    required this.secret,
    this.defaultTimeout = _kDefaultTimeout,
    this.userId = '-1',
  });

  String consumerKey;
  String consumerSecret;
  String token;
  String secret;
  String userId;
  /// The time it takes for a request to time out and throw a [TimeoutException].
  ///
  /// A request can override the default timeout independently.
  final Duration defaultTimeout;
  
  Future<http.Response> get(
    Uri uri, {
    Map<String, String>? headers,
    Duration? timeout,
  }) async {
    final requestHeaders = {
      ...?headers,
      'Authorization': 'Bearer $token', // 使用 Token 进行认证
      'Userid': token, // 添加 user_id 到 headers
      'Token': token,
    };

    final response = await http.get(uri, headers: requestHeaders).timeout(timeout ?? Duration(seconds: 10));

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return response;
    } else {
      return Future.error(response);
    }
  }

  Future<http.Response> post(
    Uri uri, {
    Map<String, String>? headers,
    dynamic body,
    Encoding? encoding,
    Duration? timeout,
  }) async {
    final requestHeaders = {
      ...?headers,
      'Authorization': 'Bearer $token', // 使用 Token 进行认证
      'Userid': token, // 添加 user_id 到 headers
      'Token': token,
    };

    final response = await http
        .post(uri, headers: requestHeaders, body: body, encoding: encoding)
        .timeout(timeout ?? Duration(seconds: 10));

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return response;
    } else {
      return Future.error(response);
    }
  }

  Future<http.Response> multipartRequest(
    Uri uri, {
    List<http.MultipartFile>? files,
    Map<String, String>? headers,
    String method = 'POST',
    Duration? timeout,
  }) async {
    final request = http.MultipartRequest(method, uri);

    if (files != null) {
      request.files.addAll(files);
    }

    final requestHeaders = {
      ...?headers,
      'Authorization': 'Bearer $token', // 使用 Token 进行认证
      'Userid': userId, // 添加 user_id 到 headers
      'Token': token,
    };

    request.headers.addAll(requestHeaders);

    final streamedResponse = await request.send().timeout(timeout ?? Duration(seconds: 10));
    final response = await http.Response.fromStream(streamedResponse);

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return response;
    } else {
      return Future.error(response);
    }
  }

  // 实现获取用户 ID 的方法
  @override
  void setUserId(String InUserId) {
    userId = InUserId;
  }

  // 实现获取 Token 的方法
  @override
  void setToken(String InToken) {
    token = InToken;
  }
}

