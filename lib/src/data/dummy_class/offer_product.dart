import 'package:e_commerce/src/constant/image_path_const.dart';
import 'package:e_commerce/src/domain/entities/product_entites/product_response_entity.dart';

class OfferProduct extends ProductDataEntity {
  final List<String> images = [
    imageSlider1,
    imageSlider2,
    imageSlider3,
  ];
  int? offerProduct;
  String? offerString;
  bool? isBlueColor;
  OfferProduct({
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
    this.offerProduct,
    this.isBlueColor,
    this.offerString,
  }) : super();
  static List<OfferProduct> offerProductList() {
    return [
      OfferProduct(
        isBlueColor: true,
        brand: BrandEntity(
          name: 'SONY',
        ),
        category: CategoryEntity(
          name: 'Headphones',
        ),
        description: "for all Headphones and earphones",
        id: '1',
        imageCover: imageSlider1,
        price: 3099,
        quantity: 53,
        ratingsAverage: 4.5,
        ratingsQuantity: 10,
        sold: 4245,
        slug: '1',
        subcategory: [],
        title: 'Apple Headphones',
        images: [
          imageSlider1,
        ],
        offerString: "for all Headphones& earphones",
        offerProduct: 25,
      ),
      OfferProduct(
        isBlueColor: false,
        brand: BrandEntity(
          name: 'Skin Care',
        ),
        category: CategoryEntity(
          name: 'Skin Cart',
        ),
        description: "For all Makeup & Skin Care",
        id: '2',
        imageCover: imageSlider2,
        price: 1099,
        quantity: 5,
        ratingsAverage: 4.5,
        ratingsQuantity: 10,
        sold: 4322,
        slug: '2',
        subcategory: [],
        title: 'Skin Care',
        images: [
          imageSlider2,
        ],
        offerString: "For all Makeup & Skin Care",
        offerProduct: 30,
      ),
      OfferProduct(
        isBlueColor: true,
        brand: BrandEntity(
          name: 'Dell',
        ),
        category: CategoryEntity(
          name: 'Electronics',
        ),
        description: "for all Laptop and Mobile",
        id: '3',
        imageCover: imageSlider3,
        price: 9999,
        quantity: 5,
        ratingsAverage: 4.5,
        ratingsQuantity: 10,
        sold: 5423,
        slug: '3',
        subcategory: [],
        title: 'Laptop Dell',
        images: [
          imageSlider3,
        ],
        offerString: "For all Laptop& Mobile",
        offerProduct: 20,
      ),
    ];
  }
}
