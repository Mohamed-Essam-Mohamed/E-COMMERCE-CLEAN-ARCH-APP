class CategoryOrBrandResponseEntity {
  int? results;
  List<CategoryOrBrandDataEntity>? data;

  CategoryOrBrandResponseEntity({this.results, this.data});
}

class CategoryOrBrandDataEntity {
  String? name;
  String? slug;
  String? image;
  String? id;

  CategoryOrBrandDataEntity({
    this.name,
    this.slug,
    this.image,
    this.id,
  });
}
