
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:proyecto/src/pages/delivery/oders/list/delivery_orders_list_controller.dart';
class DeliveryOrdersListPage extends StatelessWidget {
  DeliveryOrdersListController deliveryOrdersListController = Get.put(DeliveryOrdersListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Delivery Orders List'),
      ),
    );
  }
}
