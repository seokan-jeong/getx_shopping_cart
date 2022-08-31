import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:shopping_cart/model/product.dart';

class CartController extends GetxController{
  static CartController get to => Get.find<CartController>();
  var cartItems = <Product>[].obs;
  double get totalPrice => cartItems.fold(0, (e, item) => e + item.price);
  int get count => cartItems.length;

  void addToItem(Product product){
    cartItems.add(product);
  }
}