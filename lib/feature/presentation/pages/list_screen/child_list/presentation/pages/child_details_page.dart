// // NEW FILE: lib/pages/child_details_page.dart
// import 'package:flutter/material.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:whatsapp_unilink/whatsapp_unilink.dart';

// class ChildDetailsPage extends StatelessWidget {
//   final String serviceType;
//   final String serviceTitle;
//   final Map<String, String?> userData;

//   const ChildDetailsPage({
//     Key? key,
//     required this.serviceType,
//     required this.serviceTitle,
//     required this.userData,
//   }) : super(key: key);

//   // Launch WhatsApp with prepared message
//   void launchWhatsApp(BuildContext context) async {
//     // Create full address string
//     String fullAddress = "${userData['address']}, ${userData['district']}, ${userData['province']}";
    
//     // Prepare message
//     String message = '''ສະບາຍດີ
// ສົນໃຈບໍລິການລ້ຽງເດັກ
// ຊື່: ${userData['name']} ${userData['surname']} 
// ເບີໂທ: ${userData['phoneNumber']}
// ທີ່ຢູ່: $fullAddress''';

//     final link = WhatsAppUnilink(
//       phoneNumber: '+8562093344966', // Your phone number
//       text: message,
//     );

//     try {
//       await launch('$link');
//     } catch (e) {
//       print('Could not launch WhatsApp: $e');
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('ບໍ່ສາມາດເປີດ WhatsApp ໄດ້'),
//           backgroundColor: Colors.red,
//           behavior: SnackBarBehavior.floating,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(10),
//           ),
//         ),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(serviceTitle),
//         centerTitle: true,
//         backgroundColor: Colors.white,
//         foregroundColor: Colors.black,
//         elevation: 0,
//       ),
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: [Colors.white, Colors.pink[50]!],
//           ),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Service image
//               Center(
//                 child: Container(
//                   height: 180,
//                   width: 180,
//                   decoration: BoxDecoration(
//                     color: Colors.pink.withOpacity(0.1),
//                     shape: BoxShape.circle,
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.all(20.0),
//                     child: Image.asset(
//                       'assets/icons/child.png',
//                       errorBuilder: (context, error, stackTrace) {
//                         return Icon(
//                           Icons.child_care,
//                           color: Colors.pink[600],
//                           size: 100,
//                         );
//                       },
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 24),
              
//               // Service title and description
//               Text(
//                 serviceTitle,
//                 style: TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.pink[600],
//                 ),
//               ),
//               SizedBox(height: 8),
//               Text(
//                 'childServiceDescription'.tr(),
//                 style: TextStyle(
//                   fontSize: 16,
//                   color: Colors.grey[700],
//                 ),
//               ),
//               SizedBox(height: 24),
              
//               // Service features
//               Text(
//                 'serviceFeatures'.tr(),
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.pink[600],
//                 ),
//               ),
//               SizedBox(height: 12),
//               _buildFeatureItem(Icons.verified, 'featureExperienced'.tr()),
//               _buildFeatureItem(Icons.security, 'featureSafe'.tr()),
//               _buildFeatureItem(Icons.access_time, 'featureFlexible'.tr()),
//               _buildFeatureItem(Icons.child_friendly, 'featureChildFriendly'.tr()),
              
//               Spacer(),
              
//               // Contact button
//               Container(
//                 width: double.infinity,
//                 child: ElevatedButton(
//                   onPressed: () => launchWhatsApp(context),
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.green,
//                     foregroundColor: Colors.white,
//                     padding: EdgeInsets.symmetric(vertical: 16),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(30),
//                     ),
//                   ),
//                   child: Row(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Icon(Icons.chat, size: 24),
//                       SizedBox(width: 12),
//                       Text(
//                         'contactButton'.tr(),
//                         style: TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               SizedBox(height: 24),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
  
//   Widget _buildFeatureItem(IconData icon, String text) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: Row(
//         children: [
//           Icon(
//             icon,
//             color: Colors.pink[400],
//             size: 20,
//           ),
//           SizedBox(width: 12),
//           Text(
//             text,
//             style: TextStyle(
//               fontSize: 16,
//               color: Colors.grey[800],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }