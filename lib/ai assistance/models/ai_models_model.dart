class AiModelsModel {
  final String id;
  final int created;
  final String root;

  AiModelsModel({
    required this.id,
    required this.root,
    required this.created,
  });

  factory AiModelsModel.fromJson(Map<String, dynamic> json) => AiModelsModel(
        id: json["id"],
        root: json["root"],
        created: json["created"],
      );

  static List<AiModelsModel> modelsFromSnapshot(List modelSnapshot) {
    return modelSnapshot.map((data) => AiModelsModel.fromJson(data)).toList();
  }
}
