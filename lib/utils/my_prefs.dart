import 'package:HAMD_Delivery/constants/sp_keys/shared_preference_constats.dart';
import 'package:get_storage/get_storage.dart';

class MyPref {
  static final prefs = GetStorage();

  static get token => prefs.read(SPKeys.token);
  static get code => prefs.read(SPKeys.code);
  static get secondToken => prefs.read(SPKeys.secondToken);

  static set token(String value) => prefs.write(SPKeys.token, value);
  static set code(String codeValue) => prefs.write(SPKeys.code, codeValue);
  static set secondToken(String secondTokenvalue) =>
      prefs.write(SPKeys.secondToken, secondTokenvalue);

  static clearToken() => prefs.remove(SPKeys.token);
  static clearSecondToken() => prefs.remove(SPKeys.secondToken);
  static clearCode() => prefs.remove(SPKeys.code);
}
