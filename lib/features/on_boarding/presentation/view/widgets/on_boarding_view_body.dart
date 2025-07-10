import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';
import 'package:fruit_hub/core/utils/common_widgets/custom_button.dart';
import 'package:fruit_hub/features/on_boarding/data/models/page_view_item_model.dart';

import 'package:fruit_hub/features/on_boarding/presentation/view/widgets/page_view_item.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  late final PageController _pageController;
  late int selectedPage;

  final List<PageViewItemModel> items = const [
    PageViewItemModel(
      title: "",
      desc:
          'اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.',
      isRow: true,
    ),
    PageViewItemModel(
      title: "ابحث وتسوق",
      desc:
          'نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية',
      isRow: false,
    ),
  ];
  @override
  void initState() {
    _pageController = PageController();
    selectedPage = 0;
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView(
            onPageChanged: (value) {
              setState(() {
                selectedPage = value;
              });
            },
            scrollDirection: Axis.horizontal,
            children: [
              PageViewItem(pageViewItemModel: items[0]),
              PageViewItem(pageViewItemModel: items[1]),
            ],
          ),
        ),

        PageViewDotIndicator(
          fadeEdges: true,
          currentItem: selectedPage,
          count: 2,
          unselectedColor: selectedPage == 1
              ? AppColors.green800
              : AppColors.green200,
          selectedColor: AppColors.green800,
        ),

        selectedPage == 1
            ? Padding(
                padding: const EdgeInsets.only(bottom: 43, top: 29),
                child: CustomButton(),
              )
            : SizedBox(height: 117),
      ],
    );
  }
}
