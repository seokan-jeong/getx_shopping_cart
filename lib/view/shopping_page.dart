import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_cart/controller/cart_controller.dart';
import 'package:shopping_cart/controller/shopping_controller.dart';

class ShoppingPage extends StatelessWidget {
  ShoppingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ShoppingController());
    Get.put(CartController());

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.red,
        body: Column(
          children: [
            Expanded(
              child: Obx(
                () => ListView.builder(
                    itemCount: ShoppingController.to.products.length,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: EdgeInsets.all(12),
                        child: Padding(
                          padding: EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        ShoppingController
                                            .to.products[index].productName,
                                        style: TextStyle(fontSize: 24),
                                      ),
                                      Text(ShoppingController.to.products[index]
                                          .productDescription),
                                    ],
                                  ),
                                  Text(
                                    '\$${ShoppingController.to.products[index].price}',
                                    style: TextStyle(fontSize: 24),
                                  ),
                                ],
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    CartController.to.addToItem(
                                        ShoppingController.to.products[index]);
                                  },
                                  child: Text('Add to cart'))
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Obx(
              () => Text(
                'Total amount: \$${CartController.to.totalPrice}',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
            SizedBox(
              height: 100,
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          label: Obx(
            () => Text(
              '${CartController.to.count}',
              style: TextStyle(fontSize: 20),
            ),
          ),
          icon: Icon(Icons.add_shopping_cart_rounded),
          backgroundColor: Colors.black,
        ),
      ),
    );
  }
}
