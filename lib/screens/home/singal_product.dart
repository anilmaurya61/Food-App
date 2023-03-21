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
              color: Color(0xffd9dad9),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                                          SizedBox(height: 20.0),
                                          Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: widget.productUnit!.productUnit!.map<Widget>((data) {
                                              bool isSelected = data == unitData || (unitData == null && data == widget.productUnit!.productUnit![0]);
                                              return InkWell(
                                                onTap: () async {
                                                  setState(() {
                                                    unitData = data;
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
                                                    children: <Widget>[
                                                      Expanded(
                                                        child: Align(
                                                          alignment: Alignment.centerLeft,
                                                          child: Text(
                                                            data,
                                                            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Align(
                                                          alignment: Alignment.centerRight,
                                                          child: Text(
                                                            '₹10',
                                                            textAlign: TextAlign.right,
                                                            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Center(
                                                          child: Row(
                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                            children: [
                                                              if (isSelected)
                                                                Icon(
                                                                  Icons.check,
                                                                  color: Colors.green,
                                                                ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
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
