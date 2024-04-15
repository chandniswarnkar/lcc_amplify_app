import 'package:flutter/material.dart';
import 'package:lcc_flutter_app/models/product_item_model.dart';

class ProductListCardViewItem extends StatelessWidget {
  const ProductListCardViewItem({super.key, required this.productItemsModel});

  final ProductItemModel productItemsModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Container(
        decoration: ShapeDecoration(
          color: Color(0xFFE9ECED),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child:  Column(

            children: [
              Container(
                margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child:Image.asset(
                  productItemsModel.itemImage,
                ),
              ),

              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    productItemsModel.itemNumber,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/images/coin 2.png",
                        fit: BoxFit.fill,
                      ),
                      Text(
                        productItemsModel.coins,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                decoration: ShapeDecoration(
                  color: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Add to Cart',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),

    );
  }
}
