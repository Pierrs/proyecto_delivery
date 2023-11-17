import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:proyecto/src/models/product.dart';

class ClientOrdersCreateController extends GetxController{
  List<Product> selectProducts =<Product> [].obs;
  var total = 0.0.obs;
  ClientOrdersCreateController(){
    if(GetStorage().read('shopping_bag')!=null) {
      if (GetStorage().read('shopping_bag')is List<Product>) {
        var result =GetStorage().read('shopping_bag');
        selectProducts.clear();
        selectProducts.addAll(result);
      }
      else {
            var result =Product.fromJsonList(GetStorage().read('shopping_bag'));
            selectProducts.clear();
            selectProducts.addAll(result);
      }
      getTotal();
    }
  }
  void getTotal(){
    total.value = 0.0;
    selectProducts.forEach((product) {
      total.value = total.value+(product.quantity!*product.price!);
    });
  }
  void addItem(Product product){
    int index = selectProducts.indexWhere((p) => p.id==product.id);
    selectProducts.remove(product);
    product.quantity=product.quantity!+1;
    selectProducts.insert(index, product);
    GetStorage().write('shopping_bag', selectProducts);
    getTotal();
  }
  void removeItem(Product product){
    if(product.quantity!>1){
      int index = selectProducts.indexWhere((p) => p.id==product.id);
      selectProducts.remove(product);
      product.quantity=product.quantity!-1;
      selectProducts.insert(index, product);
      GetStorage().write('shopping_bag', selectProducts);
      getTotal();
    }
  }
  void deleteItem(Product product){
    selectProducts.remove(product);
    GetStorage().write('shopping_bag', selectProducts);
    getTotal();
  }
  void goToAddressList(){
    Get.toNamed('/client/address/list');
  }
}