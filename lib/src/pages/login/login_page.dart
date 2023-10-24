import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'login_controller.dart';

class LoginPage extends StatelessWidget {
  LoginController loginController = Get.put(LoginController());




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 50,
        child: _textDontHaveAccount(),
      ),
      body: Stack(
        children: [
          _backgroundMainImage(context),
          _squareBox(context),
          Column(
            children: [
              _mainImage(),
              _mainImageTitle(),
            ],
          )
        ],

      ),
    );
  }

  Widget _mainImage() {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.only(top: 2),
        alignment: Alignment.center,
        child: Image.asset(
          'assets/img/mainPage.png',
          width: 250,
          height: 250,
        ),
      ),
    );
  }

  Widget _mainImageTitle() {
    return Transform.translate(
      offset: const Offset(0, -60),
      child: const Text(
        'DELIVERY ADRENALINA',
        style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: Colors.black
        ),
      ),
    );
  }

  Widget _backgroundMainImage(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery
          .of(context)
          .size
          .height * 0.38,
      color: Colors.red,
      alignment: Alignment.topCenter,

    );
  }

  Widget _textDontHaveAccount() {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          '¿No tienes cuenta?',
          style: TextStyle(
              color: Colors.black,
              fontSize: 17
          ),
        ),
        const SizedBox(width: 7),
        GestureDetector(
          onTap:()=> loginController.goToRegisterPage() ,
          child: const Text(
            'Registrate Aquí',
            style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 17
            ),
          ),
        )
      ],
    );
  }

  Widget _squareBox(BuildContext context) {
    return Container(
      height: MediaQuery
          .of(context)
          .size
          .height * 0.45,
      margin: EdgeInsets.only(top: MediaQuery
          .of(context)
          .size
          .height * 0.33, left: 50, right: 50),
      decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black54,
                blurRadius: 15,
                offset: Offset(0, 0.75)
            )

          ]
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            _sendYourInfo(),
            _textFieldEmail(),
            _textFielPassword(),
            _buttonLogin()
          ],
        ),
      ),
    );
  }

  Widget _sendYourInfo() {
    return Container(
      margin: const EdgeInsets.only(top: 40, bottom: 40),
      child: const Text(
          'INGRESA ESTA INFORMACIÓN ',
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.normal
        ),
      ),
    );
  }

  Widget _textFieldEmail() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40),
      child:  TextField(
        controller: loginController.emailController,
        keyboardType: TextInputType.emailAddress,
        decoration: const InputDecoration(
            hintText: 'Correo electronico',
            prefixIcon: Icon(Icons.email)
        ),
      ),
    );
  }

  Widget _textFielPassword() {
    return Container(
      margin:const EdgeInsets.symmetric(horizontal: 40) ,
      child:  TextField(
        controller: loginController.passwordController,
        keyboardType: TextInputType.text,
        obscureText: true,
        decoration: const InputDecoration(
            hintText: 'Contraseña',
            prefixIcon: Icon(Icons.lock)
        ),
      ),
    );
  }

  Widget _buttonLogin() {
    return Container(
      width: double.infinity ,
      margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 30 ),
      child: ElevatedButton(
          onPressed:() => loginController.login() ,
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 18)
          ),
          child: const Text(
            'INGRESAR',
            style: TextStyle(
                color: Colors.black
            ),
          )
      ),
    );
  }
}


