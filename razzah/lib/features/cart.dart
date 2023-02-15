import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:razzah/features/Auth/presentation/pages/login/utils.dart';
import 'package:razzah/features/home/home.dart';
import 'package:toast/toast.dart';

class Cart extends StatelessWidget{
 final List<Map<String,dynamic>> products;
 final double total;
  const Cart({Key? key, required this.products, required this.total}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.green,
      title: const Text('Cart'),
      actions: [
        Center(child:Text('$total  Dollar')),
        TextButton(onPressed: ()async{
          await firestore.collection('/orders').add({
            'user':auth.currentUser!.uid.toString(),
            'total':total.toString(),
            'order':products.toString(),
            "time":DateTime.now().toString()
          });
          products.clear();
            Toast.show('Order Saved',gravity:Toast.bottom,duration: Toast.lengthLong,textStyle: const TextStyle(color: Colors.white),
              backgroundColor: Colors.black);
          Get.to(()=>home());
        },child: Text('OK',style: TextStyle(color: Colors.white)) ),
      ],
    ),
    body:  SingleChildScrollView(
        child: Column(
            children:products.map((e) =>
                GestureDetector(
                    onLongPress: (){},
                    onTap: (){},
                    child:Container(
                      margin: const EdgeInsets.symmetric(vertical: 20,horizontal: 10),
                      padding:  const EdgeInsets.all(5),
                      decoration:BoxDecoration(border:Border.all(color: Colors.white,width: 1),
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [BoxShadow(
                            color: Colors.grey.shade400,
                            blurRadius: 10,
                            spreadRadius: 0.02,
                            offset: const Offset(0.1,0.1)
                        )],               color: Colors.white,) ,
                      child:Row(crossAxisAlignment:CrossAxisAlignment.start ,
                        mainAxisAlignment:MainAxisAlignment.spaceBetween ,
                        children: [  Column(
                          mainAxisAlignment:MainAxisAlignment.start ,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(alignment: Alignment.topRight,child:  Text(e['title'],style: const TextStyle(color: Colors.black),)),
                            const Align(alignment: Alignment.topRight,child: Text('___________________',style:TextStyle(color: Colors.black,fontWeight: FontWeight.w400))),
                            Align(alignment: Alignment.topRight,child:  Text('السعر ${e['price']} ريال',style: const TextStyle(color: Colors.black),)),
                          ],
                        ),Container(width: MediaQuery.of(context).size.width/3,
                            height:MediaQuery.of(context).size.height/4 ,
                            decoration: BoxDecoration(image:DecorationImage(image:
                            AssetImage(e['image']),fit: BoxFit.fill)) ),],)
                      ,)
                )).toList() )),
  );

  }

}