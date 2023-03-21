import 'package:flutter/material.dart';
import 'package:food_app/config/colors.dart';
import 'package:food_app/providers/product_provider.dart';
import 'package:food_app/providers/user_provider.dart';
import 'package:food_app/screens/product_overview/product_overview.dart';
import 'package:food_app/screens/home/singal_product.dart';
import 'package:food_app/screens/review_cart/review_cart.dart';
import 'package:food_app/screens/search/search.dart';
import 'package:provider/provider.dart';
import 'drawer_side.dart';
import 'package:food_app/screens/my_profile/my_profile.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ProductProvider? productProvider;

  Widget _buildHerbsProduct(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Herbs Seasonings'),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Search(
                        search: productProvider!.getHerbsProductDataList,
                      ),
                    ),
                  );
                },
                child: Text(
                  'view all',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: productProvider!.getHerbsProductDataList.map(
              (herbsProductData) {
                return SingalProduct(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ProductOverview(
                          productId: herbsProductData.productId as String,
                          productPrice: herbsProductData.productPrice as double,
                          productName: herbsProductData.productName as String,
                          productImage: herbsProductData.productImage as String,
                        ),
                      ),
                    );
                  },
                  productId: herbsProductData.productId as String,
                  productPrice: herbsProductData.productPrice as double,
                  productImage: herbsProductData.productImage as String,
                  productName: herbsProductData.productName as String,
                  productUnit:herbsProductData ,
                );
              },
            ).toList(),
            // children: [

            // ],
          ),
        ),
      ],
    );
  }

  Widget _buildFreshProduct(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Fresh Fruits'),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Search(
                        search: productProvider!.getFreshProductDataList,
                      ),
                    ),
                  );
                },
                child: Text(
                  'view all',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: productProvider!.getFreshProductDataList.map(
              (freshProductData) {
                return SingalProduct(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ProductOverview(
                          productId: freshProductData.productId as String,
                          productImage: freshProductData.productImage as String,
                          productName: freshProductData.productName as String,
                          productPrice: freshProductData.productPrice as double,
                        ),
                      ),
                    );
                  },
                  productId: freshProductData.productId as String,
                  productImage: freshProductData.productImage as String,
                  productName: freshProductData.productName as String,
                  productPrice: freshProductData.productPrice as double,
                  productUnit:freshProductData,
                );
              },
            ).toList(),
          ),
        ),
      ],
    );
  }


  Widget _buildRootProduct() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Root Vegetable'),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Search(
                        search: productProvider!.getRootProductDataList,
                      ),
                    ),
                  );
                },
                child: Text(
                  'view all',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: productProvider!.getRootProductDataList.map(
              (rootProductData) {
                return SingalProduct(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ProductOverview(
                          productId: rootProductData.productId as String,
                          productImage: rootProductData.productImage as String,
                          productName: rootProductData.productName as String,
                          productPrice: rootProductData.productPrice as double,
                        ),
                      ),
                    );
                  },
                  productId: rootProductData.productId as String,
                  productImage: rootProductData.productImage as String,
                  productName: rootProductData.productName as String,
                  productPrice: rootProductData.productPrice as double,
                  productUnit: rootProductData,
                );
              },
            ).toList(),
          ),
        ),
      ],
    );
  }

  @override
  void initState() {
    ProductProvider initproductProvider = Provider.of(context, listen: false);
    initproductProvider.fatchHerbsProductData();
    initproductProvider.fatchFreshProductData();
    initproductProvider.fatchRootProductData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    productProvider = Provider.of(context);
    UserProvider userProvider = Provider.of(context);
    userProvider.getUserData();
    return Scaffold(
      drawer: DrawerSide(
        userProvider: userProvider,
      ),
      appBar: AppBar(
        iconTheme: IconThemeData(color: textColor),
        title: Text(
          'Zoggrey',
          style: TextStyle(color: textColor, fontSize: 17),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>
                        Search(search: productProvider!.gerAllProductSearch),
                  ),
                );
              },
              child: CircleAvatar(
                backgroundColor: Color(0xffd6d382),
                radius: 15,
                child: Icon(
                  Icons.search,
                  size: 17,
                  color: textColor,
                ),
              ),
            ),
          ),
        ],
      ),

      /////////////////////// Bottom AppBar //////////////////////
      
  floatingActionButton:FloatingActionButton( 
      onPressed: (){
          Navigator.of(context).push(
          MaterialPageRoute(
          builder: (context) => ReviewCart(),
            ),
          );
      },
      child: Icon(Icons.shopping_cart), 
  ),

  floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
  bottomNavigationBar: BottomAppBar( 
    color:Colors.redAccent,
    shape: CircularNotchedRectangle(), //shape of notch
    notchMargin: 5, //notche margin between floating button and bottom appbar
    child: Row( //children inside bottom appbar
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        IconButton(icon: Icon(Icons.home, color: Colors.black,), onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => HomeScreen(),
            ),
          );
        },),
        IconButton(icon: Icon(Icons.account_circle, color: Colors.white,), onPressed: () {
          // Navigator.of(context).push(
          //         MaterialPageRoute(
          //           builder: (context) => MyProfile(userProvider:widget.userProvider as UserProvider),
          //         ),
          //       );
        },),
        Padding(
          padding: EdgeInsets.only(right:90),
          child:IconButton(icon: Icon(Icons.favorite, color: Colors.white,), onPressed: () {},),
        )
      ],
    ),
  ),
      ////////////////////////////////////////////////////////////////////////////
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: ListView(
          children: [
            Container(
              height: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQi0Xg-k622Sbztlrb-L1o1CAla3zCbVc2lUw&usqp=CAU'),
                ),
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      child: Column(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(right: 130, bottom: 10),
                            child: Container(
                              height: 50,
                              width: 100,
                              decoration: BoxDecoration(
                                color: Color(0xffd1ad17),
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(50),
                                  bottomLeft: Radius.circular(50),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  'Vegi',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    shadows: [
                                      BoxShadow(
                                          color: Colors.green,
                                          blurRadius: 10,
                                          offset: Offset(3, 3))
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            '30% Off',
                            style: TextStyle(
                                fontSize: 40,
                                color: Colors.green[100],
                                fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text(
                              'On all vegetables products',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                ],
              ),
            ),
            _buildHerbsProduct(context),
            _buildFreshProduct(context),
            _buildRootProduct(),
          ],
        ),
      ),
    );
  }
}