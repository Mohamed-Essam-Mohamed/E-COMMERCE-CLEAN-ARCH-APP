class CategoryResponseEntity {
  int? results;
  List<DataEntity>? data;

  CategoryResponseEntity({this.results, this.data});
}

class DataEntity {
  String? name;
  String? slug;
  String? image;
  String? id;

  DataEntity({
    this.name,
    this.slug,
    this.image,
    this.id,
  });
}
