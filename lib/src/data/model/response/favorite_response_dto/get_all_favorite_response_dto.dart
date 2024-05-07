import 'package:e_commerce/src/domain/entities/favorite_entities/get_all_favorite_response_enitiy.dart';

class GetAllFavoriteResponseDto extends GetAllFavoriteResponseEntity {
  GetAllFavoriteResponseDto({super.status, super.count, super.data});

  GetAllFavoriteResponseDto.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    count = json['count'];
    if (json['data'] != null) {
      data = <FavoriteDataDto>[];
      json['data'].forEach((v) {
        data!.add(new FavoriteDataDto.fromJson(v));
      });
    }
  }
}

class FavoriteDataDto extends FavoriteDataEntity {
  FavoriteDataDto(
      {super.sold,
      super.images,
      super.subcategory,
      super.ratingsQuantity,
      super.sId,
      super.title,
      super.slug,
      super.description,
      super.quantity,
      super.price,
      super.imageCover,
      super.category,
      super.brand,
      super.ratingsAverage,
      super.createdAt,
      super.updatedAt,
      super.iV,
      super.id,
      super.priceAfterDiscount});

  FavoriteDataDto.fromJson(Map<String, dynamic> json) {
    sold = json['sold'];
    images = json['images'].cast<String>();
    if (json['subcategory'] != null) {
      subcategory = <FavoriteSubcategoryDto>[];
      json['subcategory'].forEach((v) {
        subcategory!.add(new FavoriteSubcategoryDto.fromJson(v));
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
        ? new FavoriteCategoryDto.fromJson(json['category'])
        : null;
    brand = json['brand'] != null
        ? new FavoriteCategoryDto.fromJson(json['brand'])
        : null;
    ratingsAverage = json['ratingsAverage'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    id = json['id'];
    priceAfterDiscount = json['priceAfterDiscount'];
  }
}

class FavoriteSubcategoryDto extends FavoriteSubcategoryEntity {
  FavoriteSubcategoryDto({super.sId, super.name, super.slug, super.category});

  FavoriteSubcategoryDto.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    slug = json['slug'];
    category = json['category'];
  }
}

class FavoriteCategoryDto extends FavoriteCategoryEntity {
  FavoriteCategoryDto({super.sId, super.name, super.slug, super.image});

  FavoriteCategoryDto.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
  }
}
