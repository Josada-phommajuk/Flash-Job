import 'package:easy_localization/easy_localization.dart';
import 'package:flash_job/core/constants/app_colors.dart';
import 'package:flash_job/feature/presentation/pages/homescreen/widgets/featured_services.dart';
import 'package:flash_job/feature/presentation/pages/homescreen/services/service_grid.dart';
import 'package:flash_job/feature/presentation/pages/homescreen/services/services_data.dart';
import 'package:flash_job/feature/presentation/pages/homescreen/widgets/top_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Key _contentKey = UniqueKey();
  final _servicesProvider = ServicesDataProvider();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _resetPage();
  }

  void _resetPage() {
    setState(() {
      _contentKey = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    context.locale;

    return Scaffold(
      body: Container(
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
                      margin: EdgeInsets.only(top: 80),
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
    );
  }
}
