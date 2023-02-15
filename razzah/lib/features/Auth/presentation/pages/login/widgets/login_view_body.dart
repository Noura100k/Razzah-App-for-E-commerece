import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:razzah/features/Auth/presentation/pages/reset/reset.dart';
import 'package:razzah/features/Auth/presentation/pages/signup/signup.dart';
import 'package:razzah/features/home/home.dart';
import 'package:toast/toast.dart';
import 'package:razzah/core/utils/size_config.dart';
import 'package:razzah/core/widgets/space_widget.dart';
import 'package:razzah/features/Auth/presentation/pages/login/widgets/widgets.dart';
import 'package:razzah/features/Auth/presentation/pages/login/utils.dart';

class LoginViewBody extends StatelessWidget {
  final widget=widgets();
  final _email= TextEditingController();
  final _password= TextEditingController();
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
         const Text('Welcome To Razzah !',style: TextStyle(fontSize: 30,fontWeight: FontWeight.w900)),
          widget.divider(10),
        const Text('Please Login To Continue',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400)),
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
        widget.divider(20),
        Padding(padding: const EdgeInsets.symmetric(horizontal: 10),
            child: widget.myTextField(currentController:_password , maxLength: 30, obscureText: true, enableInteractiveSelection: true, keyboardType: TextInputType.visiblePassword,
                labelText: 'Enter Your Password', prefixicon: const Icon(Icons.password), valid: (){
                  if(_password.text.isEmpty) {
                    return 'This Field Needed';
                  } else if(_password.text.length < 12 ) {
                    return 'Input A valid Email Format';
                  }
                  return '';
                })),
        widget.divider(10)
        ,Align(alignment: Alignment.centerRight,child: TextButton(onPressed: (){
          Get.to(()=>reset());
        },child: Text('Forget Password ?',style: TextStyle(color: Colors.black)))),
        widget.divider(20),
       ElevatedButton(onPressed: ()async{
         if(_key.currentState!.validate())
           {try {
            await auth.signInWithEmailAndPassword(
                 email: _email.text, password: _password.text);
             Get.offAll(()=>home());
           }on FirebaseAuthException catch(e){
             Toast.show(e.message!,gravity:Toast.bottom,duration: Toast.lengthLong,textStyle: const TextStyle(color: Colors.white),
             backgroundColor: Colors.green.shade500);
           }
           }
       },  child: const Text('Login'),style: ElevatedButton.styleFrom(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0),)
    ,backgroundColor: Colors.green.shade500,foregroundColor: Colors.white,textStyle:
    const TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
    minimumSize: Size(MediaQuery.of(context).size.width-30, 50)),),
    widget.divider(20),
    Row(mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget> [
    const Text('Don’t have an account ?',style: TextStyle(color: Colors.black)),
    TextButton(onPressed: (){Get.to(()=>signup());},
    child: const Text('Signup',style: TextStyle(color: Colors.black,
    fontWeight: FontWeight.w900)  ))
    ])
      ],
    )   ))
      );
  }

}
