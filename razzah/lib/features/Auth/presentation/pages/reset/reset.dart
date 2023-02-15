import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:razzah/features/Auth/presentation/pages/signup/signup.dart';
import 'package:toast/toast.dart';
import 'package:razzah/core/utils/size_config.dart';
import 'package:razzah/core/widgets/space_widget.dart';
import 'package:razzah/features/Auth/presentation/pages/login/widgets/widgets.dart';
import 'package:razzah/features/Auth/presentation/pages/login/utils.dart';

class reset extends StatelessWidget {
  final widget=widgets();
  final _email= TextEditingController();
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
          const Text('Resseting Password !',style: TextStyle(fontSize: 30,fontWeight: FontWeight.w900)),
          widget.divider(20),
          Padding(padding: const EdgeInsets.symmetric(horizontal: 10),
              child: widget.myTextField(currentController:_email , maxLength: 20, obscureText: false, enableInteractiveSelection: false, keyboardType: TextInputType.emailAddress,
                  labelText: 'Enter Your Email', prefixicon: const Icon(Icons.email_outlined), valid:() {
                    if(_email.text.isEmpty) {
                      return 'This Field Needed';
                    } else if(!_email.text.isEmail) {
                      return 'Input A valid Email Format';
                    }
                    return '';
                  })),
          widget.divider(20),
          ElevatedButton(onPressed: ()async{
            if(_key.currentState!.validate())
            {try {
              auth.sendPasswordResetEmail(
                  email: _email.text);
              Get.back();
              Toast.show('Password resetting Email Sent to Your Email',gravity:Toast.bottom,duration: Toast.lengthLong,textStyle: const TextStyle(color: Colors.white),
                  backgroundColor: Colors.green.shade500);
            }on FirebaseAuthException catch(e){
              Toast.show(e.message!,gravity:Toast.bottom,duration: Toast.lengthLong,textStyle: const TextStyle(color: Colors.white),
                  backgroundColor: Colors.green.shade500);
            }
            }
          },  child: const Text('Reset'),style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0),)
              ,backgroundColor: Colors.green.shade500,foregroundColor: Colors.white,textStyle:
          const TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
              minimumSize: Size(MediaQuery.of(context).size.width-30, 50)),)
        ],
      )   ))
      );
  }
}
