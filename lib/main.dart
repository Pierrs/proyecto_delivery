import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:proyecto/src/models/user.dart';
import 'package:proyecto/src/pages/client/home/client_home_page.dart';
import 'package:proyecto/src/pages/client/products/list/client_products_list_page.dart';
import 'package:proyecto/src/pages/client/profile/info/client_profile_info_page.dart';
import 'package:proyecto/src/pages/client/profile/update/client_profile_update_page.dart';
import 'package:proyecto/src/pages/delivery/oders/list/delivery_orders_list_page.dart';
import 'package:proyecto/src/pages/home/home_page.dart';
import 'package:proyecto/src/pages/login/login_page.dart';
import 'package:proyecto/src/pages/register/register_page.dart';
import 'package:proyecto/src/pages/restaurant/home/restaurant_home_page.dart';
import 'package:proyecto/src/pages/restaurant/orders/list/restaurant_orders_list_page.dart';
import 'package:proyecto/src/pages/roles/roles_page.dart';


User userSession = User.fromJson(GetStorage().read('user')??{});
void main() async{
  await GetStorage.init();
  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp ({super.key});

  @override
  State<MyApp > createState() => _MyAppState();
}

class _MyAppState extends State<MyApp > {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('EL TOKEN DE SESION DEL USUARIO: ${userSession.sessionToken}');
  }


  @override
  Widget build(BuildContext context) {
    print('Usuario id: ${userSession.id}');
    return GetMaterialApp(
      title: 'Delivery Adrenalina ' ,
      debugShowCheckedModeBanner: false,
      initialRoute: userSession.id!=null? userSession.roles!.length>1 ? '/roles': '/client/home': '/',
      getPages: [
        GetPage(name: '/', page:()=> LoginPage()),
        GetPage(name: '/register', page:()=> RegisterPage()),
        GetPage(name: '/home', page:()=> HomePage()),
        GetPage(name: '/roles', page:()=> RolesPage()),
        GetPage(name: '/restaurant/home', page:()=> RestaurantHomePage()),
        GetPage(name: '/restaurant/orders/list', page:()=> RestaurantOrdersListPage()),
        GetPage(name: '/delivery/orders/list', page:()=> DeliveryOrdersListPage()),
        GetPage(name: '/client/home', page:()=> ClientHomePage()),
        GetPage(name: '/client/products/list', page:()=> ClientProductsListPage()),
        GetPage(name: '/client/profile/info', page:()=> ClientProfileInfoPage()),
        GetPage(name: '/client/profile/update', page:()=> ClientProfileUpdaPage()),


      ],
      theme: ThemeData(
        primaryColor: Colors.red,
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          secondary: Colors.redAccent,
          primary: Colors.red,
          onBackground: Colors.grey,
          onPrimary: Colors.grey,
          surface: Colors.grey,
          onSurface: Colors.grey,
          error: Colors.grey,
          onError:Colors.grey,
          onSecondary: Colors.grey,
          background: Colors.grey,


        ),

      ) ,
      navigatorKey:Get.key,
    );
  }
}

