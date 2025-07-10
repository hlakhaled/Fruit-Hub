import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';
import 'package:fruit_hub/core/utils/constants/assets.dart';
import 'package:fruit_hub/core/utils/constants/styles.dart';
import 'package:fruit_hub/features/on_boarding/data/models/page_view_item_model.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({super.key, required this.pageViewItemModel});
  final PageViewItemModel pageViewItemModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: MediaQuery.sizeOf(context).height * .5,
          child: Stack(
            children: [
              Positioned.fill(
                child: SvgPicture.asset(
                  pageViewItemModel.isRow
                      ? Assets.assetsImagesBackground1
                      : Assets.assetsImagesBackground2svg,
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: SvgPicture.asset(
                  pageViewItemModel.isRow
                      ? Assets.assetsImagesFruitBasket
                      : Assets.assetsImagesPineapple,
                ),
              ),
              Visibility(
                visible: pageViewItemModel.isRow,
                child: Positioned(
                  right: 0,
                  top: 60,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Text("تخط", style: Styles.style13),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 47),
        pageViewItemModel.isRow
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(' Fruit', style: Styles.style23),
                  Text(
                    'HUB',
                    style: Styles.style23.copyWith(color: AppColors.orange500),
                  ),
                  Text(
                    ' مرحبًا بك في',
                    style: Styles.style23.copyWith(color: AppColors.gray950),
                  ),
                ],
              )
            : Text(
                pageViewItemModel.title,
                style: Styles.style23.copyWith(color: AppColors.gray950),
              ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 37, vertical: 24),
          child: Text(
            pageViewItemModel.desc,
            textAlign: TextAlign.center,
            style: Styles.style13.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.gray500,
            ),
          ),
        ),
      ],
    );
  }
}
