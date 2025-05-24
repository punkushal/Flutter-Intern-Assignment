class MusicModel {
  final String id;
  final String title;
  final String description;
  final String iconPath;
  final int order;

  MusicModel({
    required this.id,
    required this.title,
    required this.description,
    required this.iconPath,
    required this.order,
  });

  factory MusicModel.fromFirestore(Map<String, dynamic> data, String id) {
    return MusicModel(
      id: id,
      title: data['title'] ?? '',
      description: data['description'] ?? '',
      iconPath: data['iconPath'] ?? 'music_note',
      order: data['order'] ?? 0,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'iconPath': iconPath,
      'order': order,
    };
  }
}
