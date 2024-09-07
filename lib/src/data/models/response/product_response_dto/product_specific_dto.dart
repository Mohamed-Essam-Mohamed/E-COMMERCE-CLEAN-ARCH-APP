import 'package:e_commerce/src/domain/entities/product_entites/product_response_entity.dart';

class ProuductSpecificDataDto extends ProductResponseEntity {
  SpecificDataDto? data;

  ProuductSpecificDataDto({this.data});

  ProuductSpecificDataDto.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? SpecificDataDto.fromJson(json['data']) : null;
  }
}

class SpecificDataDto extends ProductDataEntity {
  String? sId;
  String? createdAt;
  String? updatedAt;
  int? iV;

  SpecificDataDto({
    super.sold,
    super.images,
    super.subcategory,
    super.ratingsQuantity,
    this.sId,
    super.title,
    super.slug,
    super.description,
    super.quantity,
    super.price,
    super.imageCover,
    super.category,
    super.brand,
    super.ratingsAverage,
    this.createdAt,
    this.updatedAt,
    this.iV,
    super.id,
  });

  SpecificDataDto.fromJson(Map<String, dynamic> json) {
    sold = json['sold'];
    images = json['images'].cast<String>();
    if (json['subcategory'] != null) {
      subcategory = <SpecificSubcategoryDto>[];
      json['subcategory'].forEach((v) {
        subcategory!.add(new SpecificSubcategoryDto.fromJson(v));
      });
    }
    ratingsQuantity = json['ratingsQuantity'];
    sId = json['_id'];
    title = json['title'];
    slug = json['slug'];
    description = json['description'];
    quantity = json['quantity'];
    price = json['price'];
    imageCover = json['imageCover'];
    category = json['category'] != null
        ? new SpecificCategoryDto.fromJson(json['category'])
        : null;
    brand =
        json['brand'] != null ? SpecificBrandDto.fromJson(json['brand']) : null;
    ratingsAverage = json['ratingsAverage'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];

    id = json['id'];
  }
}

class SpecificBrandDto extends BrandEntity {
  SpecificBrandDto({
    super.id,
    super.name,
    super.slug,
    super.image,
  });

  SpecificBrandDto.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
  }
}

class SpecificSubcategoryDto extends SubcategoryEntity {
  SpecificSubcategoryDto({super.id, super.name, super.slug, super.category});

  SpecificSubcategoryDto.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    category = json['category'];
  }
}

class SpecificCategoryDto extends CategoryEntity {
  SpecificCategoryDto({super.id, super.name, super.slug, super.image});

  SpecificCategoryDto.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
  }
}
