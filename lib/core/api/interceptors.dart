import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../debugging/log.dart';

/// AuthInterceptor - Handles adding headers globally.
class AuthInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Accept'] = 'application/json';
    super.onRequest(options, handler);
  }
}

/// LoggingInterceptor - Enhanced for better debugging & performance tracking.
class LoggingInterceptor extends Interceptor {
  DateTime? _startTime;
  DateTime? _endTime;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    _startTime = DateTime.now();
    Log.debug('🚀 [REQUEST START] ───────────────────────────────────────');

    // Display Request Info
    final requestUrl = options.queryParameters.isNotEmpty
        ? "${options.baseUrl}${options.path}?${Transformer.urlEncodeMap(options.queryParameters)}"
        : "${options.baseUrl}${options.path}";

    Log.info("🔗 Request URL: $requestUrl");
    Log.warning("📡 Method: ${options.method}");

    // Log Headers & Data (Handle long values better)
    Log.warning("📎 Headers: ${_formatJson(options.headers)}");
    Log.warning("📩 Content-Type: ${options.contentType}");
    Log.warning("📦 Request Data: ${_formatRequestData(options.data)}");

    debugPrint("📎 Headers (Full Debug Print): ${_formatJson(options.headers)}",
        wrapWidth: 3024);

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    _endTime = DateTime.now();
    final duration = _endTime!.difference(_startTime!).inMilliseconds;

    Log.debug('✅ [RESPONSE RECEIVED] ───────────────────────────────');
    Log.info("🟢 Status Code: ${response.statusCode}");
    Log.info("⏳ Response Time: ${duration}ms");
    Log.info("🔗 Request URL: ${response.realUri}");
    Log.info("📩 Response Data: ${_formatJson(response.data)}");

    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    _endTime = DateTime.now();
    final duration =
        _endTime?.difference(_startTime ?? DateTime.now()).inMilliseconds ?? 0;

    Log.error('❌ [REQUEST ERROR] ────────────────────────────────');
    Log.error("⛔ Error Type: ${err.type}");
    Log.error("🔗 Request URL: ${err.requestOptions.uri}");
    Log.error("📡 Method: ${err.requestOptions.method}");
    Log.error("🟢 Status Code: ${err.response?.statusCode ?? 'Unknown'}");
    Log.error("⚠️ Error Message: ${err.message}");
    Log.error("🕒 Request Duration: ${duration}ms");

    if (err.response != null) {
      Log.error("📩 Response Data: ${_formatJson(err.response?.data)}");
    }

    Log.error(
        "📜 Stack Trace: ${err.stackTrace ?? 'No stack trace available'}");

    super.onError(err, handler);
  }

  /// Helper function: Format headers & JSON response in readable format.
  String _formatJson(dynamic data) {
    try {
      return const JsonEncoder.withIndent('  ').convert(data);
    } catch (_) {
      return data.toString();
    }
  }

  /// Helper function: Handle and format request data (including FormData).
  String _formatRequestData(dynamic data) {
    if (data is FormData) {
      return "📂 FormData Fields: ${data.fields}\n📂 FormData Files: ${data.files.map((file) => file.value.filename).toList()}";
    }
    return _formatJson(data);
  }
}
