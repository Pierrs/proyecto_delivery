import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:proyecto/src/models/category.dart';
import 'package:proyecto/src/pages/restaurant/products/create/restaurant_products_create_controller.dart';


class RestaurantProductsCreatePage extends StatelessWidget {

  RestaurantProductsCreateController restaurantProductsCreateController = Get.put(RestaurantProductsCreateController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(()=> Stack(
          children: [
            _backgroundMainImage(context),
            _squareBox(context),
            _textNewCategory(context),


          ],
        )),

    );
  }

  Widget _squareBox(BuildContext context) {
    return Container(
      height: MediaQuery
          .of(context)
          .size
          .height * 0.7,
      margin: EdgeInsets.only(top: MediaQuery
          .of(context)
          .size
          .height * 0.18, left: 50, right: 50),
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
            _textFieldPrice(),
            _dropDownCategories(restaurantProductsCreateController.categories),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GetBuilder<RestaurantProductsCreateController>(
                    builder: (value) => _cardImage(
                        context,
                        restaurantProductsCreateController.imageFile1,
                        1
                    ),
                  ),
                  SizedBox(width: 5,),
                  GetBuilder<RestaurantProductsCreateController>(
                    builder: (value) => _cardImage(
                        context,
                        restaurantProductsCreateController.imageFile2,
                        2
                    ),
                  ),
                  SizedBox(width: 5,),
                  GetBuilder<RestaurantProductsCreateController>(
                    builder: (value) => _cardImage(
                        context,
                        restaurantProductsCreateController.imageFile3,
                        3
                    ),
                  ),
                ],
              ),
            ),
            _buttonCreate(context)

          ],
        ),
      ),
    );
  }

  Widget _buttonCreate(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: ElevatedButton(
          onPressed: () => restaurantProductsCreateController.createProduct(context),
          style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 18)
          ),
          child: const Text(
            'CREAR PRODUCTO',
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
        controller: restaurantProductsCreateController.nameController,
        keyboardType: TextInputType.text,
        decoration: const InputDecoration(
          hintText: 'Nombre ',
          prefixIcon: Icon(Icons.category),


        ),
      ),
    );
  }
  Widget _textFieldPrice() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40),
      child: TextField(
        controller: restaurantProductsCreateController.priceController,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          hintText: 'Precio ',
          prefixIcon: Icon(Icons.attach_money),


        ),
      ),
    );
  }

  Widget _textFieldDescription() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      child: TextField(
        controller: restaurantProductsCreateController.descriptionController,
        keyboardType: TextInputType.text,
        maxLines: 3,
        decoration:  InputDecoration(
            hintText: ' Descripción',
            prefixIcon: Container(
              margin:EdgeInsets.only(bottom:40 ),
              child: Icon(Icons.description)
            ),
        ),
      ),
    );
  }
  Widget _dropDownCategories(List<Category> categories){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      margin: EdgeInsets.only(top: 15),
      child: DropdownButton(
        underline: Container(
          alignment: Alignment.centerRight,
          child: Icon(
            Icons.arrow_drop_down_circle,
            color: Colors.red,
          ),
        ),
        elevation: 3,
        isExpanded: true,
        hint: Text(
          'Selecionar categoria',
          style: TextStyle(
            fontSize: 15
          ),
        ),
        items: _dropDownItems(categories),
        value: restaurantProductsCreateController.idCategory.value==''?null:restaurantProductsCreateController.idCategory.value,
        onChanged: (option){
          print('Opcion selecionada ${option}');
          restaurantProductsCreateController.idCategory.value= option.toString();
        },
      ),
    );
  }
  List<DropdownMenuItem<String?>> _dropDownItems(List<Category> categories){
    List<DropdownMenuItem<String>> list = [];
    categories.forEach((category) {
      list.add(DropdownMenuItem(
          child: Text(category.name??''),
          value: category.id,
      ));
    });
    return list;
  }
  Widget _cardImage(BuildContext context, File? imageFile, int numberFile) {
    return GestureDetector(
        onTap: () => restaurantProductsCreateController.showAlertDialog(context, numberFile),
        child: Card(
          elevation: 4,
        child:Container(
          padding: EdgeInsets.all(2),
          height:60 ,
            width: MediaQuery.of(context).size.width * 0.18,
            child:imageFile != null?
            Image.file(
              imageFile,
              fit: BoxFit.cover,
            )
                : Image(
              image: AssetImage('assets/img/add_image.png'),
            )
        ),
      )
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
        margin: const EdgeInsets.only(top: 55),
        alignment: Alignment.topCenter,
        child:  Text(
          'NUEVA PRODUCTO',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30
          ),
        ),
      )
    );
  }
}

