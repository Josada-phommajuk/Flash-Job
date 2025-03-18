import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:easy_localization/easy_localization.dart';
import '../data/onboardin_data.dart';
import '../widgets/navigation_button.dart';
import '../widgets/onboarding_page_widget.dart';
import '../widgets/page_indicator.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    // ดึงขนาดจอเพื่อคำนวณสัดส่วนที่เหมาะสม
    final screenHeight = MediaQuery.of(context).size.height;
    
    // Using localized data for onboarding pages
    final List<OnboardingData> _onboardingPages = [
      OnboardingData(
        title: 'onboarding_title_1'.tr(),
        description: 'onboarding_desc_1'.tr(),
        image: 'assets/images/tutoring.png',
      ),
      OnboardingData(
        title: 'onboarding_title_2'.tr(),
        description: 'onboarding_desc_2'.tr(),
        image: 'assets/images/housekeeping.png',
      ),
      OnboardingData(
        title: 'onboarding_title_3'.tr(),
        description: 'onboarding_desc_3'.tr(),
        image: 'assets/images/repairman.png',
      ),
      OnboardingData(
        title: 'onboarding_title_4'.tr(),
        description: 'onboarding_desc_4'.tr(),
        image: 'assets/images/babysitting.png',
      ),
      OnboardingData(
        title: 'onboarding_title_5'.tr(),
        description: 'onboarding_desc_5'.tr(),
        image: 'assets/images/petcare.png',
      ),
    ];

    return WillPopScope(
      onWillPop: () async {
        if (_currentPage > 0) {
          _pageController.previousPage(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeIn,
          );
          return false;
        } else {
          context.go('/getstart');
          return false;
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.only(top: 0),
            child: Column(
              children: [
                SizedBox(height: screenHeight * 0.01),
                
                Expanded(
                  flex: 8,
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: _onboardingPages.length,
                    onPageChanged: (int page) {
                      setState(() {
                        _currentPage = page;
                      });
                    },
                    itemBuilder: (context, index) {
                      return OnboardingPageWidget(
                        page: _onboardingPages[index],
                        screenHeight: screenHeight,
                      );
                    },
                  ),
                ),
                
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      PageIndicator(currentPage: _currentPage),
                      SizedBox(height: screenHeight * 0.02),
                      NavigationButton(
                        currentPage: _currentPage,
                        pageController: _pageController,
                        onLastPage: () => context.go('/login'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}