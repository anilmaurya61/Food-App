import 'package:flutter/material.dart';
import 'package:food_app/config/colors.dart';
import 'package:food_app/models/product_model.dart';
import 'package:food_app/widgets/count.dart';
import 'package:food_app/widgets/product_unit.dart';

class SingalProduct extends StatefulWidget {
  final String? productImage;
  final String? productName;
  final double? productPrice;
  final VoidCallback? onTap;
  final String? productId;
  final ProductModel? productUnit;
  SingalProduct(
      {this.productId,
      this.productImage,
      this.productName,
      this.productUnit,
      this.onTap,
      this.productPrice});

  @override
  _SingalProductState createState() => _SingalProductState();
}

class _SingalProductState extends State<SingalProduct> {
  var unitData;
  var firstValue;
  // double getDiscountPercentage() {
  //   // calculate the discount percentage based on the original and discounted prices
  //   double originalPrice = widget.productPrice ?? 0.0;
  //   double discountedPrice = widget.productUnit?.discountedPrice ?? originalPrice;
  //   return (originalPrice - discountedPrice) / originalPrice * 100;
  // }
  Widget buildProductUnitWidget(String unit, bool isSelected) {
    return InkWell(
      onTap: () {
        setState(() {
          unitData = unit;
        });
        Navigator.of(context).pop();
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 2.0),
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 2.0,
              spreadRadius: 1.0,
              offset: Offset(0.0, 2.0),
            ),
          ],
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Text(
                unit,
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(width: 12.0),
            Text(
              '25',
              style: TextStyle(
                fontSize: 18.0,
                decoration: TextDecoration.lineThrough,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
            SizedBox(width: 6.0),
            Text(
              '₹10',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
            ),
            SizedBox(width: 12.0),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12.0),
                  topRight: Radius.circular(12.0),
                  bottomLeft: Radius.circular(12.0),
                ),
              ),
              child: Text(
                '50% off',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(width: 12.0),
            isSelected ? Icon(Icons.check, color: Colors.green) : SizedBox(),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    widget.productUnit!.productUnit!.firstWhere((element) {
      setState(() {
        firstValue = element;
      });
      return true;
    });
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: 10),
            height: 230,
            width: 165,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Container(
                        height: 150,
                        padding: EdgeInsets.all(5),
                        width: double.infinity,
                        child: Image.network(
                          widget.productImage as String,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      left: 0,
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                        child: Text(
                          '${"100"}% OFF',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.productName as String,
                          style: TextStyle(
                            color: textColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '${widget.productPrice}\$/${unitData == null ? firstValue : unitData}',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: ProductUnit(
                                onTap: () {
                                  showModalBottomSheet(
                                      context: context,
                                      builder: (context) {
                                        return Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: widget
                                                  .productUnit!.productUnit!
                                                  .map<Widget>((data) {
                                                bool isSelected = data ==
                                                        unitData ||
                                                    (unitData == null &&
                                                        data ==
                                                            widget.productUnit!
                                                                .productUnit![0]);
                                                return buildProductUnitWidget(data, isSelected);
                                              }).toList(),
                                            ),
                                          ],
                                        );
                                      });
                                },
                                title: unitData == null ? firstValue : unitData,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Count(
                              productId: widget.productId,
                              productImage: widget.productImage,
                              productName: widget.productName,
                              productPrice: widget.productPrice,
                              productUnit:
                                  unitData == null ? firstValue : unitData,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


 // Positioned(
    //   top: 0,
    //   left: 0,
    //   child: Container(
    //     padding: EdgeInsets.all(5),
    //     decoration: BoxDecoration(
    //       color: Colors.red,
    //       borderRadius: BorderRadius.only(
    //         topLeft: Radius.circular(10),
    //         bottomRight: Radius.circular(20),
    //       ),
    //     ),
    //     child: Text(
    //       '${"100"}% OFF',
    //       style: TextStyle(
    //         color: Colors.white,
    //         fontWeight: FontWeight.bold,
    //         fontSize: 12,
    //       ),
    //     ),
    //   ),
    // ),