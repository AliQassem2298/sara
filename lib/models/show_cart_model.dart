class ShowCartModel {
  final int status;
  final String message;
  final List<OrderDetail> data;

  ShowCartModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory ShowCartModel.fromJson(Map<String, dynamic> json) {
    List<OrderDetail> orderDetails = [];
    for (var detail in (json['data'] as List<dynamic>)) {
      orderDetails.add(OrderDetail.fromJson(detail));
    }
    return ShowCartModel(
      status: json['status'] as int,
      message: json['message'] as String,
      data: orderDetails,
    );
  }
}

class OrderDetail {
  final int orderDetailId;
  final int productId;
  final String name;
  final String description;
  final double price;
  final int quantityWant;
  final int totalQuantity;
  final String image;

  OrderDetail({
    required this.orderDetailId,
    required this.productId,
    required this.name,
    required this.description,
    required this.price,
    required this.quantityWant,
    required this.totalQuantity,
    required this.image,
  });

  factory OrderDetail.fromJson(Map<String, dynamic> json) {
    return OrderDetail(
      orderDetailId: json['order_detail_id'] as int,
      productId: json['product_id'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
      price: json['price'].toDouble(),
      quantityWant: json['quantity_want'] as int,
      totalQuantity: json['total_quantity'] as int,
      image: json['image'] as String,
    );
  }
}
