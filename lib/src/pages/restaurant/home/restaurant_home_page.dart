import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proyecto/src/pages/restaurant/categories/create/restaurant_categories_create_page.dart';
import 'package:proyecto/src/pages/restaurant/home/restaurant_home_controller.dart';
import 'package:proyecto/src/pages/restaurant/products/create/restaurant_products_create_page.dart';
import '../../../utils/custom_animated_botton_bar.dart';
import '../../client/profile/info/client_profile_info_page.dart';
import '../../delivery/oders/list/delivery_orders_list_page.dart';
import '../orders/list/restaurant_orders_list_page.dart';


class RestaurantHomePage extends StatelessWidget {
  RestaurantHomeController restaurantHomeController = Get.put(RestaurantHomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar:_bottomBar() ,
        body: Obx(()=>IndexedStack(
          index: restaurantHomeController.indexTab.value,
          children: [

            RestaurantOrdersListPage(),
            RestaurantCategoriesCreatePage(),
            RestaurantProductsCreatePage(),
            ClientProfileInfoPage()
          ],
        ))
    );
  }
  Widget _bottomBar(){
    return Obx(()=>CustomAnimatedBottomBar(
      containerHeight: 70,
      backgroundColor: Colors.red,
      showElevation:true,
      itemCornerRadius: 24,
      curve: Curves.easeIn,
      selectedIndex: restaurantHomeController.indexTab.value,
      onItemSelected: (index)=> restaurantHomeController.changeTab(index),
      items: [
        BottomNavyBarItem(
            icon: Icon(Icons.list),
            title: Text('Pedidos'),
            activeColor: Colors.white,
            inactiveColor: Colors.black
        ),
        BottomNavyBarItem(
            icon: Icon(Icons.category),
            title: Text('Categoria'),
            activeColor: Colors.white,
            inactiveColor: Colors.black
        ),
        BottomNavyBarItem(
            icon: Icon(Icons.restaurant),
            title: Text('Producto'),
            activeColor: Colors.white,
            inactiveColor: Colors.black
        ),
        BottomNavyBarItem(
            icon: Icon(Icons.person),
            title: Text('Perfil'),
            activeColor: Colors.white,
            inactiveColor: Colors.black
        ),

      ],
    ));
  }
}
