// lib/models/repair_service_model.dart
class RepairServiceModel {
  final String id;
  final String title;
  final String type;
  final String iconAsset;
  final String description;

  RepairServiceModel({
    required this.id,
    required this.title,
    required this.type,
    required this.iconAsset,
    required this.description,
  });

  // Factory method to create a list of repair services
  static List<RepairServiceModel> getServices() {
    return [
      RepairServiceModel(
        id: '1',
        title: 'electrician',
        type: 'electrician',
        iconAsset: 'assets/images/charg1.png',
        description: 'บริการช่างไฟฟ้าสำหรับการติดตั้งและซ่อมแซมระบบไฟฟ้า',
      ),
      RepairServiceModel(
        id: '2',
        title: 'aircon',
        type: 'aircon',
        iconAsset: 'assets/images/charg2.png',
        description: 'บริการซ่อมและบำรุงรักษาเครื่องปรับอากาศทุกรุ่น',
      ),
      RepairServiceModel(
        id: '3',
        title: 'mechanic',
        type: 'mechanic',
        iconAsset: 'assets/images/charg1.png',
        description: 'บริการช่างซ่อมเครื่องยนต์และอุปกรณ์เครื่องจักรต่างๆ',
      ),
      RepairServiceModel(
        id: '4',
        title: 'construction',
        type: 'construction',
        iconAsset: 'assets/images/charg4.png',
        description: 'บริการงานก่อสร้างและซ่อมแซมบ้านหรืออาคารต่างๆ',
      ),
      RepairServiceModel(
        id: '5',
        title: 'welder',
        type: 'welder',
        iconAsset: 'assets/images/charg5.png',
        description: 'บริการช่างเชื่อมโลหะสำหรับงานโครงสร้างและซ่อมแซม',
      ),
      RepairServiceModel(
        id: '6',
        title: 'carpenter',
        type: 'carpenter',
        iconAsset: 'assets/images/charg6.png',
        description: 'บริการช่างไม้สำหรับงานเฟอร์นิเจอร์และตกแต่งภายใน',
      ),
    ];
  }
}
