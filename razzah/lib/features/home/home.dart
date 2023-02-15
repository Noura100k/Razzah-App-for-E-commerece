import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:razzah/features/cart.dart';
import 'package:razzah/features/home/favourite.dart';
import 'package:toast/toast.dart';
import 'package:razzah/features/Auth/presentation/pages/login/utils.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:razzah/features/Auth/presentation/pages/login/widgets/login_view_body.dart';
import 'package:razzah/features/home/products.dart';

class home extends StatefulWidget{
  @override
  State<home> createState()=>_home();
}

class _home extends State<home> with TickerProviderStateMixin{
  List<Map<String,dynamic>> product=product_thoub;
  List<Map<String,dynamic>> cart=[];
  List<Map<String,dynamic>> like=[];
  int index=0;
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final c=TabController(length: 3,vsync: this,initialIndex:index );
    return Scaffold(
   appBar: AppBar(
     backgroundColor:Colors.green.shade500 ,
     foregroundColor: Colors.white,
     title:const Text( 'Home'),
     actions: [     IconButton(onPressed: ()async{
       Get.to(()=>favourite(products: like)); }, icon: const Icon(FontAwesomeIcons.heart)),
       IconButton(onPressed: ()async{
         double max=total(cart);
         Get.to(()=>Cart(products: cart, total: max)); }, icon: const Icon(Icons.remove_shopping_cart_outlined)),
       IconButton(onPressed: ()async{await auth.signOut();
         Get.to(()=>LoginViewBody()); }, icon: const Icon(Icons.logout)),

     ],bottom:  TabBar(controller: c,
     indicatorColor:  Colors.green,
     labelColor: Colors.black,
     unselectedLabelColor: Colors.black
     ,tabs: const [       Tab(child: Text('ثوب',style: TextStyle(color: Colors.white))),
       Tab(child: Text('بشت',style: TextStyle(color: Colors.white))),
       Tab(child: Text('شماخ',style: TextStyle(color: Colors.white))),
     ],onTap: (i){
       switch(i) {
    case 2:{
    index=2;
    product=product_shemakh;
    }
           break;
         case 1:
           {
             index = 1;
             product = product_besht;
           }
           break;
         case 0:
           {
             index = 0;
             product = product_thoub;
           }
           break;
         default:
       }
       setState(() {});
     },),
   ),
   body:
     SingleChildScrollView(
       child: Column(
         children:product.map((e) =>
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
                   Divider(height:MediaQuery.of(context).size.height/7),
                   Row(children: [
                     Align(alignment: Alignment.bottomRight,child:  IconButton(icon: Icon(FontAwesomeIcons.heart,color: Colors.grey.shade400),onPressed: () {
                       if (like.contains(e)) {
                         toast(context,'Added to Favourite before');
                       }else{
                         like.add(e);
                         toast(context,'Added to Favourite');
                       }
                     },)),
                     Align(alignment: Alignment.bottomRight,child:  IconButton(icon: Icon(Icons.shopping_cart_outlined,color: Colors.black),onPressed: () {
                       if (cart.contains(e)) {
                         toast(context,'Added to cart before');
                       }else{
                         cart.add(e);
                         toast(context,'Added to cart');
                       }},)),
                     Align(alignment: Alignment.bottomRight,child:  IconButton(icon: Icon(Icons.delete,color: Colors.black),onPressed: () {
                       if(cart.contains(e))
                       {cart.remove(e);
                       toast(context,'Removed from cart before');}
                       else{
                         toast(context,'Already Removed from cart');}},))
                   ],)
               ],
               ),Container(width: MediaQuery.of(context).size.width/3,
                   height:MediaQuery.of(context).size.height/4 ,
                   decoration: BoxDecoration(image:DecorationImage(image:
                   AssetImage(e['image']),fit: BoxFit.fill)) ),],)
           ,)
           )).toList() ))
 );
  }
 void toast(BuildContext context,String msg)
 {
   ToastContext().init(context);
   Toast.show(msg, gravity: Toast.bottom,
       duration: Toast.lengthLong,
       textStyle: const TextStyle(color: Colors.white),
       backgroundColor: Colors.black);
 }

double total(List<Map<String,dynamic>> Carts)
{double totaled=0;
  for(int i=0;i<Carts.length;i++)
    {
      totaled +=double.parse(Carts[i]['price']);
    }
  return totaled;
}
}