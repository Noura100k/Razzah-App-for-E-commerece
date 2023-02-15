import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:razzah/features/on%20Boarding/presentation/on_boarding_view.dart';
import 'package:razzah/core/utils/size_config.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({Key? key}) : super(key: key);

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> with SingleTickerProviderStateMixin{
 AnimationController? animationController;
 Animation? fadingAnimation;

 @override
  void initState() {
    super.initState();
    animationController= AnimationController(vsync: this, duration: Duration(seconds: 2));
    fadingAnimation= Tween<double>(begin: .3, end: 1).animate(animationController!);

    animationController?.repeat(reverse: true);

    goToNextView();
  }

  @override
  void dispose() {
   animationController?.dispose();
   super.dispose();
  }

  @override
  Widget build(BuildContext context) {
   SizeConfig().init(context);
    return Container(
      child: Column(
        children: [
          Spacer(),
          AnimatedBuilder(
            animation: fadingAnimation!,
            builder: (context, _) => Opacity(
              opacity: fadingAnimation?.value,
              child: Text('Razzah',
                style: TextStyle(
                  fontFamily: 'RobotoMono',
                  fontSize: 51,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Spacer(),
          Center(child: Image.asset('assets/images/logo.png',
          height: 350,
          width: 350,)),
          ],
        ),
      );
  }

  void goToNextView()
  {
    Future.delayed(Duration(seconds: 3), () {
      Get.to(()=>OnBoardingView(), transition: Transition.fade);
    });
  }
}
