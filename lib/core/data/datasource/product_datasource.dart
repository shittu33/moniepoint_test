import 'package:moniepoint_test/core/data/dto/product_response.dart';

abstract class ProductDataSource {
  Future<ProductResponse> getProducts();
}

class LocalProductDataSource implements ProductDataSource {
  LocalProductDataSource();

  @override
  Future<ProductResponse> getProducts() async {
    return ProductResponse.fromJson({});
  }
}

class ApiProductDataSource implements ProductDataSource {
  // final Dio _dio;

  ApiProductDataSource();

  @override
  Future<ProductResponse> getProducts() async {
    return ProductResponse.fromJson(generateMockProductJson());
  }
}

///generate a json product data that can be fed to ProductResponse
///to create a mock product response
Map<String, dynamic> generateMockProductJson() {
  return {
    "responseMessage": "success",
    "responseCode": "200",
    "products": randomProducts.asMap().entries.map(
          (e) => {
            "id": "00${e.key + 1}",
            "name": e.value["name"],
            "description": [
              "A timeless classic, this men's tee features a simple design that's perfect for everyday wear."
            ],
            "price": 19.99,
            "quantity": 100,
            "images": e.value['images'],
            "category": "Shirts",
            "condition": "New",
            "rating": 4.5,
            "brand": "Gildan",
            "color": ["White", "Black"],
            "material": "100% Cotton",
            "weight": "180 gsm",
            "ratingReviews": [
              {
                "rating": 5,
                "review":
                    "I love this shirt! It fits perfectly and is super comfortable.",
                "user": {
                  "id": 1001,
                  "name": "John Doe",
                  "cartItems": [],
                  "messages": []
                }
              },
              {
                "rating": 4,
                "review":
                    "The shirt is great, but it's a little bit thin. Otherwise, I'm really happy with my purchase.",
                "user": {
                  "id": 1002,
                  "name": "Jane Smith",
                  "cartItems": [],
                  "messages": []
                }
              }
            ],
            "shippingDetails": {
              "name": "John Doe",
              "address": "123 Main St",
              "city": "Anytown",
              "state": "CA",
              "zip": "12345"
            },
            "sellerInfo": {
              "name": "Tee Paradise",
              "email": "sales@teeparadise.com",
              "phone": "+1 (800) 555-1234",
              "address": "456 Market St, Suite 200, San Francisco, CA 94105"
            }
          },
        )
  };
}

var randomProducts = [
  {
    'name': "2 In 1 Men's Short Sleeve Shorts Set",
    'images': [
      'https://ng.jumia.is/unsafe/fit-in/680x680/filters:fill(white)/product/68/202776/1.jpg?0636',
      'https://ng.jumia.is/unsafe/fit-in/680x680/filters:fill(white)/product/68/202776/3.jpg?6987',
      'https://ng.jumia.is/unsafe/fit-in/680x680/filters:fill(white)/product/68/202776/4.jpg?6987',
      'https://ng.jumia.is/unsafe/fit-in/680x680/filters:fill(white)/product/68/202776/5.jpg?6987',
      'https://ng.jumia.is/unsafe/fit-in/680x680/filters:fill(white)/product/68/202776/6.jpg?6987'
    ]
  },
  {
    'name': "Shirts For Smart Men Designer - Black",
    'images': [
      'https://ng.jumia.is/unsafe/fit-in/680x680/filters:fill(white)/product/76/7796612/1.jpg?3231'
          'https://ng.jumia.is/unsafe/fit-in/680x680/filters:fill(white)/product/76/7796612/1.jpg?3231'
          'https://ng.jumia.is/unsafe/fit-in/680x680/filters:fill(white)/product/76/7796612/1.jpg?3231'
          'https://ng.jumia.is/unsafe/fit-in/680x680/filters:fill(white)/product/76/7796612/1.jpg?3231'
          'https://ng.jumia.is/unsafe/fit-in/680x680/filters:fill(white)/product/76/7796612/1.jpg?3231'
    ]
  },
  {
    'name': "New Shirts For Smart Men- Black",
    '': [
      'https://ng.jumia.is/unsafe/fit-in/500x500/filters:fill(white)/product/27/9208911/1.jpg?2945',
      'https://ng.jumia.is/unsafe/fit-in/500x500/filters:fill(white)/product/27/9208911/2.jpg?1548',
      'https://ng.jumia.is/unsafe/fit-in/500x500/filters:fill(white)/product/27/9208911/3.jpg?1548',
      'https://ng.jumia.is/unsafe/fit-in/500x500/filters:fill(white)/product/27/9208911/5.jpg?1548',
      'https://ng.jumia.is/unsafe/fit-in/500x500/filters:fill(white)/product/27/9208911/4.jpg?1548'
    ]
  },
  {
    'name': "2-Piece T-shirt And Short-White",
    'images': [
      'https://ng.jumia.is/unsafe/fit-in/500x500/filters:fill(white)/product/74/813698/1.jpg?2336',
      'https://ng.jumia.is/unsafe/fit-in/500x500/filters:fill(white)/product/74/813698/3.jpg?2336',
      'https://ng.jumia.is/unsafe/fit-in/500x500/filters:fill(white)/product/74/813698/4.jpg?2336',
      'https://ng.jumia.is/unsafe/fit-in/500x500/filters:fill(white)/product/74/813698/4.jpg?2336',
      'https://ng.jumia.is/unsafe/fit-in/500x500/filters:fill(white)/product/74/813698/4.jpg?2336',
    ]
  },
  for (int i = 0; i < 10; i++)
    {
      'name': "Summer Men's Loose Short Sleeve Hawaii Beach Shirt - Grey",
      'images': [
        'https://ng.jumia.is/unsafe/fit-in/500x500/filters:fill(white)/product/41/109817/1.jpg?8356',
        'https://ng.jumia.is/unsafe/fit-in/500x500/filters:fill(white)/product/41/109817/2.jpg?8356',
        'https://ng.jumia.is/unsafe/fit-in/500x500/filters:fill(white)/product/41/109817/3.jpg?8356',
        'https://ng.jumia.is/unsafe/fit-in/500x500/filters:fill(white)/product/41/109817/4.jpg?8356',
        'https://ng.jumia.is/unsafe/fit-in/500x500/filters:fill(white)/product/41/109817/5.jpg?8356'
      ]
    },
];
