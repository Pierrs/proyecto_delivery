
 import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:proyecto/src/pages/client/products/list/client_products_list_controller.dart';
import 'package:proyecto/src/pages/client/profile/info/client_profile_info_page.dart';
import 'package:proyecto/src/pages/delivery/oders/list/delivery_orders_list_page.dart';
import 'package:proyecto/src/pages/register/register_page.dart';
import 'package:proyecto/src/pages/restaurant/orders/list/restaurant_orders_list_page.dart';
import 'package:proyecto/src/utils/custom_animated_botton_bar.dart';
class ClientProductsListPage extends StatelessWidget {
  ClientProductsListController clientProductsController = Get.put(ClientProductsListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child:Text('CLIENT PRODUCT LIST')) ,
    );
  }

}
