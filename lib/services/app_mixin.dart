import 'package:flutter/foundation.dart';

mixin AppMixin {

  printDebug({String ?message}){
    if (kDebugMode) {
      print("========>> $message");
    }
  }
}