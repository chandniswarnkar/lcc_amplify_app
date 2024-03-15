import 'package:flutter/material.dart';
import 'package:lcc_flutter_app/models/product_item_model.dart';

class ProductListCardViewItem extends StatelessWidget {

  const ProductListCardViewItem(  {super.key,required this.productItemsModel});

  final ProductItemModel productItemsModel;


  @override
  Widget build(BuildContext context) {

    return
      Container(
        margin: const EdgeInsets.fromLTRB(20, 0, 5, 5),

          alignment: Alignment.center,
          child: Card(
            color:  const Color(0xFFE9ECED),
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Column(
                children: [
                  SizedBox(
                        child: Image.asset(productItemsModel.itemImage,fit: BoxFit.fill  ),
                  ),

                   Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
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
                   Padding(
                    padding:  EdgeInsets.fromLTRB(10, 0, 10, 2),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                        Image.asset("assets/images/coin 2.png",fit: BoxFit.fill,),
                           Text(
                             productItemsModel.coins,
                            style: TextStyle(
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



                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 5, 10, 2),
                    child: Container(
                      width: 140,
                      height: 38,

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
                  ),


                ],
              ),
            ),
          ),
      );



  }
}
