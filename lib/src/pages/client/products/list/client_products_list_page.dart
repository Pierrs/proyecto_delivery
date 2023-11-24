
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proyecto/src/models/category.dart';
import 'package:proyecto/src/models/product.dart';

import 'package:proyecto/src/pages/client/products/list/client_products_list_controller.dart';
import 'package:proyecto/src/pages/client/profile/info/client_profile_info_page.dart';
import 'package:proyecto/src/pages/delivery/oders/list/delivery_orders_list_page.dart';
import 'package:proyecto/src/pages/register/register_page.dart';
import 'package:proyecto/src/pages/restaurant/orders/list/restaurant_orders_list_page.dart';
import 'package:proyecto/src/utils/custom_animated_botton_bar.dart';
import 'package:proyecto/src/widgets/no_data_widget.dart';
class ClientProductsListPage extends StatelessWidget {
  ClientProductsListController clientProductsController = Get.put(ClientProductsListController());

  @override
  Widget build(BuildContext context) {
    return Obx(()=>DefaultTabController(
      length: clientProductsController.categories.length,
      child: Scaffold(
        appBar:PreferredSize(
          preferredSize: Size.fromHeight(110),
          child: AppBar(
            flexibleSpace:Container(
              margin:EdgeInsets.only(top: 15) ,
              alignment: Alignment.topCenter,
              child: Wrap(
                direction: Axis.horizontal,
                    children: [
                      _TextFieldSearch(context),
                      _iconShoppingBag()
                    ],
                  ),
            ),
            bottom: TabBar(
              isScrollable: true,
              indicatorColor: Colors.red,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey[600],
              tabs: List<Widget>.generate(clientProductsController.categories.length, (index){
                return Tab(
                  child: Text(clientProductsController.categories[index].name??''),
                );
              }),
            ),
          ),
        ) ,
        body: TabBarView(
          children: clientProductsController.categories.map((Category category){
            return FutureBuilder(
              future:clientProductsController.getProducts(category.id??'1',clientProductsController.productName.value) ,
                builder: (context,AsyncSnapshot<List<Product>>snapshot){
                if(snapshot.hasData){
                  if(snapshot.data!.length>0){
                    return ListView.builder(
                        itemCount:snapshot.data?.length??0 ,
                        itemBuilder: (_,index){
                          return _cardProduct(context,snapshot.data![index]);
                        }
                        );
                  }
                  else{
                    return NoDataWidget(text: 'No hay producto',);
                  }
                }
                else{
                  return NoDataWidget(text: 'No hay producto',);
                }
                }
            );

          }).toList(),

        ) ,
      ),
    ));
  }

  Widget _iconShoppingBag() {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.only(left: 10),
        child: clientProductsController.items.value > 0
            ? Stack(
          children: [
            IconButton(
                onPressed: () => clientProductsController.goToOrderCreate(),
                icon: Icon(
                  Icons.shopping_bag_outlined,
                  size: 33,
                )
            ),

            Positioned(
                right: 4,
                top: 12,
                child: Container(
                  width: 16,
                  height: 16,
                  alignment: Alignment.center,
                  child: Text(
                    '${clientProductsController.items.value}',
                    style: TextStyle(
                        fontSize: 12
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(30))
                  ),
                )
            )
          ],
        )
            : IconButton(
            onPressed: () => clientProductsController.goToOrderCreate(),
            icon: Icon(
              Icons.shopping_bag_outlined,
              size: 30,
            )
        ),
      ),
    );
  }
  Widget _TextFieldSearch(BuildContext context){
    return SafeArea(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.75,
        child: TextField(
          onChanged: clientProductsController.onChangeText,
          decoration: InputDecoration(
            hintText: 'Buscar producto',
            suffixIcon: Icon(Icons.search,color: Colors.grey),
            hintStyle: TextStyle(
              fontSize: 17,
              color: Colors.grey
            ),
            fillColor: Colors.white,
            filled: true,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                color: Colors.grey
              )
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(
                    color: Colors.grey
                )
            ),
            contentPadding: EdgeInsets.all(15)

          ),
        ),
      ),
    );
  }
  Widget _cardProduct(BuildContext context,Product product){
    return GestureDetector(
      onTap: ()=>clientProductsController.modalBottomSheet(context, product),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 15,left: 20,right: 20),
            child: ListTile(
              title: Text(product.name??''),
              subtitle: Column(
                crossAxisAlignment:CrossAxisAlignment.start ,
                children: [
                  SizedBox(height:5 ),
                  Text(product.description??'',
                  maxLines:2,
                  style: TextStyle(
                    fontSize: 12
                  ),),
                  SizedBox(height:10 ),
                  Text('S/${product.price.toString()}',
                  style:TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                      ),
                  ),
                  SizedBox(height:20 ),
                ],
              ),
              trailing: Container(
                height: 70,
                width: 60,
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
              ),
            ),
          ),
          Divider(height:1,color: Colors.grey[300] ,indent: 40,endIndent:40 ,)
        ],
      ),
    );
  }

}
