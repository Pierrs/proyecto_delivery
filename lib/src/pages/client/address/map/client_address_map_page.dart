import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:proyecto/src/pages/client/address/map/client_address_map_controller.dart';
class ClientAddressMapPage extends StatelessWidget {
  ClientAddressMapController clientAddressMapController = Get.put(ClientAddressMapController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: Text(
          'Ubica tu direccion en el mapa',
        style: TextStyle(
          color: Colors.black
        ),),
      ),
      body: Stack(
        children: [
          _googleMaps(),
          _iconMyLocation(),
          _cardAddress(),
          _buttonAccept(context)
        ],
      ),
    ));
  }
  Widget _buttonAccept(BuildContext context){
    return Container(
      alignment: Alignment.bottomCenter,
      width: double.infinity,
      margin:EdgeInsets.only(bottom: 30),
      child: ElevatedButton(
        onPressed: ()=>clientAddressMapController.selectRefPoint(context),
        child: Text('SELLECIONAR ESTE PUNTO',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30)
          ),
          padding: EdgeInsets.all(15),
        ),
      ),
    );
  }
  Widget _cardAddress(){
    return Container(
      width: double.infinity,
      alignment: Alignment.topCenter,
      margin: EdgeInsets.symmetric(vertical: 30),
      child: Card(
        color: Colors.grey[800],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),

        ),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
          child: Text(
            clientAddressMapController.addressName.value,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
      ),
    );
  }
  Widget _iconMyLocation(){
    return Container(
      margin: EdgeInsets.only(bottom: 40),
      child: Center(
        child: Image.asset('assets/img/my_location.png',
        width: 65,
        height: 65,),
      ),
    );
  }
  Widget _googleMaps(){
    return GoogleMap(
        initialCameraPosition: clientAddressMapController.initialPosition,
      mapType: MapType.normal,
      onMapCreated: clientAddressMapController.onMapCreate,
      myLocationButtonEnabled: false,
      myLocationEnabled: false,
      onCameraMove: (position){
          clientAddressMapController.initialPosition=position;
      },
      onCameraIdle: ()async{
          await clientAddressMapController.setLocationDraggableInfo();
      },
    );
  }
}
