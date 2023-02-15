import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toast/toast.dart';
import 'package:razzah/core/utils/size_config.dart';
import 'package:razzah/features/home/home.dart';
import 'package:razzah/core/widgets/space_widget.dart';
import 'package:razzah/features/Auth/presentation/pages/login/widgets/widgets.dart';
import 'package:razzah/features/Auth/presentation/pages/login/utils.dart';

class signup extends StatelessWidget {
  final widget=widgets();
  final _email= TextEditingController();
  final _password= TextEditingController();
  final _address= TextEditingController();
  final _phone= TextEditingController();
  final _name= TextEditingController();
  final GlobalKey<FormState> _key=GlobalKey();

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return
      Scaffold(backgroundColor: Colors.white,
          body:
      SingleChildScrollView(child:
    Form(key: _key,child:
    Column(
      crossAxisAlignment:CrossAxisAlignment.center ,
      children: [
        const VerticalSpace(5),
        SizedBox(height: SizeConfig.screenHeight!/4, child: Image.asset('assets/images/image400.png')),
        const Text('Signup',style: TextStyle(fontSize: 30,fontWeight: FontWeight.w900)),
        widget.divider(10),
        const Text('Create A new Account to Login',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400)),
        widget.divider(10),
        Padding(padding: const EdgeInsets.symmetric(horizontal: 10),
            child: widget.myTextField(currentController:_email , maxLength: 30, obscureText: false, enableInteractiveSelection: false, keyboardType: TextInputType.emailAddress,
                labelText: 'Enter Your Email', prefixicon: const Icon(Icons.email_outlined), valid:() {
                  if(_email.text.isEmpty) {
                    return 'This Field Needed';
                  } else if(!_email.text.isEmail) {
                    return 'Input A valid Email Format';
                  }
                  return '';
                })),
        widget.divider(20), Padding(padding: const EdgeInsets.symmetric(horizontal: 10),
            child: widget.myTextField(currentController:_name , maxLength: 30, obscureText: false, enableInteractiveSelection: false, keyboardType: TextInputType.text,
                labelText: 'Enter Your Full name', prefixicon: const Icon(Icons.account_circle_outlined), valid:() {
                  if(_name.text.isEmpty) {
                    return 'This Field Needed';
                  } else if(_name.text.length<12) {
                    return 'Input more than 12 chars';
                  }
                  return '';
                })),
        widget.divider(20), Padding(padding: const EdgeInsets.symmetric(horizontal: 10),
            child: widget.myTextField(currentController:_phone , maxLength: 20, obscureText: false, enableInteractiveSelection: false, keyboardType: TextInputType.phone,
                labelText: 'Enter Your phone', prefixicon: const Icon(Icons.phone_android_outlined), valid:() {
                  if(_phone.text.isEmpty) {
                    return 'This Field Needed';
                  } else if(!_phone.text.isPhoneNumber) {
                    return 'Input A valid Number Format';
                  }
                  return '';
                })),
        widget.divider(20), Padding(padding: const EdgeInsets.symmetric(horizontal: 10),
            child: widget.myTextField(currentController:_address , maxLength: 30, obscureText: false, enableInteractiveSelection: false, keyboardType: TextInputType.text,
                labelText: 'Enter Your Address', prefixicon: const Icon(Icons.location_city_outlined), valid:() {
                  if(_address.text.isEmpty) {
                    return 'This Field Needed';
                  }
                  return '';
                })),
        widget.divider(20),
        Padding(padding: const EdgeInsets.symmetric(horizontal: 10),
            child: widget.myTextField(currentController:_password , maxLength: 15, obscureText: true, enableInteractiveSelection: true, keyboardType: TextInputType.visiblePassword,
                labelText: 'Enter Your Password', prefixicon: const Icon(Icons.password), valid: (){
                  if(_password.text.isEmpty) {
                    return 'This Field Needed';
                  } else if(_password.text.length < 12 ) {
                    return 'Input A valid Email Format';
                  }
                  return '';
                })),
        widget.divider(20),
        ElevatedButton(onPressed: ()async{
          if(_key.currentState!.validate() )
          { if(_address.text.isEmpty  || !_phone.text.isPhoneNumber
              || _name.text.isEmpty ){
            Toast.show('Please Enter Your completed Details',gravity:Toast.center,duration: Toast.lengthLong,textStyle: const TextStyle(color: Colors.white),
                backgroundColor: Colors.green.shade500);
           }
            else {
            try {

              final user=await auth.createUserWithEmailAndPassword(
                  email: _email.text, password: _password.text);
              firestore.collection('/users').doc(user.user!.uid).set({
                'name':_name.text,
                "email":_email.text,
                "phone":_phone.text,
                "address":_address.text
              });
              Get.offAll(()=>home());
            }on FirebaseException catch(e){
              Toast.show(e.message!,gravity:Toast.center,duration: Toast.lengthLong,textStyle: const TextStyle(color: Colors.white),
                  backgroundColor: Colors.green.shade500);
            }
          }
          }
        },  child: const Text('Signup'),style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0),)
            ,backgroundColor: Colors.green.shade500,foregroundColor: Colors.white,textStyle:
        const TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
            minimumSize: Size(MediaQuery.of(context).size.width-30, 50)),),
        widget.divider(20),
        Row(mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget> [
              const Text('Already have an account ?',style: TextStyle(color: Colors.black)),
              TextButton(onPressed: (){Get.back();},
                  child: const Text('login',style: TextStyle(color: Colors.black,
                      fontWeight: FontWeight.w900)  ))
            ])
      ],
    )   ))
      );
  }

}
