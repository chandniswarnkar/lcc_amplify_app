import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lcc_flutter_app/online_shopping_page.dart';
import 'package:lcc_flutter_app/product_details_page.dart';
import 'package:lcc_flutter_app/productlist_card_view.dart';
import 'package:lcc_flutter_app/start_level_page.dart';

import 'models/product_item_model.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({Key? key}) : super(key: key);

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  final List<ProductItemModel> productItemsModel = [
    ProductItemModel(
        itemNumber: 'Shoe 1', coins: '100', itemImage: 'assets/images/shoe_1.png'),
    ProductItemModel(
        itemNumber: 'Shoe 2', coins: '300', itemImage: 'assets/images/shoe_2.png'),
    ProductItemModel(
        itemNumber: 'Shoe 3', coins: '200', itemImage: 'assets/images/shoe_3.png'),
    ProductItemModel(
        itemNumber: 'Shoe 4', coins: '400', itemImage: 'assets/images/shoe_4.png'),
  ];

  bool _isErrorContainerVisible = false;

  onItemClick(ProductItemModel productItemsModel) {
    setState(() {
      if(productItemsModel.coins !='100'){
        _isErrorContainerVisible = true;
      }else{
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => ProductDetailPage(
                  productItemsModel: productItemsModel,
                )));
      }
    });

  }


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2.9;
    final double itemWidth = size.width / 2;

    double _currentSliderValue = 0;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: [
            SafeArea(
              child: Container(
                margin: EdgeInsets.fromLTRB(25, 10, 25, 20),
                child: Row(children: [

                  Container(
                    padding: const EdgeInsets.only(
                        top: 8, left: 8, right: 8, bottom: 8),
                    decoration: ShapeDecoration(
                      color: const Color(0xFFE9ECED),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6)),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 24,
                          height: 24,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/coin 2.png'),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        const Text(
                          '0',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 15, right: 15),

                      child:
                      LinearProgressIndicator(
                        backgroundColor: Color(0xFFE9ECED),
                        value: _currentSliderValue * 0.01,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.green),


                      ),

                    ),
                  ),

                  GestureDetector(
                      child: Container(
                        width: 34.60,
                        height: 34.60,
                        decoration: const ShapeDecoration(
                          color: Color(0xFFE9ECED),
                          shape: OvalBorder(),
                        ),
                        child: Icon( Icons.close,
                          color: Colors.grey, ),

                      ),
                      onTap: (){
                        setState(() {
                          Navigator.pop(context);
                        });
                      }
                  ),
                ]),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Choose a Product',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 28,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
                height: 0,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Choose a pair of shoes that you \n want to gift to your granddaughter.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.fromLTRB(25, 0, 25, 5),
                child: GridView.builder(
                  itemCount: productItemsModel
                      .length, // Change this to your actual item count
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio:0.75,
                   crossAxisSpacing: 10.0, // Spacing between columns
                  mainAxisSpacing: 10.0,
                     // Number of columns
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        onItemClick(productItemsModel[index]);
                      },
                      child: ProductListCardViewItem(
                          productItemsModel: productItemsModel[index]),
                    );
                  },
                ),
              ),
            ),
            Visibility(
                  visible: _isErrorContainerVisible,
                  child: Container(
                    width: 335,
                    height: 80,
                    margin: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                    padding: const EdgeInsets.fromLTRB(20, 0, 3, 0),
                    decoration: ShapeDecoration(
                      color: const Color(0xFFFBD4CF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child:  Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          width: 235,
                          child: Text(
                            'Insufficient coins. Choose another\nproduct under 100 coins.',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,

                            ),
                          ),
                        ),

                        TextButton(
                          child: Icon( Icons.close,
                            color: Colors.grey, ),
                          onPressed: (){
                            setState(() {
                              _isErrorContainerVisible = false;
                            });
                          },
                        ),


                      ],
                    ),
                  ),
                ),

          ],
        ),
      ),
    );
  }
}
