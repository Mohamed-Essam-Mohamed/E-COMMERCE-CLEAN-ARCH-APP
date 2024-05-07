import '../../../../domain/entities/product_entites/add_to_cart/get_logged_cart_response_entity.dart';

class GetLoggedCartResponseDto extends GetLoggedCartResponseEntity {
  String? message;
  GetLoggedCartResponseDto(
      {super.status, super.numOfCartItems, super.data, this.message});
  GetLoggedCartResponseDto.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    numOfCartItems = json['numOfCartItems'];
    data = json['data'] != null ? new DataCartDto.fromJson(json['data']) : null;
  }
}

class DataCartDto extends DataCartEntity {
  DataCartDto(
      {super.sId,
      super.cartOwner,
      super.products,
      super.createdAt,
      super.updatedAt,
      super.iV,
      super.totalCartPrice});

  DataCartDto.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    cartOwner = json['cartOwner'];
    if (json['products'] != null) {
      products = <ProductsCartsDto>[];
      json['products'].forEach((v) {
        products!.add(new ProductsCartsDto.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    totalCartPrice = json['totalCartPrice'];
  }
}

class ProductsCartsDto extends ProductsCartsEntity {
  ProductsCartsDto({super.count, super.sId, super.product, super.price});

  ProductsCartsDto.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    sId = json['_id'];
    product = json['product'] != null
        ? new ProductCartDto.fromJson(json['product'])
        : null;
    price = json['price'];
  }
}

class ProductCartDto extends ProductCartEntity {
  ProductCartDto(
      {super.subcategory,
      super.sId,
      super.title,
      super.quantity,
      super.imageCover,
      super.category,
      super.brand,
      super.ratingsAverage,
      super.id});

  ProductCartDto.fromJson(Map<String, dynamic> json) {
    if (json['subcategory'] != null) {
      subcategory = <SubcategoryCartDto>[];
      json['subcategory'].forEach((v) {
        subcategory!.add(new SubcategoryCartDto.fromJson(v));
      });
    }
    sId = json['_id'];
    title = json['title'];
    quantity = json['quantity'];
    imageCover = json['imageCover'];
    category = json['category'] != null
        ? new CategoryCartDto.fromJson(json['category'])
        : null;
    brand = json['brand'] != null
        ? new CategoryCartDto.fromJson(json['brand'])
        : null;
    ratingsAverage = json['ratingsAverage'];
    id = json['id'];
  }
}

class SubcategoryCartDto extends SubcategoryCartEntity {
  SubcategoryCartDto({super.sId, super.name, super.slug, super.category});

  SubcategoryCartDto.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    slug = json['slug'];
    category = json['category'];
  }
}

class CategoryCartDto extends CategoryCartEntity {
  CategoryCartDto({super.sId, super.name, super.slug, super.image});

  CategoryCartDto.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
  }
}
