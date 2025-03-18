// import 'package:flash_job/feature/presentation/widgets/dialog/confrimation_dialog.dart';
// import 'package:flutter/material.dart';
// import 'package:easy_localization/easy_localization.dart';

// class FeaturedServices extends StatelessWidget {
//   final List<Map<String, dynamic>> featuredServices;

//   const FeaturedServices({
//     Key? key,
//     required this.featuredServices,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 210, // เพิ่มความสูงเล็กน้อย
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         padding: EdgeInsets.symmetric(horizontal: 8),
//         physics: BouncingScrollPhysics(),
//         itemCount: featuredServices.length,
//         itemBuilder: (context, index) {
//           return _buildFeaturedServiceCard(context, featuredServices[index]);
//         },
//       ),
//     );
//   }

//   Widget _buildFeaturedServiceCard(
//     BuildContext context,
//     Map<String, dynamic> service,
//   ) {
//     return GestureDetector(
//       onTap: () {
//         // แสดง dialog ยืนยันก่อนไปยังหน้าอื่น
//         ConfirmationDialog.show(
//           context: context,
//           title: 'service_confirmation'.tr(), 
//           message: 'navigate_to_service'.tr() + '\n"${service['title']}"?',
//           confirmButtonText: 'continue'.tr(),
//           cancelButtonText: 'cancel'.tr(),
//           iconType: 'info', // ใช้ไอคอนประเภท info
//           onConfirm: () {
//             // เมื่อผู้ใช้กดยืนยัน จึงนำทางไปยังหน้าที่ต้องการ
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => service['page']),
//             );
//           },
//         );
//       },
//       child: Hero(
//         tag: 'featured_${service['title']}', // ใช้ Hero animation
//         child: Container(
//           width: 260,
//           margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(20),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black.withOpacity(0.08),
//                 blurRadius: 12,
//                 offset: Offset(0, 5),
//                 spreadRadius: 0.5,
//               ),
//             ],
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Service image with discount badge
//               Stack(
//                 children: [
//                   ClipRRect(
//                     borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(20),
//                       topRight: Radius.circular(20),
//                     ),
//                     child: Container(
//                       height: 130,
//                       width: double.infinity,
//                       child: Image.asset(
//                         service['image']!,
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                     bottom: 0,
//                     left: 0,
//                     right: 0,
//                     child: Container(
//                       height: 40,
//                       decoration: BoxDecoration(
//                         gradient: LinearGradient(
//                           begin: Alignment.topCenter,
//                           end: Alignment.bottomCenter,
//                           colors: [
//                             Colors.transparent,
//                             Colors.black.withOpacity(0.7),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),

//               // Service info
//               Padding(
//                 padding: const EdgeInsets.all(14.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       service['title']!,
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 14,
//                         color: Colors.black87,
//                       ),
//                       maxLines: 1,
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                     SizedBox(height: 6),
//                     Text(
//                       service['description']!,
//                       style: TextStyle(
//                         fontSize: 9,
//                         color: Colors.grey[700],
//                         height: 1.3,
//                       ),
//                       maxLines: 2,
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// Updated FeaturedServices class
import 'package:flutter/material.dart';

class FeaturedServices extends StatelessWidget {
  final List<Map<String, dynamic>> featuredServices;

  const FeaturedServices({
    Key? key,
    required this.featuredServices,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 210, // เพิ่มความสูงเล็กน้อย
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 8),
        physics: BouncingScrollPhysics(),
        itemCount: featuredServices.length,
        itemBuilder: (context, index) {
          return _buildFeaturedServiceCard(context, featuredServices[index]);
        },
      ),
    );
  }

  Widget _buildFeaturedServiceCard(
    BuildContext context,
    Map<String, dynamic> service,
  ) {
    return GestureDetector(
      onTap: () {
        // Navigate directly to the page without confirmation dialog
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => service['page']),
        );
      },
      child: Hero(
        tag: 'featured_${service['title']}', // ใช้ Hero animation
        child: Container(
          width: 260,
          margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 12,
                offset: Offset(0, 5),
                spreadRadius: 0.5,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Service image with discount badge
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    child: Container(
                      height: 130,
                      width: double.infinity,
                      child: Image.asset(
                        service['image']!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black.withOpacity(0.7),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              // Service info
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      service['title']!,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.black87,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 6),
                    Text(
                      service['description']!,
                      style: TextStyle(
                        fontSize: 9,
                        color: Colors.grey[700],
                        height: 1.3,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}