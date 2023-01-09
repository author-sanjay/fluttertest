class GetProduct {
  int id;
  String name;
  String desc;
  String images;

  GetProduct(
    this.id,
    this.desc,
    this.images,
    this.name,
  );

  GetProduct.fromJson(Map<dynamic, dynamic> json)
      : id = json["id"] as int,
        desc = json["description"] as String,
        images = json["image"] as String,
        name = json["title"] as String;

  static List<GetProduct> dealsfromapi(List api) {
    return api.map((e) {
      return GetProduct.fromJson(e);
    }).toList();
  }

  @override
  String tostring() {
    return '{name:$name, image:$images';
  }
}
