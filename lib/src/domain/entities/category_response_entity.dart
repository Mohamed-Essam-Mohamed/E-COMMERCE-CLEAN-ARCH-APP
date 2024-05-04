class CategoryResponseEntity {
  int? results;
  List<CategoryDataEntity>? data;

  CategoryResponseEntity({this.results, this.data});
}

class CategoryDataEntity {
  String? name;
  String? slug;
  String? image;
  String? id;

  CategoryDataEntity({
    this.name,
    this.slug,
    this.image,
    this.id,
  });
}
