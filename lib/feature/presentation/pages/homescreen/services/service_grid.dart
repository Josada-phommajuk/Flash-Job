

// Updated ServiceGrid class
import 'package:easy_localization/easy_localization.dart';
import 'package:flash_job/feature/presentation/widgets/dialog/confrimation_dialog.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ServiceGrid extends StatelessWidget {
  final List<Map<String, dynamic>> services;

  const ServiceGrid({
    Key? key,
    required this.services,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.all(16),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        childAspectRatio: 0.95, // ปรับอัตราส่วนเล็กน้อย
      ),
      itemCount: services.length,
      itemBuilder: (context, index) {
        return _buildServiceCard(context, services[index]);
      },
    );
  }

  Widget _buildServiceCard(BuildContext context, Map<String, dynamic> service) {
    bool isJoinOption = service.containsKey('isJoinOption') ? service['isJoinOption'] : false;
    bool isExternalLink = service.containsKey('action') && service['action'] == 'googleform';

    return GestureDetector(
      onTap: () {
        if (isJoinOption) {
          // Only show confirmation dialog for the "Join" option
          ConfirmationDialog.show(
            context: context,
            title: 'external_link'.tr(),
            message: 'open_external_link'.tr(),
            confirmButtonText: 'confirm'.tr(),
            cancelButtonText: 'cancel'.tr(),
            iconType: 'warning',
            onConfirm: () async {
              // Handle external link (Google Form)
              final url = service['url'];
              if (url != null) {
                try {
                  if (await canLaunch(url)) {
                    await launch(url);
                  } else {
                    // Show error dialog if URL can't be opened
                    ConfirmationDialog.show(
                      context: context,
                      title: 'error'.tr(),
                      message: 'cannot_open_url'.tr(),
                      confirmButtonText: 'ok'.tr(),
                      cancelButtonText: '',
                      iconType: 'warning',
                      onConfirm: () {},
                    );
                  }
                } catch (e) {
                  // Show error dialog if there's an exception
                  ConfirmationDialog.show(
                    context: context,
                    title: 'error'.tr(),
                    message: 'error_opening_url'.tr(),
                    confirmButtonText: 'ok'.tr(),
                    cancelButtonText: '',
                    iconType: 'warning',
                    onConfirm: () {},
                  );
                }
              }
            },
          );
        } else if (service.containsKey('page')) {
          // Navigate directly to the page without confirmation dialog
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => service['page']),
          );
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 10,
              offset: Offset(0, 4),
              spreadRadius: 0.5,
            ),
          ],
          border: Border.all(
            color: Colors.grey.withOpacity(0.08),
            width: 1,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icon with effect
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                service['icon']!,
                height: 42,
                width: 42,
              ),
            ),
            SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                service['title']!,
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                  height: 1.3,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}