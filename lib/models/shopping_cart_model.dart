class ShoppingCartModel {
  String goodsName;
  String goodsId;
  String goodsImg;
  double oriPrice;
  double price;
  int count;
  bool isChecked;

  ShoppingCartModel({this.goodsName, this.goodsId, this.goodsImg, this.oriPrice, this.price, this.count, this.isChecked});

  ShoppingCartModel.fromJson(Map<String, dynamic> json) {
    goodsName = json['goodsName'];
    goodsId = json['goodsId'];
    goodsImg = json['goodsImg'];
    oriPrice = json['oriPrice'] + 0.0;
    price = json['price'] + 0.0;
    count = json['count'];
    isChecked = json['isChecked'];
  }

  static List<ShoppingCartModel> fromJsonList(dynamic maps) {
    List<ShoppingCartModel> list = List(maps.length);
    for (int i = 0; i < maps.length; i++) {
      list[i] = ShoppingCartModel.fromJson(maps[i]);
    }
    return list;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['goodsName'] = this.goodsName;
    data['goodsId'] = this.goodsId;
    data['goodsImg'] = this.goodsImg;
    data['oriPrice'] = this.oriPrice;
    data['price'] = this.price;
    data['count'] = this.count;
    data['isChecked'] = this.isChecked;
    return data;
  }
}
