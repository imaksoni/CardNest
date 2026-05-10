import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';

// Provider for FlutterSecureStorage
final secureStorageProvider = Provider<FlutterSecureStorage>((ref) {
  return const FlutterSecureStorage();
});

// Provider for Dio API Client
final apiClientProvider = Provider<Dio>((ref) {
  final secureStorage = ref.watch(secureStorageProvider);

  // Set the base URL based on the platform and environment
  String baseUrl = 'http://localhost:8000';
  if (!kIsWeb && Platform.isAndroid) {
    baseUrl = 'http://10.0.2.2:8000';
  }

  final dio = Dio(BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
  ));

  // Add interceptor for authentication
  dio.interceptors.add(InterceptorsWrapper(
    onRequest: (options, handler) async {
      // Get the access token from secure storage
      final token = await secureStorage.read(key: 'access_token');
      if (token != null) {
        options.headers['Authorization'] = 'Bearer $token';
      }
      return handler.next(options);
    },
    onError: (DioException e, handler) async {
      // If unauthorized (401), we might need to log out the user
      // or handle token refresh here. For now, sign out.
      if (e.response?.statusCode == 401) {
        // Sign out of Firebase which triggers the auth stream listener
        // to reset the auth state in authProvider
        await FirebaseAuth.instance.signOut();
        // Clear token
        await secureStorage.delete(key: 'access_token');
      }
      return handler.next(e);
    },
  ));

  // Optional: Add logging interceptor for debug mode
  if (kDebugMode) {
    dio.interceptors.add(LogInterceptor(
      requestBody: true,
      responseBody: true,
    ));
  }

  return dio;
});
