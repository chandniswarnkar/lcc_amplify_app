import 'package:flutter/material.dart';
import 'package:lcc_flutter_app/online_shopping_page.dart';
import 'package:lcc_flutter_app/product_details_page.dart';
import 'package:lcc_flutter_app/productlist_card_view.dart';

import 'models/product_item_model.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({Key? key}) : super(key: key);

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {


  final List<ProductItemModel> productItemsModel = [
    ProductItemModel(
       itemNumber: 'Shoe 1',
        coins: '100',
        itemImage: 'assets/shoo1.jpg'),

    ProductItemModel(
        itemNumber: 'Shoe 2',
        coins: '300',
        itemImage: 'assets/shoo1.jpg'),

    ProductItemModel(
        itemNumber: 'Shoe 3',
        coins: '200',
        itemImage: 'assets/shoo1.jpg'),

    ProductItemModel(
        itemNumber: 'Shoe 4',
        coins: '400',
        itemImage: 'assets/shoo1.jpg'),

  ];
  onItemClick(ProductItemModel productItemsModel) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) =>  ProductDetailPage(productItemModel: productItemsModel,)));
  }

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 3;
    final double itemWidth = size.width / 2;

    double _currentSliderValue = 20;

    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [

            SafeArea(
              child: Row(children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 60,
                  height: 40,
                  margin: const EdgeInsets.all(20),
                  padding:
                  const EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 8),
                  decoration: ShapeDecoration(
                    color: Color(0xFFE9ECED),
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
                            image:
                            NetworkImage("https://via.placeholder.com/24x24"),
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
                  child: Slider(
                    value: _currentSliderValue,
                    max: 100,
                    divisions: 5,
                    // label: _currentSliderValue.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        _currentSliderValue = value;
                      });
                    },
                  ),
                ),
                Container(
                  width: 34.60,
                  height: 34.60,
                  margin: const EdgeInsets.all(20),
                  decoration: const ShapeDecoration(
                    color: Colors.grey,
                    shape: OvalBorder(),
                  ),
                ),
              ]),
            ),
            const SizedBox(
              height: 20,
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

             // margin: const EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: GridView.builder(
                itemCount: productItemsModel.length, // Change this to your actual item count
                gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: (itemWidth / itemHeight),// Number of columns
                 /* crossAxisSpacing: 10.0, // Spacing between columns
                  mainAxisSpacing: 10.0, // Spacing between rows*/
                ),
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      onItemClick(productItemsModel[index]);
                    },
                    child: ProductListCardViewItem(productItemsModel:productItemsModel[index]),
                  );

                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
