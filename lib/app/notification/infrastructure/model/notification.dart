// ignore_for_file: public_member_api_docs, sort_constructors_first
class NotificationModel {
  final String title;
  final String description;
  final DateTime date;
  NotificationModel({
    required this.title,
    required this.description,
    required this.date,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'description': description,
      'date': date.toIso8601String(),
    };
  }

  factory NotificationModel.fromMap(Map<String, dynamic> map) {
    return NotificationModel(
      title: map['title'] as String,
      description: map['description'] as String,
      date: DateTime.parse(map['date']),
    );
  }
  static List<NotificationModel> fakeData = [
    for (int i = 0; i < 50; i++)
      NotificationModel(
          title: "title  $i",
          description: "description $i",
          date: DateTime.now())
  ];
}
