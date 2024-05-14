class GetAllFavoriteResponseEntity {
  String? status;
  int? count;
  List<FavoriteDataEntity>? data;

  GetAllFavoriteResponseEntity({this.status, this.count, this.data});
}

class FavoriteDataEntity {
  int? sold;
  List<String>? images;
  List<FavoriteSubcategoryEntity>? subcategory;
  int? ratingsQuantity;
  String? sId;
  String? title;
  String? slug;
  String? description;
  int? quantity;
  int? price;
  String? imageCover;
  FavoriteCategoryEntity? category;
  FavoriteCategoryEntity? brand;
  num? ratingsAverage;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? id;
  int? priceAfterDiscount;

  FavoriteDataEntity(
      {this.sold,
      this.images,
      this.subcategory,
      this.ratingsQuantity,
      this.sId,
      this.title,
      this.slug,
      this.description,
      this.quantity,
      this.price,
      this.imageCover,
      this.category,
      this.brand,
      this.ratingsAverage,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.id,
      this.priceAfterDiscount});
}

class FavoriteSubcategoryEntity {
  String? sId;
  String? name;
  String? slug;
  String? category;

  FavoriteSubcategoryEntity({this.sId, this.name, this.slug, this.category});
}

class FavoriteCategoryEntity {
  String? sId;
  String? name;
  String? slug;
  String? image;

  FavoriteCategoryEntity({this.sId, this.name, this.slug, this.image});
}
