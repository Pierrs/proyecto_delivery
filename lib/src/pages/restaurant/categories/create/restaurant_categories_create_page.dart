import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proyecto/src/pages/restaurant/categories/create/restaurant_categories_create_controller.dart';
class RestaurantCategoriesCreatePage extends StatelessWidget {

  RestaurantCategoriesCreateController restaurantCategoriesCreateController = Get.put(RestaurantCategoriesCreateController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            _backgroundMainImage(context),
            _squareBox(context),
            _textNewCategory(context),


          ],
        )
    );
  }

  Widget _squareBox(BuildContext context) {
    return Container(
      height: MediaQuery
          .of(context)
          .size
          .height * 0.46,
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
            _textFieldName(),
            _textFieldDescription(),
            _buttonCreate(context)
          ],
        ),
      ),
    );
  }

  Widget _buttonCreate(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
      child: ElevatedButton(
          onPressed: () => restaurantCategoriesCreateController.createCategory(),
          style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 18)
          ),
          child: const Text(
            'CREAR CATEGORIA',
            style: TextStyle(
                color: Colors.black
            ),
          )
      ),
    );
  }



  Widget _textFieldName() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40),
      child: TextField(
        controller: restaurantCategoriesCreateController.nameController,
        keyboardType: TextInputType.text,
        decoration: const InputDecoration(
          hintText: 'Nombre ',
          prefixIcon: Icon(Icons.category),


        ),
      ),
    );
  }

  Widget _textFieldDescription() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      child: TextField(
        controller: restaurantCategoriesCreateController.descriptionController,
        keyboardType: TextInputType.text,
        maxLines: 4,
        decoration:  InputDecoration(
            hintText: ' Description ',
            prefixIcon: Container(
              margin:EdgeInsets.only(bottom:50 ),
              child: Icon(Icons.description)
            ),
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

  Widget _textNewCategory(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.only(top: 15),
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            Icon(Icons.category_rounded,size: 140, color: Colors.black87,),
            Text(
                'NUEVA CATEGORIA',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 23
            ),),
          ],
        )
      ),
    );
  }
}