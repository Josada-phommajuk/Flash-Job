import 'package:easy_localization/easy_localization.dart';
import 'package:flash_job/core/constants/app_colors.dart';
import 'package:flash_job/feature/presentation/pages/homescreen/widgets/featured_services.dart';
import 'package:flash_job/feature/presentation/pages/homescreen/services/service_grid.dart';
import 'package:flash_job/feature/presentation/pages/homescreen/services/services_data.dart';
import 'package:flash_job/feature/presentation/pages/homescreen/widgets/top_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Key _contentKey = UniqueKey();
  final _servicesProvider = ServicesDataProvider();
  
  // Interstitial Ad instance
  InterstitialAd? _interstitialAd;
  bool _isInterstitialAdLoaded = false;

  // Banner Ad instance
  BannerAd? _bannerAd;
  bool _isBannerAdReady = false;
  bool _showBannerAd = false;

  // Ad timer constants
  static const String lastAdShowTimeKey = 'last_ad_show_time';
  static const int adIntervalInMinutes = 3;

  @override
  void initState() {
    super.initState();
    // Initialize Mobile Ads SDK and show interstitial ad
    _initGoogleMobileAdsAndShowAdIfNeeded();
  }
  
  Future<void> _initGoogleMobileAdsAndShowAdIfNeeded() async {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // Initialize ads
      await MobileAds.instance.initialize();
      
      // Check if we should show an ad based on timer
      bool shouldShowAd = await _shouldShowAd();
      if (shouldShowAd) {
        _loadInterstitialAd();
      } else {
        // If not showing interstitial, load banner ad
        _loadBannerAd();
      }
    });
  }

  Future<bool> _shouldShowAd() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? lastShowTime = prefs.getInt(lastAdShowTimeKey);
    
    // If first time or no record, show ad
    if (lastShowTime == null) {
      return true;
    }
    
    // Calculate time difference in minutes
    DateTime lastTime = DateTime.fromMillisecondsSinceEpoch(lastShowTime);
    DateTime now = DateTime.now();
    int differenceInMinutes = now.difference(lastTime).inMinutes;
    
    // Check if enough time has passed
    return differenceInMinutes >= adIntervalInMinutes;
  }
  
  Future<void> _updateLastAdShowTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(lastAdShowTimeKey, DateTime.now().millisecondsSinceEpoch);
  }

  void _loadInterstitialAd() {
    InterstitialAd.load(
      adUnitId: 'ca-app-pub-3940256099942544/1033173712', // Replace with your Ad Unit ID (this is test ID)
      request: AdRequest(
        nonPersonalizedAds: true,
      ),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          _interstitialAd = ad;
          _isInterstitialAdLoaded = true;
          
          // Show the ad as soon as it's loaded
          _showInterstitialAd();
          
          // Set callback for ad closing
          _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (ad) {
              ad.dispose();
              // When interstitial ad is closed, load and show banner ad
              setState(() {
                _showBannerAd = true;
              });
              _loadBannerAd();
            },
            onAdFailedToShowFullScreenContent: (ad, error) {
              ad.dispose();
              // If interstitial ad fails, load banner ad
              _loadBannerAd();
            },
          );
        },
        onAdFailedToLoad: (LoadAdError error) {
          debugPrint('InterstitialAd failed to load: $error');
          // If interstitial ad fails to load, load banner ad
          _loadBannerAd();
        },
      ),
    );
  }

  void _showInterstitialAd() async {
    if (_interstitialAd != null && _isInterstitialAdLoaded) {
      // Update the timestamp when ad is shown
      await _updateLastAdShowTime();
      
      // Show the ad
      _interstitialAd!.show();
      _isInterstitialAdLoaded = false;
    }
  }

  void _loadBannerAd() {
    _bannerAd = BannerAd(
      adUnitId: 'ca-app-pub-3940256099942544/6300978111', // Replace with your actual Banner Ad Unit ID
      request: AdRequest(nonPersonalizedAds: true),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (_) {
          setState(() {
            _isBannerAdReady = true;
          });
        },
        onAdFailedToLoad: (ad, err) {
          debugPrint('Failed to load a banner ad: ${err.message}');
          ad.dispose();
        },
      ),
    );

    _bannerAd?.load();
  }

  @override
  void dispose() {
    _interstitialAd?.dispose();
    _bannerAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.locale;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            key: _contentKey,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.center,
                colors: AppColors.primaryGradientColors,
                stops: AppColors.primaryGradientStops,
              ),
            ),
            child: SafeArea(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    TopBar(),
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 80, bottom: _showBannerAd && _isBannerAdReady ? 50 : 0),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.blackWithOpacity.withOpacity(0.1),
                                blurRadius: 10,
                                offset: Offset(0, -5),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 80),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0,
                                  vertical: 8.0,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'service'.tr(),
                                      style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              ServiceGrid(
                                services: _servicesProvider.getHomeServicesData(
                                  context,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0,
                                  vertical: 8.0,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'promotion'.tr(),
                                      style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              FeaturedServices(
                                featuredServices: _servicesProvider
                                    .getFeaturedServicesData(context),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          child: Center(
                            child: Image.asset(
                              'assets/images/car.png',
                              height: 160,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          
          // Banner Ad positioned at the bottom
          if (_showBannerAd && _isBannerAdReady)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                width: _bannerAd!.size.width.toDouble(),
                height: _bannerAd!.size.height.toDouble(),
                child: AdWidget(ad: _bannerAd!),
              ),
            ),
        ],
      ),
    );
  }
}