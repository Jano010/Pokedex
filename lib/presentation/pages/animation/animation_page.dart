import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pokedex/presentation/pages/animation/animation_controller.dart';
import 'package:pokedex/presentation/utils/constants/app_assets.dart';
import 'package:pokedex/presentation/utils/constants/app_colors.dart';
import 'package:pokedex/presentation/utils/constants/app_strings.dart';

class AnimationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBackGroundColor,
      body: AnimationBody(),
    );
  }
}

class AnimationBody extends GetView<AnimationPageController> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RotationTransition(
        turns: controller.animation,
        child: Hero(
            tag: AppStrings.kLogoHeroAnimation,
            child: SvgPicture.asset(
              AppAssets.kMainLogo,
              color: AppColors.kWhiteAccentColor,
              width: Get.width / 3,
            )),
      ),
    );
  }
}
