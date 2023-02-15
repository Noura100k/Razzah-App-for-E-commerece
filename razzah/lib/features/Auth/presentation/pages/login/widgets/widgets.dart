import 'package:flutter/material.dart';

class widgets{

  Widget divider(double h)
  {return Divider(height: h,color: Colors.transparent);}

  TextFormField myTextField({
      required TextEditingController currentController,
      required int maxLength,
      required bool obscureText,
      required bool enableInteractiveSelection,
      required TextInputType keyboardType,
      required String labelText,
      required Icon prefixicon,
    required Function valid}
      ) {
    return TextFormField(
      controller: currentController,
      enableIMEPersonalizedLearning: true,
      cursorColor: Colors.white,
      maxLines: 1,
      maxLength: maxLength,
      obscureText: obscureText,
      keyboardType: keyboardType,
      style: const TextStyle(color:  Colors.black,fontSize: 15,fontWeight:FontWeight.w900),
      enableInteractiveSelection: enableInteractiveSelection,
      decoration: InputDecoration(
        iconColor: Colors.black,
        prefixIcon: prefixicon,
        prefixIconColor: Colors.black,
        errorBorder:const OutlineInputBorder(
          borderSide: BorderSide(color:  Colors.red,width: 2),
        ) ,
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color:  Colors.black,width: 2),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color:  Colors.black,width: 2),
        ),focusedErrorBorder: const OutlineInputBorder(
    borderSide: BorderSide(color:  Colors.red,width: 2)),
        labelText: labelText,
        labelStyle: const TextStyle(color:  Colors.black,fontSize: 15,fontWeight:FontWeight.w900 ),
        counterText: "",
      ),
      validator:(i){
      valid.call();},
    );
  }
}