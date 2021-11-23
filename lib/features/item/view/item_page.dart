import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:whole_snack/core/constants/default_values.dart';
import 'package:whole_snack/core/model/temp_model/temp_addtocart_model.dart';
import 'package:whole_snack/core/model/temp_model/temp_item_package_model.dart';
import 'package:whole_snack/core/widgets/appbar/build_horizontal_items.dart';
import 'package:whole_snack/core/widgets/build_custom_button.dart';
import 'package:whole_snack/features/cart/controller/cart_controller.dart';
import 'package:whole_snack/features/feature_main/controller/feature_main_controller.dart';

import 'build_item_banner_design.dart';
import 'build_item_packages_detail.dart';

class ItemPage extends StatelessWidget {
  const ItemPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    CartController mCartController = Get.find<CartController>();
    FeatureMainController mFeatureController = Get.find<FeatureMainController>();


    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              BuildItemBannerDesign(),
              Expanded(
                child: Container(
                  width: double.infinity,
                  child: ListView(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    children: [
                      SizedBox(
                        height: kDefaultMargin.sp,
                      ),
                      Container(
                        width: double.infinity,
                        color: Colors.white,
                        padding: EdgeInsets.only(
                            left: kDefaultMargin.sp,
                            right: kDefaultMargin.sp,
                            top: kDefaultMargin.sp),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: kDefaultMargin.sp,
                            ),
                            Text(
                              "Dan Vanilla Layer Cake",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: kLargeFontSize14.sp,
                                  fontWeight: FontWeight.w900),
                            ),
                            SizedBox(
                              height: 4.sp,
                            ),
                            Text(
                              "Snack Cake&Pie",
                              style: TextStyle(fontSize: kMediumFontSize12.sp),
                            ),
                            SizedBox(
                              height: kDefaultMargin.sp + 10.sp,
                            ),
                            BuildItemPackagesDetail(),
                            SizedBox(
                              height: kDefaultMargin.sp + 10.sp,
                            ),
                            BuildCustomButton(
                              action: () {

                                mCartController.addNewCart(TempAddToCartModel(
                                  "https://dl.dropbox.com/s/2mua2ebuxuyiqan/apolo.jpeg?dl=0",
                                  "Dan Vanilla Layer Cake",
                                  "1 pc - Ks.100",
                                  TempItemPackageModel("3pcs", "250"),
                                  1,
                                ));

                              },
                              haveCorner: false,
                              title: "Add to Cart",
                            ),
                            SizedBox(
                              height: kDefaultMargin.sp + 10.sp,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: kDefaultMargin.sp,
                      ),
                      BuildHorizontalItems(
                        title: "Similar Items",
                        haveSeeMore: false,
                      ),
                      SizedBox(
                        height: GetPlatform.isIOS
                            ? kBottomNavigationBarHeight +
                                kDefaultMargin +
                                kDefaultMargin +
                                kDefaultMargin
                            : kBottomNavigationBarHeight + kDefaultMargin,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: (){
              mFeatureController.changeIndex(2);
              Get.offAndToNamed("/");
            },
            child: Padding(
              padding: EdgeInsets.only(bottom: 0.sp),
              child: Positioned.fill(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: double.infinity,
                    color: Theme.of(context).primaryColor,
                    height: GetPlatform.isIOS
                        ? kBottomNavigationBarHeight +
                            kDefaultMargin +
                            kDefaultMargin
                        : kBottomNavigationBarHeight,
                    padding: EdgeInsets.only(
                        left: kDefaultMargin + kDefaultMargin,
                        right: kDefaultMargin + kDefaultMargin),
                    child: Center(
                      child: Row(
                        children: [
                          Text(
                            "Total in cart",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: kExtraLargeFontSize16),
                          ),
                          SizedBox(
                            width: kDefaultMargin,
                          ),
                          Container(
                            width: 20.sp,
                            height: 20.sp,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            child: Center(
                              child: Obx((){
                                return Text(
                                  "${mCartController.mAddToCartList.length}",
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: kMediumFontSize12),
                                );
                              })
                            ),
                          ),
                          Spacer(),
                          Obx((){
                            return Text(
                              "Ks ${mCartController.totalPrice}",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: kExtraLargeFontSize16),
                            );
                          })
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
