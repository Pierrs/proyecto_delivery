import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proyecto/src/models/address.dart';
import 'package:proyecto/src/pages/client/address/list/client_address_list_controller.dart';
import 'package:proyecto/src/widgets/no_data_widget.dart';
class ClientAddressListPage extends StatelessWidget {
  ClientAddressListController clientAddressListController = Get.put(ClientAddressListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _buttonNext(context),
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black
        ),
        title: Text('Direcciones',
        style: TextStyle(
          color: Colors.black
        ),),
        actions: [
          _iconAddressCreate()
        ],
      ),
      body: GetBuilder<ClientAddressListController>(
        builder: (value)=>Stack(
        children: [
          _textSelectAddress(),
          _listAddress(context)
        ],
      )),
    );
  }
  Widget _listAddress(BuildContext context){
    return Container(
      margin: EdgeInsets.only(top: 50),
      child: FutureBuilder(
        future: clientAddressListController.getAddress(),
          builder: (context,AsyncSnapshot<List<Address>>snapshot){
          if(snapshot.hasData){
            if(snapshot.data!.isNotEmpty){
              return ListView.builder(
                itemCount: snapshot.data?.length??0,
                  padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                  itemBuilder: (_, index){
                    return _radioSelectoAddress(snapshot.data![index], index);
                  }
              );
            }
            else{
              return Center(
                child: NoDataWidget(text: 'No hay direcciones',),
              );
            }
          }

          else{
            return Center(
              child: NoDataWidget(text: 'No hay direcciones',),
            );
          }
      }
      ),
    );
  }
  Widget _radioSelectoAddress(Address address, int index){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            children: [
              Radio(
                value:index,
              groupValue: clientAddressListController.radioValue.value,
                  onChanged: clientAddressListController.handleRadioValueChange,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    address.address??'',
                    style:TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold
                    ) ,
                  ),
                  Text(
                    address.neighborhood??'',
                    style:TextStyle(
                        fontSize: 12,

                    ) ,
                  )
                ],
              )
            ],
          ),
          Divider(color: Colors.grey[400],)
        ],
      ),
    );
  }

  Widget _textSelectAddress(){
    return Container(
      margin: EdgeInsets.only(top: 30, left: 30),
      child: Text(
        'Elige donde recibir tu pedido ',
        style: TextStyle(
          color: Colors.black,
          fontSize: 19,
          fontWeight: FontWeight.bold
        ),
      ),
    );
  }
  Widget _buttonNext(BuildContext context) {
    return Container(
      width: double.infinity,
      height:50 ,
      margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
      child: ElevatedButton(
          onPressed: ()=> clientAddressListController.createOrder(),
          style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 18)
          ),
          child: const Text(
            'CONTINUAR',
            style: TextStyle(
                color: Colors.black
            ),
          )
      ),
    );
  }
  Widget _iconAddressCreate(){
    return IconButton(
    onPressed:()=> clientAddressListController.goToAddresssCreate(),
    icon:Icon(
      Icons.add,
      color: Colors.black,
    )
    );
  }
}
