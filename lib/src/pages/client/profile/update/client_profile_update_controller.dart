
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sn_progress_dialog/sn_progress_dialog.dart';

import '../../../../models/user.dart';

class ClientProfileUpdateController extends GetxController{

  User user =  User.fromJson(GetStorage().read('user'));
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  ImagePicker picker = ImagePicker();
  File? imageFile;

  Future selectImage(imageSource) async{
    XFile? image = await picker.pickImage(source: imageSource );
    if(image != null){
      imageFile = File(image.path);
      update();
    }
  }
  ClientProfileUpdateController(){
    nameController.text = user.name ?? '';
    lastnameController.text = user.lastname ?? '';
    phoneController.text = user.phone ?? '';
  }

  void showAlertDialog(BuildContext context){


    Widget galleryButton=ElevatedButton(
        onPressed: (){
          Get.back();
          selectImage(ImageSource.gallery);
        },
        child: Text(
          'GALERIA',
          style:TextStyle(
              color: Colors.black
          ),
        )
    );
    Widget cameraButton=ElevatedButton(
        onPressed: (){
          Get.back();
          selectImage(ImageSource.camera);
        },
        child: Text('Camara',
          style:TextStyle(
              color: Colors.black
          ),)
    );
    AlertDialog alertDialog = AlertDialog(
      title: Text('Selecciona una opcion'),
      actions: [
        galleryButton,
        cameraButton
      ],
    );
    showDialog(context: context, builder: (BuildContext context){
      return alertDialog;
    });
  }
  bool isValidForm(
      String email,
      String name,
      String lastname,
      String phone,
      String password
      ){


    if(email.isEmpty){
      Get.snackbar('Formulario no valido', 'Debes ingresar el email.');
      return false;
    }
    if(!GetUtils.isEmail(email)){
      Get.snackbar('Formulario no valido', 'El email no es valido.');
      return false;
    }
    if(name.isEmpty){
      Get.snackbar('Formulario no valido', 'Debes ingresar tu nombre.');
      return false;
    }
    if(lastname.isEmpty){
      Get.snackbar('Formulario no valido', 'Debes ingresar tu apellido.');
      return false;
    }
    if(phone.isEmpty){
      Get.snackbar('Formulario no valido', 'Debes ingresar tu numero de celular.');
      return false;
    }
    if(password.isEmpty){
      Get.snackbar('Formulario no valido', 'Debes ingresar el password.');
    }
    return true;
  }
  Future<void> updateInfo(BuildContext context) async {
    String email = emailController.text.trim();
    String name = nameController.text;
    String lastname = lastnameController.text;
    String phone = phoneController.text;
    String password = passwordController.text.trim();


    if (isValidForm(email, name, lastname, phone, password)) {
      ProgressDialog progressDialog = ProgressDialog(context: context);
      progressDialog.show(max: 100, msg: 'Actualizando datos...');


      User myUser = User(
        id: user.id,
        email: user.email,
        name: name,
        lastname: lastname,
        phone: phone,
        password: user.password,
      );
    }
  }
}