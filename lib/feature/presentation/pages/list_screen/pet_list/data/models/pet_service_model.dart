// lib/models/pet_service_model.dart
class PetServiceModel {
  final String id;
  final String title;
  final String type;
  final String iconAsset;
  final String description;

  PetServiceModel({
    required this.id,
    required this.title,
    required this.type,
    required this.iconAsset,
    required this.description,
  });

  // Factory method to create a list of pet services
  static List<PetServiceModel> getServices() {
    return [
      PetServiceModel(
        id: '1',
        title: 'Dog Walking',
        type: 'dogWalking',
        iconAsset: 'assets/icons/dog.png',
        description: 'บริการรับดูแลและพาสุนัขเดินเล่นตามเวลาที่นัดหมาย',
      ),
      PetServiceModel(
        id: '2',
        title: 'Pet Sitting',
        type: 'petSitting',
        iconAsset: 'assets/icons/pet.png',
        description: 'บริการดูแลสัตว์เลี้ยงที่บ้านขณะที่คุณไม่อยู่',
      ),
      PetServiceModel(
        id: '3',
        title: 'Pet Grooming',
        type: 'petGrooming',
        iconAsset: 'assets/icons/grooming.png',
        description: 'บริการอาบน้ำและตัดแต่งขนสัตว์เลี้ยง',
      ),
      PetServiceModel(
        id: '4',
        title: 'Pet Boarding',
        type: 'petBoarding',
        iconAsset: 'assets/icons/boarding.png',
        description: 'บริการรับฝากสัตว์เลี้ยงระยะสั้นและระยะยาว',
      ),
    ];
  }
}