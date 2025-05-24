class MusicModel {
  final String id;
  final String title;
  final String description;
  final String iconType;
  final String iconColor;
  final int order;

  MusicModel({
    required this.id,
    required this.title,
    required this.description,
    required this.iconType,
    required this.iconColor,
    required this.order,
  });

  factory MusicModel.fromFirestore(Map<String, dynamic> data, String id) {
    return MusicModel(
      id: id,
      title: data['title'] ?? '',
      description: data['description'] ?? '',
      iconType: data['iconType'] ?? 'music_note',
      iconColor: data['iconColor'] ?? 'red',
      order: data['order'] ?? 0,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'iconType': iconType,
      'iconColor': iconColor,
      'order': order,
    };
  }
}
