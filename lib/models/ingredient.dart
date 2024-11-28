class Ingredient {
  String id;
  String name;

  Ingredient({
    required this.id,
    required this.name,
  });

  Ingredient.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String,
        name = json['name'] as String;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }
}
