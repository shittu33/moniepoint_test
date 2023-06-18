

import 'package:moniepoint_test/core/data/dto/user.dart';

class ProductResponse {
  final String responseMessage;
  final String responseCode;
  final List<Product> products;

  const ProductResponse({
    required this.responseMessage,
    required this.responseCode,
    required this.products,
  });

  factory ProductResponse.fromJson(Map<String, dynamic> json) {
    return ProductResponse(
      responseMessage: json['responseMessage'],
      responseCode: json['responseCode'],
      products: json['products'].map<Product>((e) => Product.fromJson(e)).toList(),
    );
  }

}

class Product {
  final String id;
  final String name;
  final List<String> description;
  final double price;
  final int quantity;
  final List<String> images;
  final String category;
  final String condition;
  final String rating;
  final String brand;
  final String color;
  final String material;
  final String weight;
  final List<RatingReview> ratingReviews;
  final ShippingDetails shippingDetails;
  final SellerInfo sellerInfo;
  final bool isFavorite;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.quantity,
    required this.images,
    required this.category,
    required this.condition,
    required this.rating,
    required this.brand,
    required this.color,
    required this.material,
    required this.weight,
    required this.ratingReviews,
    required this.shippingDetails,
    required this.sellerInfo,
    this.isFavorite = false,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      description: json['description'].cast<String>(),
      price: json['price'],
      quantity: json['quantity'],
      images: json['images'].cast<String>(),
      category: json['category'],
      condition: json['condition'],
      rating: json['rating'],
      brand: json['brand'],
      color: json['color'],
      material: json['material'],
      weight: json['weight'],
      ratingReviews: json['ratingReviews']
          .map<RatingReview>((e) => RatingReview.fromJson(e))
          .toList(),
      shippingDetails: ShippingDetails.fromJson(json['shippingDetails']),
      sellerInfo: SellerInfo.fromJson(json['sellerInfo']),
      isFavorite: json['isFavorite'],
    );
  }
}

class RatingReview {
  final String id;
  final String name;
  final String review;
  final String rating;
  final User user;

  RatingReview({
    required this.id,
    required this.name,
    required this.review,
    required this.rating,
    required this.user,
  });

  factory RatingReview.fromJson(Map<String, dynamic> json) {
    return RatingReview(
      id: json['id'],
      name: json['name'],
      review: json['review'],
      rating: json['rating'],
      user: User.fromJson(json['user']),
    );
  }
}

class ShippingDetails {
  final String name;
  final String address;
  final String? zipCode;
  final String status;
  final String deliveryDate;

  ShippingDetails({
    required this.name,
    required this.address,
    required this.zipCode,
    required this.status,
    required this.deliveryDate,
  });

  factory ShippingDetails.fromJson(Map<String, dynamic> json) {
    return ShippingDetails(
      name: json['name'],
      address: json['address'],
      zipCode: json['zipCode'],
      status: json['status'],
      deliveryDate: json['deliveryDate'],
    );
  }
}

class SellerInfo {
  final String name;
  final String link;
  final String feedback;
  final String lastActive;

  SellerInfo({
    required this.name,
    required this.link,
    required this.feedback,
    required this.lastActive,
  });

  factory SellerInfo.fromJson(Map<String, dynamic> json) {
    return SellerInfo(
      name: json['name'],
      link: json['link'],
      feedback: json['feedback'],
      lastActive: json['lastActive'],
    );
  }
}




