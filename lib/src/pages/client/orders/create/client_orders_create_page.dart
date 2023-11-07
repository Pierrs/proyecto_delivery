import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proyecto/src/pages/client/orders/create/client_orders_create_controller.dart';
class ClientOrdersCreatePage extends StatelessWidget {
  ClientOrdersCreateController clientOrdersCreateController = Get.put(ClientOrdersCreateController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('ClientOrdersCreatePage'),

      ),
    );
  }
}
