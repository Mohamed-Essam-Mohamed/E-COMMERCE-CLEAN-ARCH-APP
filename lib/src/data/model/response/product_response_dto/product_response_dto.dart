import '../../../../domain/entities/product_entites/product_response_entity.dart';

class ProductResponseDto extends ProductResponseEntity {
  ProductResponseDto({
    super.results,
    super.metadata,
    super.data,
  });

  ProductResponseDto.fromJson(dynamic json) {
    results = json['results'];
    metadata = json['metadata'] != null
        ? MetadataDto.fromJson(json['metadata'])
        : null;
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(ProductDataDto.fromJson(v));
      });
    }
  }
  // int? results;
  // Metadata? metadata;
  // List<ProductDataDto>? data;
  // ProductResponseEntity toEntity() => ProductResponseEntity(
  //       data: data?.map((data) => data.toEntity()).toList(),
  //       results: results,
  //     );
}

class ProductDataDto extends ProductDataEntity {
  ProductDataDto({
    super.sold,
    super.images,
    super.subcategory,
    super.ratingsQuantity,
    super.id,
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
  });

  ProductDataDto.fromJson(dynamic json) {
    sold = json['sold'];
    images = json['images'] != null ? json['images'].cast<String>() : [];
    if (json['subcategory'] != null) {
      subcategory = [];
      json['subcategory'].forEach((v) {
        subcategory?.add(SubcategoryDto.fromJson(v).toEntity());
      });
    }
    ratingsQuantity = json['ratingsQuantity'];
    id = json['_id'];
    title = json['title'];
    slug = json['slug'];
    description = json['description'];
    quantity = json['quantity'];
    price = json['price'];
    imageCover = json['imageCover'];
    category = json['category'] != null
        ? CategoryDto.fromJson(json['category'])
        : null;
    brand = json['brand'] != null ? BrandDto.fromJson(json['brand']) : null;
    ratingsAverage = json['ratingsAverage'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    id = json['id'];
  }
  // int? sold;
  // List<String>? images;
  // List<Subcategory>? subcategory;
  // int? ratingsQuantity;
  // String? id;
  // String? title;
  // String? slug;
  // String? description;
  // int? quantity;
  // int? price;
  // String? imageCover;
  // Category? category;
  // Brand? brand;
  // num? ratingsAverage;
  String? createdAt;
  String? updatedAt;
  // ProductDataEntity toEntity() => ProductDataEntity(
  //       id: id,
  //       title: title,
  //       slug: slug,
  //       description: description,
  //       quantity: quantity,
  //       price: price,
  //       imageCover: imageCover,
  //       ratingsAverage: ratingsAverage,
  //       sold: sold,
  //       images: images,
  //       subcategory:
  //           subcategory?.map((subcategory) => subcategory.toEntity()).toList(),
  //       ratingsQuantity: ratingsQuantity,
  //       brand: brand?.toEntity(),
  //       category: category?.toEntity(),
  //     );
}

class BrandDto extends BrandEntity {
  BrandDto({
    super.id,
    super.name,
    super.slug,
    super.image,
  });

  BrandDto.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
  }
  // String? id;
  // String? name;
  // String? slug;
  // String? image;
  // BrandEntity toEntity() => BrandEntity(
  //       id: id,
  //       name: name,
  //       slug: slug,
  //       image: image,
  //     );
}

class CategoryDto extends CategoryEntity {
  CategoryDto({
    super.id,
    super.name,
    super.slug,
    super.image,
  });

  CategoryDto.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
  }
  // String? id;
  // String? name;
  // String? slug;
  // String? image;
  // CategoryEntity toEntity() => CategoryEntity(
  //       id: id,
  //       name: name,
  //       slug: slug,
  //       image: image,
  //     );
}

class SubcategoryDto extends CategoryEntity {
  SubcategoryDto({
    this.id,
    this.name,
    this.slug,
    this.category,
  });

  SubcategoryDto.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    category = json['category'];
  }
  String? id;
  String? name;
  String? slug;
  String? category;
  SubcategoryEntity toEntity() => SubcategoryEntity(
        id: id,
        name: name,
        slug: slug,
        category: category,
      );
}

class MetadataDto extends MetadataEntity {
  MetadataDto({
    super.currentPage,
    super.numberOfPages,
    super.limit,
    super.nextPage,
  });

  MetadataDto.fromJson(dynamic json) {
    currentPage = json['currentPage'];
    numberOfPages = json['numberOfPages'];
    limit = json['limit'];
    nextPage = json['nextPage'];
  }
  // int? currentPage;
  // int? numberOfPages;
  // int? limit;
  // int? nextPage;
}
