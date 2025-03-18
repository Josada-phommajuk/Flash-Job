
// lib/models/child_service_model.dart
class ChildServiceModel {
  final String id;
  final String title;
  final String type;
  final String iconAsset;
  final String description;

  ChildServiceModel({
    required this.id,
    required this.title,
    required this.type,
    required this.iconAsset,
    required this.description,
  });

  // Factory method to create a list of child services (for future expansion)
  static List<ChildServiceModel> getServices() {
    return [
      ChildServiceModel(
        id: '1',
        title: 'serviceTitle',
        type: 'serviceTitle',
        iconAsset: 'assets/icons/child.png',
        description: 'บริการดูแลเด็กโดยพี่เลี้ยงที่มีประสบการณ์และความเชี่ยวชาญ',
      ),
      // Add more child services here if needed
    ];
  }
}