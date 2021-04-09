class MyIncomeModel {
  Data data;

  MyIncomeModel({this.data});

  MyIncomeModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  int total;
  List<Orders> orders;

  Data({this.total, this.orders});

  Data.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    if (json['orders'] != null) {
      orders = new List<Orders>();
      json['orders'].forEach((v) {
        orders.add(new Orders.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    if (this.orders != null) {
      data['orders'] = this.orders.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Orders {
  int id;
  int productTotalSum;

  Orders({this.id, this.productTotalSum});

  Orders.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productTotalSum = json['product_total_sum'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_total_sum'] = this.productTotalSum;
    return data;
  }
}
