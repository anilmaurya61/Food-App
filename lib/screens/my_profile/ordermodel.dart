class Order {
  final int id;
  final double total;
  final List<String> items;

  Order({required this.id, required this.total, required this.items});

  factory Order.fromJson(Map<String, dynamic> json) {
    List<String> items = [];
    for (var item in json['items']) {
      items.add(item as String);
    }

    return Order(
      id: json['id'] as int,
      total: json['total'] as double,
      items: items,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'total': total,
      'items': items,
    };
  }
}


