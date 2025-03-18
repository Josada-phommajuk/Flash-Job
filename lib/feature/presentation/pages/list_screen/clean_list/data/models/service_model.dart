class ServiceModel {
  final String id;
  final String title;
  final String type;
  final String iconAsset;
  final String description;

  ServiceModel({
    required this.id,
    required this.title,
    required this.type,
    required this.iconAsset,
    required this.description,
  });

  // Factory method to create a list of services (for future expansion)
  static List<ServiceModel> getServices() {
    return [
      ServiceModel(
        id: '1',
        title: 'houseCleaningTitle',
        type: 'houseCleaningTitle',
        iconAsset: 'assets/icons/w.png',
        description: 'บริการทำความสะอาดบ้านและที่พักอาศัย',
      ),
      ServiceModel(
        id: '2',
        title: 'gardenCleaningTitle',
        type: 'gardenCleaningTitle',
        iconAsset: 'assets/icons/man.png',
        description: 'บริการดูแลสวนและพื้นที่ภายนอก',
      ),
      ServiceModel(
        id: '3',
        title: 'laundryTitle',
        type: 'laundryTitle',
        iconAsset: 'assets/icons/woman.png',
        description: 'บริการซักรีดเสื้อผ้าและผ้าต่างๆ',
      ),
      ServiceModel(
        id: '4',
        title: 'airConditionerTitle',
        type: 'airConditionerTitle',
        iconAsset: 'assets/icons/air.png',
        description: 'บริการล้างและซ่อมบำรุงเครื่องปรับอากาศ',
      ),
    ];
  }
}