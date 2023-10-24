import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'register_controller.dart';
class RegisterPage extends StatelessWidget {

  RegisterController registerController = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            _backgroundMainImage(context),
            _squareBox(context),
            _imageUser(context),
            _buttonBack()


          ],
        )
    );
  }

  Widget _squareBox(BuildContext context) {
    return Container(
      height: MediaQuery
          .of(context)
          .size
          .height * 0.65,
      margin: EdgeInsets.only(top: MediaQuery
          .of(context)
          .size
          .height * 0.30, left: 50, right: 50),
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
            _textFieldName(),
            _textFieldLastName(),
            _textFieldPhone(),
            _textFielPassword(),
            _textFielConfirmPassword(),
            _buttonRegister(context)
          ],
        ),
      ),
    );
  }

  Widget _buttonRegister(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
      child: ElevatedButton(
          onPressed: ()=> registerController.register(context),
          style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 18)
          ),
          child: const Text(
            'REGISTRARSE',
            style: TextStyle(
                color: Colors.black
            ),
          )
      ),
    );
  }

  Widget _textFielPassword() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40),
      child:  TextField(
        controller: registerController.passwordController,
        keyboardType: TextInputType.text,
        obscureText: true,
        decoration: const InputDecoration(
            hintText: 'Contraseña',
            prefixIcon: Icon(Icons.lock)
        ),
      ),
    );
  }
  Widget _textFielConfirmPassword() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40),
      child:  TextField(
        controller: registerController.confirmPasswordController,
        keyboardType: TextInputType.text,
        obscureText: true,
        decoration: const InputDecoration(
            hintText: 'Confirmar Contraseña',
            prefixIcon: Icon(Icons.lock_clock_outlined)
        ),
      ),
    );
  }


  Widget _textFieldEmail() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40),
      child:  TextField(
        controller: registerController.emailController,
        keyboardType: TextInputType.emailAddress,
        decoration: const InputDecoration(
            hintText: 'Correo electronico',
            prefixIcon: Icon(Icons.email)
        ),
      ),
    );
  }
  Widget _textFieldName() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40),
      child:  TextField(
        controller: registerController.nameController,
        keyboardType: TextInputType.text,
        decoration: const InputDecoration(
            hintText: 'Nombre',
            prefixIcon: Icon(Icons.person)
        ),
      ),
    );

  }
  Widget _textFieldLastName() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40),
      child:  TextField(
        controller: registerController.lastnameController,
        keyboardType: TextInputType.text,
        decoration: const InputDecoration(
            hintText: 'Apellido',
            prefixIcon: Icon(Icons.person_2_outlined)
        ),
      ),
    );
  }
  Widget _textFieldPhone() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40),
      child:  TextField(
        controller: registerController.phoneController,
        keyboardType: TextInputType.phone,
        decoration: const InputDecoration(
            hintText: 'celular',
            prefixIcon: Icon(Icons.phone_android)
        ),
      ),
    );
  }


  Widget _sendYourInfo() {
    return Container(
      margin: const EdgeInsets.only(top: 40, bottom: 30),
      child: const Text(
        'INGRESA ESTA INFORMACIÓN ',
        style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.normal
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
  Widget _imageUser(BuildContext context){
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.only(top: 25),
        alignment: Alignment.topCenter,
        child: GestureDetector(
          onTap: ()=> registerController.showAlertDialog(context),
          child: GetBuilder<RegisterController>(
            builder:(value)=>CircleAvatar(
              backgroundImage: registerController.imageFile != null
                  ?FileImage(registerController.imageFile!)
                  :const AssetImage('assets/img/add-user.png') as ImageProvider ,
              radius: 80 ,
              backgroundColor: Colors.white,
            ),
          )
        ),
      ),
    );
  }
  Widget _buttonBack(){
    return SafeArea(
        child:Container(
          margin:const EdgeInsets.only(left: 20 ) ,
          child: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(Icons.arrow_back_ios,
            color:Colors.white ,
            size: 30,),
          ),
        )
    );
  }
}
