import 'package:crypto/crypto.dart';
import 'dart:convert';

class Config {
    static const publicKey = 'YOUR_PUBLIC_KEY';
    static const privateKey = 'YOUR_PRIVATE_KEY';
    static dynamic timeStamp = 1.toString();

    static String md5Hash = md5.convert(utf8.encode(timeStamp + privateKey + publicKey)).toString();
}
