class Film {
  final String title;
  final int episode_id;
  final String producer;

  Film({
    required this.title,
    required this.episode_id,
    required this.producer,
  });

  factory Film.fromJson(Map<String, dynamic> json){
    return Film(
      title: json['title'],
      episode_id: json['episode_id'],
      producer: json['producer'],
    );
  }
}
