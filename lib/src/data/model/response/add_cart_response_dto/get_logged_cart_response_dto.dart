class GetLoggedCartResponseDto {
  String? status;
  int? numOfCartItems;
  DataCartDto? data;

  GetLoggedCartResponseDto({this.status, this.numOfCartItems, this.data});

  GetLoggedCartResponseDto.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    numOfCartItems = json['numOfCartItems'];
    data = json['data'] != null ? new DataCartDto.fromJson(json['data']) : null;
  }
}

class DataCartDto {
  String? sId;
  String? cartOwner;
  List<ProductsCartsDto>? products;
  String? createdAt;
  String? updatedAt;
  int? iV;
  int? totalCartPrice;

  DataCartDto(
      {this.sId,
      this.cartOwner,
      this.products,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.totalCartPrice});

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

class ProductsCartsDto {
  int? count;
  String? sId;
  ProductCartDto? product;
  int? price;

  ProductsCartsDto({this.count, this.sId, this.product, this.price});

  ProductsCartsDto.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    sId = json['_id'];
    product = json['product'] != null
        ? new ProductCartDto.fromJson(json['product'])
        : null;
    price = json['price'];
  }
}

class ProductCartDto {
  List<SubcategoryCartDto>? subcategory;
  String? sId;
  String? title;
  int? quantity;
  String? imageCover;
  CategoryCartDto? category;
  CategoryCartDto? brand;
  double? ratingsAverage;
  String? id;

  ProductCartDto(
      {this.subcategory,
      this.sId,
      this.title,
      this.quantity,
      this.imageCover,
      this.category,
      this.brand,
      this.ratingsAverage,
      this.id});

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

class SubcategoryCartDto {
  String? sId;
  String? name;
  String? slug;
  String? category;

  SubcategoryCartDto({this.sId, this.name, this.slug, this.category});

  SubcategoryCartDto.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    slug = json['slug'];
    category = json['category'];
  }
}

class CategoryCartDto {
  String? sId;
  String? name;
  String? slug;
  String? image;

  CategoryCartDto({this.sId, this.name, this.slug, this.image});

  CategoryCartDto.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
  }
}
