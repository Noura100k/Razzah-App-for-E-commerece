import 'package:flutter/material.dart';

class favourite extends StatelessWidget{
  final List<Map<String,dynamic>> products;
  const favourite({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Favourite')
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