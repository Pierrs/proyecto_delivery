
 import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:proyecto/src/pages/client/products/list/client_products_list_controller.dart';
import 'package:proyecto/src/pages/client/profile/info/client_profile_info_page.dart';
import 'package:proyecto/src/pages/delivery/oders/list/delivery_orders_list_page.dart';
import 'package:proyecto/src/pages/register/register_page.dart';
import 'package:proyecto/src/pages/restaurant/orders/list/restaurant_orders_list_page.dart';
import 'package:proyecto/src/utils/custom_animated_botton_bar.dart';
class ClientProductsListPage extends StatelessWidget {
  ClientProductsController clientProductsController = Get.put(ClientProductsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:_bottomBar() ,
      body: Obx(()=>IndexedStack(
        index: clientProductsController.indexTab.value,
        children: [
          RestaurantOrdersListPage(),
          DeliveryOrdersListPage(),
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
      selectedIndex: clientProductsController.indexTab.value,
      onItemSelected: (index)=> clientProductsController.changeTab(index),
      items: [
        BottomNavyBarItem(
                icon: Icon(Icons.apps),
                title: Text('Home'),
                activeColor: Colors.white,
                inactiveColor: Colors.black
        ),
        BottomNavyBarItem(
            icon: Icon(Icons.list),
            title: Text('Mis pedidos'),
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
