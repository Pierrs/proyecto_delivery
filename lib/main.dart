import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:proyecto/src/models/user.dart';
import 'package:proyecto/src/pages/home/home_page.dart';
import 'package:proyecto/src/pages/login/login_page.dart';
import 'package:proyecto/src/pages/register/register_page.dart';


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
  }


  @override
  Widget build(BuildContext context) {
    print('Usuario id: ${userSession.id}');
    return GetMaterialApp(
      title: 'Delivery Adrenalina ' ,
      debugShowCheckedModeBanner: false,
      initialRoute: userSession.id!=null? '/home': '/',
      getPages: [
        GetPage(name: '/', page:()=> LoginPage()),
        GetPage(name: '/register', page:()=> RegisterPage()),
        GetPage(name: '/home', page:()=> HomePage()),


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

