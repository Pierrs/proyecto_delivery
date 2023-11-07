
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:proyecto/src/models/response_api.dart';

import '../models/category.dart';
import '../models/user.dart';
import '../pages/environment/environment.dart';

class CategoriesProvider extends GetConnect{
  String url = '${Environment.API_URL}api/categories';
  User userSession = User.fromJson(GetStorage().read('user')??{});

  Future<List<Category>> getAll() async {
    Response response = await get(
        '$url/getAll',
        headers: {
          'Content-Type': 'application/json',
          'Authorization': userSession.sessionToken?? ''
        }
    );
    if(response.statusCode==401){
      Get.snackbar('Peticion denegada', 'tu usuario no tiene permitido leer esta información');
      return [];
    }
    List<Category> categories =  Category.fromJsonList(response.body);
    return categories;
  }
  Future<ResponseApi> create(Category category) async {
    Response response = await post(
        '$url/create',
        category.toJson(),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': userSession.sessionToken?? ''
        }
    );
    ResponseApi responseApi = ResponseApi.fromJson(response.body);
    return responseApi;
  }

}