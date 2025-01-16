class ShowOrdersModel {
  final int statusCode;
  final String message;
  final List<Order> data;

  ShowOrdersModel({
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory ShowOrdersModel.fromJson(Map<String, dynamic> json) {
    final List<dynamic> orderData =
        json['data'] ?? []; //Handle potential null 'data'
    return ShowOrdersModel(
      statusCode: json['status'] as int,
      message: json['message'] as String,
      data: orderData.map((e) => Order.fromJson(e)).toList(),
    );
  }
}

class Order {
  final int id;
  final dynamic totalPrice;
  final int userId;
  final String status;
  final DateTime orderDate; //Using DateTime for date parsing

  Order({
    required this.id,
    required this.totalPrice,
    required this.userId,
    required this.status,
    required this.orderDate,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'] as int,
      totalPrice: json['total_price']  ,
      userId: json['user_id'] as int,
      status: json['status'] as String,
      orderDate: DateTime.parse(json['order_date']), //Parse the date string
    );
  }
}
