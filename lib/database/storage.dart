import 'package:farmer_group_management/models/user.dart';
import 'package:farmer_group_management/services/app_mixin.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

enum Keys { user }

class BoxStorage extends GetxController with AppMixin{
  final box = GetStorage();

  Future initStorage() async {
    await GetStorage.init();
    printDebug(message: "Init storage box");
  }

  Future storeUser(User user) async{
    await box.write(Keys.user.toString(),user.toJson());
    printDebug(message: "Store User");
  }

  User getUser(){
    final data = box.read(Keys.user.toString()) ?? <String,dynamic>{};
    printDebug(message: "get user removed");
    return User.fromJson(data);
  }

  Future removeUser() async {
    await box.remove(Keys.user.toString());
    printDebug(message: "user removed");
  }

}