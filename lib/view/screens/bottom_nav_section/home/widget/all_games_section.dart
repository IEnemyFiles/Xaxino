import 'package:flutter/material.dart';
import 'package:xaxino/core/route/route.dart';
import 'package:xaxino/core/utils/dimensions.dart';
import 'package:xaxino/core/utils/my_color.dart';
import 'package:xaxino/core/utils/my_images.dart';
import 'package:xaxino/core/utils/my_strings.dart';
import 'package:xaxino/core/utils/style.dart';
import 'package:xaxino/core/utils/url_container.dart';
import 'package:xaxino/data/controller/home/home_controller.dart';
import 'package:xaxino/view/components/image/custom_network_image.dart';
import 'package:xaxino/view/components/text-form-field/no_data_tile.dart';
import 'package:get/get.dart';

class AllGamesSection extends StatefulWidget {
  const AllGamesSection({super.key});

  @override
  State<AllGamesSection> createState() => _AllGamesSectionState();
}

class _AllGamesSectionState extends State<AllGamesSection> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        builder: (controller) => OrientationBuilder(builder: (context, orientation) {
              final mediaQuery = MediaQuery.of(context);
              final bool isPortrait = mediaQuery.orientation == Orientation.portrait;
         if (controller.gamesList.isEmpty) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Padding(
                 padding: const EdgeInsets.symmetric(horizontal:Dimensions.space10),
                 child: Text(
                    MyStrings.allGames.tr.toUpperCase(),
                    style: regularLarge.copyWith(color: MyColor.colorWhite),
                  ),
               ),
              const NoDataTile(
                title: MyStrings.noGamestoShow,
              ),
            ],
          );
        }
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal:Dimensions.space8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      MyStrings.allGames.tr.toUpperCase(),
                      style: regularLarge.copyWith(color: MyColor.colorWhite),
                    ),
                     const SizedBox(height:Dimensions.space5),
                    GridView.builder(
                      padding:const EdgeInsets.all(0),
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: isPortrait ? 2 : 4, childAspectRatio: isPortrait ? 1.4 : 1),
                        itemCount: controller.gamesList.length,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          var alias = controller.gamesList[index].alias;
                          return InkWell(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () {
                              if (alias == "head_tail") {
                                Get.toNamed(RouteHelper.headAndTailScreen);
                              }
                              if (alias == "rock_paper_scissors") {
                                Get.toNamed(RouteHelper.rockPaperScissorsScreen);
                              }
                              if (alias == "roulette") {
                                Get.toNamed(RouteHelper.rouletteScreen);
                              }
                              if (alias == "number_guess") {
                                Get.toNamed(RouteHelper.guessTheNumberScreen);
                              }
                              if (alias == "dice_rolling") {
                                Get.toNamed(RouteHelper.diceRollingScreen);
                              }
                              if (alias == "spin_wheel") {
                                Get.toNamed(RouteHelper.spinWheelScreen);
                              }
                              if (alias == "card_finding") {
                                Get.toNamed(RouteHelper.cardFindingScreen);
                              }
                              if (alias == "number_slot") {
                                Get.toNamed(RouteHelper.numberSlotScreen);
                              }
                              if (alias == "number_pool") {
                                Get.toNamed(RouteHelper.poolNumberScreen);
                              }
                              if (alias == "casino_dice") {
                                Get.toNamed(RouteHelper.playCasinoDiceScreen);
                              }
                              if (alias == "keno") {
                                Get.toNamed(RouteHelper.kenoScreen);
                              }
                              if (alias == "blackjack") {
                                Get.toNamed(RouteHelper.blackJackScreen);
                              }
                              if (alias == "poker") {
                                Get.toNamed(RouteHelper.pokerScreen);
                              }
                              if (alias == "mines") {
                                Get.toNamed(RouteHelper.minesScreen);
                              }
                            },
                            child: Container(
                              margin: const EdgeInsets.all(Dimensions.space10),
                              height: Dimensions.space10,
                              width: Dimensions.space10,
                              child: Stack(
                                children: [
                                  Container(
                                    width: Dimensions.space190,
                                    height: Dimensions.space160,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(Dimensions.space10),
                                      gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [MyColor.transparentColor, MyColor.colorBlack.withOpacity(0.5)],
                                        stops: const [0.0, 0.8],
                                      ),
                                    ),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: CustomNetworkImage(
                                          key: ValueKey(controller.gamesList[index].image),
                                          imageUrl: UrlContainer.dashboardImage + controller.gamesList[index].image.toString(),
                                          width: 200,
                                          height: 200,
                                          loaderColor: MyColor.activeIndicatorColor,
                                          placeholder: Image.asset(MyImages.placeHolderImage),
                                        )),
                                  ),
                                  Container(
                                    width: Dimensions.space190,
                                    height: Dimensions.space160,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(Dimensions.space10),
                                      gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [MyColor.transparentColor, MyColor.colorBlack.withOpacity(0.5)],
                                        stops: const [0.0, 0.8],
                                      ),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(Dimensions.space10),
                                      child: Image.asset(
                                        MyImages.blurImage,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: Dimensions.space10, horizontal: Dimensions.space12),
                                    child: Align(
                                      alignment: Alignment.bottomLeft,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(controller.gamesList[index].name.toString().tr,
                                              style: semiBoldLarge.copyWith(
                                                color: MyColor.colorWhite,
                                              )),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                  ],
                ),
              );
            }));
  }
}
