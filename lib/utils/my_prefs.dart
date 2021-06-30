import 'package:HAMD_Delivery/constants/sp_keys/shared_preference_constats.dart';
import 'package:get_storage/get_storage.dart';

import '../constants/sp_keys/shared_preference_constats.dart';
import '../constants/sp_keys/shared_preference_constats.dart';
import '../constants/sp_keys/shared_preference_constats.dart';
import '../constants/sp_keys/shared_preference_constats.dart';
import '../constants/sp_keys/shared_preference_constats.dart';
import '../constants/sp_keys/shared_preference_constats.dart';
import '../constants/sp_keys/shared_preference_constats.dart';

class MyPref {
  static final prefs = GetStorage();

  static get token => prefs.read(SPKeys.token);
  static get code => prefs.read(SPKeys.code);
  static get secondToken => prefs.read(SPKeys.secondToken);
  static get phoneNumber => prefs.read(SPKeys.phoneNumber);
  static get fToken => prefs.read(SPKeys.fToken);

  static set token(String value) => prefs.write(SPKeys.token, value);
  static set code(String codeValue) => prefs.write(SPKeys.code, codeValue);
  static set fToken(String fToken) => prefs.write(SPKeys.fToken, fToken);
  static set phoneNumber(String phoneNumber) =>
      prefs.write(SPKeys.phoneNumber, phoneNumber);
  static set secondToken(String secondTokenvalue) =>
      prefs.write(SPKeys.secondToken, secondTokenvalue);

  static clearToken() => prefs.remove(SPKeys.token);
  static clearSecondToken() => prefs.remove(SPKeys.secondToken);
  static clearCode() => prefs.remove(SPKeys.code);
  static clearPhoneNumber() => prefs.remove(SPKeys.phoneNumber);
  static clearFToken() => prefs.remove(SPKeys.fToken);
  static allTokentsClear() {
    prefs.remove(SPKeys.token);
    prefs.remove(SPKeys.secondToken);
    prefs.remove(SPKeys.fToken);
    prefs.remove(SPKeys.phoneNumber);
  }
}
