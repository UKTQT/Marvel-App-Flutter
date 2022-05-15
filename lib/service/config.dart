import 'package:crypto/crypto.dart';
import 'dart:convert';

class Config {
  static const publicKey = 'b65738aeababcc65da824c06c291c198';
  static const privateKey = '745130518ade72bfc6c098dcf0462cd9d003c15b';
  static dynamic timeStamp = 1.toString();

  static String md5Hash =
      md5.convert(utf8.encode(timeStamp + privateKey + publicKey)).toString();
}
