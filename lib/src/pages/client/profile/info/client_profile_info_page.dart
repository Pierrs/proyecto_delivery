import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proyecto/src/pages/client/profile/info/client_profile_info_controller.dart';

import '../../../../models/user.dart';
class ClientProfileInfoPage extends StatelessWidget {
  ClientProfileInfoController clientProfileInfoController = Get.put(ClientProfileInfoController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            _backgroundMainImage(context),
            _squareBox(context),
            _imageUser(context),
            _buttonSignOut()


          ],
        )
    );
  }

  Widget _squareBox(BuildContext context) {
    return Container(
      height: MediaQuery
          .of(context)
          .size
          .height * 0.4,
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
            _textName(),
            _textEmail(),
            _textPhone(),
            _buttonUpdate(context)
          ],
        ),
      ),
    );
  }

  Widget _buttonUpdate(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      child: ElevatedButton(
          onPressed: ()=> clientProfileInfoController.goToprofileUpdate() ,
          style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 18)
          ),
          child: const Text(
            'ACTUALIZAR DATOS',
            style: TextStyle(
                color: Colors.black
            ),
          )
      ),
    );
  }





  Widget _textName() {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: ListTile(
        leading: Icon(Icons.person),
        title: Text('${clientProfileInfoController.user.name ??''}${clientProfileInfoController.user.lastname?? ''}'),
        subtitle:Text('Nombre del usuario'),
      ),
    );
  }
  Widget _textEmail() {
    return ListTile(
      leading: Icon(Icons.email),
      title: Text(
          clientProfileInfoController.user.email ?? ''),
      subtitle:Text('Correo Electronico'),
    );
  }

  Widget _textPhone() {
    return ListTile(
      leading: Icon(Icons.phone),
      title: Text(
          clientProfileInfoController.user.phone ?? ''),
      subtitle:Text('Telefono'),
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
        child: CircleAvatar(
          backgroundImage:clientProfileInfoController.user.image != null
              ?NetworkImage(clientProfileInfoController.user.image!)
              :const AssetImage('assets/img/add-user.png') as ImageProvider ,
          radius: 80 ,
          backgroundColor: Colors.white,
        ),
        ),
      );
  }
  Widget _buttonSignOut(){
    return SafeArea(
        child:Container(
          margin:const EdgeInsets.only(right: 20 ) ,
          alignment: Alignment.topRight,
          child: IconButton(
            onPressed: () => clientProfileInfoController.signOut(),
            icon: const Icon(Icons.power_settings_new,
              color:Colors.white ,
              size: 30,),
          ),
        )
    );
  }


}
