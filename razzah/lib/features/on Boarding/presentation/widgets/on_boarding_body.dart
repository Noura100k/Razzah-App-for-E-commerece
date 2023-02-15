import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:razzah/core/utils/size_config.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:razzah/features/Auth/presentation/pages/login/utils.dart';
import 'package:razzah/features/Auth/presentation/pages/login/widgets/login_view_body.dart';
import 'package:razzah/features/home/home.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({Key? key}) : super(key: key);

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      showSkipButton: true,
         showDoneButton: true,
         showNextButton: true,
          next:Container(height:40,width: 80,child:  Text('next',style: TextStyle(color: Colors.white)),
            color: Colors.black,alignment: Alignment.center, ) ,
          skip: Text('skip',style: TextStyle(color: Colors.black)),
          done:Container(height:40,width: 80,child:  Text('Done',style: TextStyle(color: Colors.white)),
         color: Colors.black,alignment: Alignment.center, ),
          onDone: (){
            Get.to(()=>auth.currentUser!=null?home(): LoginViewBody(), transition: Transition.rightToLeft, duration: Duration(milliseconds: 500));
          },
          pages: [
    PageViewModel(
        title: 'E shopping',
        body: 'Explore Saudi traditional wear',
      image: Image.asset("assets/images/page1.png", height: SizeConfig.screenHeight!/3)),
            PageViewModel(
                title: 'Delivery on the way',
                body: 'Get your order by speed delivery',
                image: Image.asset("assets/images/page2.png", height: SizeConfig.screenHeight!/3)),
            PageViewModel(
                title: 'Delivery arrived',
                body: 'Order is arrived at your place',
                image: Image.asset("assets/images/page3.png", height: SizeConfig.screenHeight!/3)),
          ],initialPage: 0,
        );
  }
}
