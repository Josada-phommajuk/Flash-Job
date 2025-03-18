class TutoringModel {
  final String id;
  final String title;
  final String type;
  final String iconAsset;
  final String description;

  TutoringModel({
    required this.id,
    required this.title,
    required this.type,
    required this.iconAsset,
    required this.description,
  });

  // Factory method to create a list of tutoring services
  static List<TutoringModel> getTutoringServices() {
    return [
      TutoringModel(
        id: '1',
        title: 'language_teacher',
        type: 'language_teacher',
        iconAsset: 'assets/images/teach1.png',
        description: 'บริการสอนภาษาต่างประเทศ เช่น อังกฤษ จีน ญี่ปุ่น เกาหลี สำหรับทุกระดับชั้น',
      ),
      TutoringModel(
        id: '2',
        title: 'kindergarten_teacher',
        type: 'kindergarten_teacher',
        iconAsset: 'assets/images/teach2.png',
        description: 'บริการสอนเตรียมความพร้อมและพัฒนาการเด็กระดับอนุบาล',
      ),
      TutoringModel(
        id: '3',
        title: 'university_prep',
        type: 'university_prep',
        iconAsset: 'assets/images/teach3.png',
        description: 'บริการเตรียมความพร้อมสำหรับการสอบเข้ามหาวิทยาลัยในทุกวิชา',
      ),
      TutoringModel(
        id: '4',
        title: 'it_teacher',
        type: 'it_teacher',
        iconAsset: 'assets/images/teach4.png',
        description: 'บริการสอนคอมพิวเตอร์และเทคโนโลยีสารสนเทศต่างๆ',
      ),
      TutoringModel(
        id: '5',
        title: 'mathematics_teacher',
        type: 'mathematics_teacher',
        iconAsset: 'assets/images/teach5.png',
        description: 'บริการสอนพิเศษคณิตศาสตร์ สำหรับนักเรียนทุกระดับชั้น',
      ),
      TutoringModel(
        id: '6',
        title: 'science_teacher',
        type: 'science_teacher',
        iconAsset: 'assets/images/teach6.png',
        description: 'บริการสอนพิเศษวิทยาศาสตร์ ฟิสิกส์ เคมี ชีววิทยา',
      ),
    ];
  }
}