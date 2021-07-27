import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pokedex/presentation/pages/home/home_controller.dart';
import 'package:pokedex/presentation/pages/home/widgets/pokemon_list_tile.dart';
import 'package:pokedex/presentation/themes/text_field_theme.dart';
import 'package:pokedex/presentation/themes/text_themes.dart';
import 'package:pokedex/presentation/utils/constants/app_assets.dart';
import 'package:pokedex/presentation/utils/constants/app_colors.dart';
import 'package:pokedex/presentation/utils/constants/app_strings.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.kBackGroundColor,
      body: SafeArea(child: HomeBody()),
    );
  }
}

class HomeBody extends GetView<HomeController> {
  void callControllerSearchPokemon() async {
    if (controller.pokemonToSearch != "") {
      final succefulResult = await controller.callSerchPokemon();
      if (!succefulResult) {
        Get.snackbar("Pokemon", "Couldn't find the pokemon",
            colorText: AppColors.kWhiteAccentColor,
            snackPosition: SnackPosition.TOP,
            backgroundColor: AppColors.kErrorColor);
      }
    } else {
      Get.snackbar("Pokemon", "Please enter a valid pokemon name or number",
          colorText: AppColors.kWhiteAccentColor,
          snackPosition: SnackPosition.TOP,
          backgroundColor: AppColors.kErrorColor);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 1,
            child: Hero(
              tag: AppStrings.kLogoHeroAnimation,
              child: SvgPicture.asset(
                AppAssets.kMainLogo,
                color: AppColors.kWhiteAccentColor,
                height: Get.height / 16,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                controller: controller.textEditingController,
                decoration: AppInputDecoration.kSearchInputDecoration.copyWith(
                    suffixIcon: GestureDetector(
                  onTap: () => callControllerSearchPokemon(),
                  child: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.grey,
                  ),
                )),
                style:
                    AppTextThemes.kBodyTextStyle.copyWith(color: Colors.black),
                onChanged: (newValue) =>
                    controller.changePokemonToSearch(newValue),
                onSubmitted: (value) => callControllerSearchPokemon(),
              ),
            ),
          ),
          Expanded(
            flex: 7,
            child: GetX<HomeController>(
              builder: (controller) => controller.pokemonList.length == 0
                  ? Center(
                      child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          AppAssets.kMainLogo,
                          width: Get.width / 3,
                          color: AppColors.kWhiteAccentColor,
                        ),
                        SizedBox(
                          height: 16.0,
                        ),
                        Text(
                          "No Pokemon Found",
                          style: AppTextThemes.kBodyTextStyle,
                        ),
                      ],
                    ))
                  : GridView.builder(
                      shrinkWrap: true,
                      controller: controller.listController,
                      itemCount: controller.pokemonList.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 3.0,
                      ),
                      itemBuilder: (BuildContext context, int index) =>
                          PokemonListTile(
                              index: index,
                              pokemonResource: controller.pokemonList[index]),
                    ),
            ),
          ),
        ],
      ),
      GetX<HomeController>(
          builder: (controller) => controller.isItLoading.value
              ? Container(
                  color: Colors.black45,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : SizedBox()),
    ]);
  }
}
