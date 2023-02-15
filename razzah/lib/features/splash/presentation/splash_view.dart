import 'package:flutter/material.dart';
import 'package:razzah/core/widgets/constants.dart';
import 'package:razzah/features/splash/presentation/widgets/splash_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainColor,
      body: SplashViewBody(),
    );
  }
}
