import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../models/user.dart';

class ClientProfileInfoController extends GetxController{
  User user = User.fromJson(GetStorage().read('user'));

  void signOut(){
    GetStorage().remove('user');
    Get.offNamedUntil('/', (route) => false);
  }
  void goToprofileUpdate(){
    Get.toNamed('/client/profile/update');
  }
}