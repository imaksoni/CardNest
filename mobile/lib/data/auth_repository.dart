import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../core/api_client.dart';

class TokenResponse {
  final String accessToken;
  final String tokenType;
  final int userId;
  final List<String> roles;

  TokenResponse({
    required this.accessToken,
    required this.tokenType,
    required this.userId,
    required this.roles,
  });

  factory TokenResponse.fromJson(Map<String, dynamic> json) {
    return TokenResponse(
      accessToken: json['access_token'],
      tokenType: json['token_type'],
      userId: json['user_id'],
      roles: List<String>.from(json['roles']),
    );
  }
}

class UserProfileResponse {
  final int id;
  final String phoneNumber;
  final List<String> roles;

  UserProfileResponse({
    required this.id,
    required this.phoneNumber,
    required this.roles,
  });

  factory UserProfileResponse.fromJson(Map<String, dynamic> json) {
    return UserProfileResponse(
      id: json['id'],
      phoneNumber: json['phone_number'],
      roles: List<String>.from(json['roles']),
    );
  }
}

class AuthRepository {
  final Dio _dio;
  final FlutterSecureStorage _secureStorage;

  AuthRepository(this._dio, this._secureStorage);

  Future<TokenResponse> exchangeFirebaseToken(String firebaseToken, String role) async {
    try {
      final response = await _dio.post('/auth/firebase/exchange', data: {
        'firebase_token': firebaseToken,
        'role': role,
      });

      final tokenResponse = TokenResponse.fromJson(response.data);

      // Store token securely
      await _secureStorage.write(key: 'access_token', value: tokenResponse.accessToken);

      return tokenResponse;
    } catch (e) {
      rethrow;
    }
  }

  Future<UserProfileResponse> getMe() async {
    try {
      final response = await _dio.get('/auth/me');
      return UserProfileResponse.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> logout() async {
    await _secureStorage.delete(key: 'access_token');
  }
}

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final dio = ref.watch(apiClientProvider);
  final secureStorage = ref.watch(secureStorageProvider);
  return AuthRepository(dio, secureStorage);
});
