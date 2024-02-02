import 'package:alafein/features/auth/login/model/login_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class CredentialStorage {
  final FlutterSecureStorage _storage;

  CredentialStorage(this._storage);
  static const String _key = 'user_credentials';
  LoginModel? _chashedUser;

  Future<LoginModel?> read() async {
    if (_chashedUser != null) {
      return _chashedUser;
    }
    final json = await _storage.read(key: _key);
    if (json == null) {
      return null;
    }
    try {
      return _chashedUser = LoginModel.fromJson(json);
    } on FormatException {
      return null;
    }
  }

  Future<void> save(LoginModel user) {
    _chashedUser = user;
    return _storage.write(key: _key, value: user.toJson().toString());
  }

  Future<void> clear() {
    _chashedUser = null;
    return _storage.delete(key: _key);
  }
}
