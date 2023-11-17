import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proyecto/src/models/product.dart';
import 'package:proyecto/src/pages/client/orders/create/client_orders_create_controller.dart';
import 'package:proyecto/src/widgets/no_data_widget.dart';
class ClientOrdersCreatePage extends StatelessWidget {
  ClientOrdersCreateController clientOrdersCreateController = Get.put(ClientOrdersCreateController());

  @override
  Widget build(BuildContext context) {
    return Obx(()=>Scaffold(
      bottomNavigationBar:  Container(
        color: Color.fromRGBO(245, 245, 245, 1),
        height: 100,
        child:_totalToPay(context) ,
      ),
      appBar:AppBar(
        iconTheme: IconThemeData(
          color: Colors.black
        ),
        title: Text('Mi Orden',
          style: TextStyle(
            color: Colors.black
          ),
        ),
      ) ,
      body:clientOrdersCreateController.selectProducts.length>0?
      ListView(
        children: clientOrdersCreateController.selectProducts.map((Product product){
          return _cardProduct(product);
        }).toList(),
      )
      :NoDataWidget(text: 'No hay ningun producto agregado aún',),
      ));
  }
  Widget _buttonsAddOrRemove(Product product){
    return Row(
      children: [
        GestureDetector(
          onTap: ()=>clientOrdersCreateController.removeItem(product),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12,vertical: 7),
            decoration: BoxDecoration(
                color: Colors.grey[200],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                bottomLeft: Radius.circular(8)
              )
            ),
            child: Text('-'),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12,vertical: 7),
          color: Colors.grey[200],
          child: Text('${product.quantity??0}'),
        ),
        GestureDetector(
          onTap: ()=>clientOrdersCreateController.addItem(product),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12,vertical: 7),
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(8),
                    bottomRight: Radius.circular(8)
                )
            ),

            child: Text('+'),
          ),
        ),
      ],
    );
  }
  Widget _cardProduct(Product product){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      child: Row(
        children: [
          _imageProduct(product),
          SizedBox(width: 15),
          Column(
            children: [
              Text(
                product.name??'',
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 7),
              _buttonsAddOrRemove(product),



            ],
          ),
          Spacer(),
          Column(
            children: [
              _textPrice(product),
              _iconDelete(product),
            ],
          )
        ],
      ),
    );
  }
  Widget _totalToPay(BuildContext context){
    return Column(
      children: [
        Divider(height: 1,color: Colors.grey[400]),
        Container(
          margin: EdgeInsets.only(left: 20,top: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  'Total: S/${clientOrdersCreateController.total.value}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30),
                child: ElevatedButton(
                    onPressed: ()=>clientOrdersCreateController.goToAddressList(),
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(15)
                    ),
                    child: Text(
                      'CONFIRMAR ORDEN',
                      style:TextStyle(
                          color: Colors.black
                      ) ,
                    )),
              )
            ],
          ),
        )

      ],
    );
  }
  Widget _iconDelete(Product product){
    return IconButton(
        onPressed: ()=> clientOrdersCreateController.deleteItem(product),
        icon: Icon(
          Icons.delete,
          color: Colors.red,
        )
    );
  }
  Widget _textPrice(Product product){
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Text(
        'S/${product.price!*product.quantity!}',
        style: TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.bold
        ),
      ),
    );
  }

  Widget _imageProduct(Product product){
    return Container(
      height: 70,
      width: 70,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: FadeInImage(
          image: product.image1!=null
              ?NetworkImage(product.image1!)
              :AssetImage('assets/img/no-image.png')as ImageProvider ,
          fit: BoxFit.cover,
          fadeInDuration: Duration(milliseconds: 50),
          placeholder: AssetImage('assets/img/no-image.png'),

        ),
      ),
    );
  }
}
