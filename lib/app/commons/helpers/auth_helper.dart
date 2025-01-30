import 'package:get_storage/get_storage.dart';
import 'package:nova_by_bkc/app/data/models/auth/auth_model.dart';

class AuthHelper {
  static final GetStorage _storage = GetStorage();

  static void saveToken(String token) {
    _storage.write(StorageKeyConstant.accessToken, token);
  }

  static String? getToken() {
    return _storage.read(StorageKeyConstant.accessToken);
  }

  static void saveUserData(Map<String, dynamic> userData) {
    _storage.write(StorageKeyConstant.userData, userData['user']);
  }

  static Map<String, dynamic>? getUserData() {
    return _storage.read(StorageKeyConstant.userData);
  }

  static void clearAuthData() {
    _storage.remove(StorageKeyConstant.userLoggedIn);
    _storage.remove(StorageKeyConstant.accessToken);
    _storage.remove(StorageKeyConstant.userData);
  }

  static AuthModel? get user {
    final data =
        _storage.read<Map<String, dynamic>>(StorageKeyConstant.userData);
    if (data != null) {
      return AuthModel.fromMap(data);
    }
    return null;
  }

  static bool get isLoggedIn {
    final data = _storage.read(StorageKeyConstant.accessToken);
    return data != null;
  }

  static bool isSuperEDP() => user?.idrole == '1';
  static bool isDireksi() => user?.idrole == '2' || user?.idrole == '20';
  static bool isKadiv() => user?.idrole == '3';
  static bool isKabag() => user?.idrole == '4';
  static bool isKacab() => user?.idrole == '5';
  static bool isKasie() => user?.idrole == '6';
  static bool isAkunting() => user?.idrole == '7';
  static bool isCustomerService() => user?.idrole == '8';
  static bool isAdminKredit() => user?.idrole == '9';
  static bool isTellerPusat() => user?.idrole == '10';
  static bool isTellerCabang() => user?.idrole == '11';
  static bool isTellerKas() => user?.idrole == '12';
  static bool isTellerPasar() => user?.idrole == '13';
  static bool isKepalaKas() => user?.idrole == '14';
  static bool isAccountOfficer() => user?.idrole == '15';
  static bool isOtorisatorCabang() => user?.idrole == '16';
  static bool isAdministratorPusat() => user?.idrole == '17';
  static bool isTellerKP() => user?.idrole == '18';
  static bool isCSAndAdmin() => user?.idrole == '19';
  static bool isBagianDana() => user?.idrole == '21';
  static bool isPrintBukuOnly() => user?.idrole == '22';
  static bool isCSTeller() => user?.idrole == '23';
  static bool isAOKredit() => user?.idrole == '24';
  static bool isKasieBisnis() => user?.idrole == '25';
  static bool isKasieOperasional() => user?.idrole == '26';
}

class StorageKeyConstant {
  static const String userLoggedIn = 'userLoggedIn';
  static const String accessToken = 'accessToken';
  static const String userData = 'userData';
}
