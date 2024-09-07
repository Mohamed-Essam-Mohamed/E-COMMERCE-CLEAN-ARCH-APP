import 'package:hive/hive.dart';
part 'product_response_entity.g.dart';

class ProductResponseEntity extends HiveObject {
  ProductResponseEntity({
    this.results,
    this.metadata,
    this.dataS,
  });
  int? results;
  MetadataEntity? metadata;
  List<ProductDataEntity>? dataS;
}

@HiveType(typeId: 1)
class ProductDataEntity {
  ProductDataEntity({
    this.sold,
    this.images,
    this.subcategory,
    this.ratingsQuantity,
    this.id,
    this.title,
    this.slug,
    this.description,
    this.quantity,
    this.price,
    this.imageCover,
    this.category,
    this.brand,
    this.ratingsAverage,
  });
  @HiveField(0)
  int? sold;
  @HiveField(1)
  List<String>? images; //?
  List<SubcategoryEntity>? subcategory;
  int? ratingsQuantity;
  @HiveField(2)
  String? id;
  @HiveField(3)
  String? title; //?
  String? slug;
  @HiveField(4)
  String? description; //?
  int? quantity;
  @HiveField(5)
  int? price;
  @HiveField(6)
  String? imageCover;
  CategoryEntity? category;
  BrandEntity? brand;
  @HiveField(7)
  num? ratingsAverage;
}

class SubcategoryEntity {
  SubcategoryEntity({
    this.id,
    this.name,
    this.slug,
    this.category,
  });

  String? id;
  String? name;
  String? slug;
  String? category;
}

class BrandEntity {
  BrandEntity({
    this.id,
    this.name,
    this.slug,
    this.image,
  });

  String? id;
  String? name;
  String? slug;
  String? image;
}

class CategoryEntity {
  CategoryEntity({
    this.id,
    this.name,
    this.slug,
    this.image,
  });

  String? id;
  String? name;
  String? slug;
  String? image;
}

class MetadataEntity {
  MetadataEntity({
    this.currentPage,
    this.numberOfPages,
    this.limit,
    this.nextPage,
  });

  int? currentPage;
  int? numberOfPages;
  int? limit;
  int? nextPage;
}
