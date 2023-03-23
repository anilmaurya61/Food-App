import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_app/models/delivery_address_model.dart';
import 'package:food_app/models/review_cart_model.dart';
import 'package:location/location.dart';

class CheckoutProvider with ChangeNotifier {
  bool isloadding = false;

  TextEditingController fullName = TextEditingController();
  TextEditingController mobileNo = TextEditingController();
  TextEditingController alternateMobileNo = TextEditingController();
  TextEditingController landmark = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController pincode = TextEditingController();
  // TextEditingController setLoaction = TextEditingController();
  LocationData? setLoaction;

  void validator(context, myType) async {
    if (fullName.text.isEmpty) {
      Fluttertoast.showToast(msg: "Full Name is empty");
    } else if (mobileNo.text.isEmpty) {
      Fluttertoast.showToast(msg: "mobileNo is empty");
    }else if (city.text.isEmpty) {
      Fluttertoast.showToast(msg: "city is empty");
    } else if (address.text.isEmpty) {
      Fluttertoast.showToast(msg: "Address is empty");
    } else if (pincode.text.isEmpty) {
      Fluttertoast.showToast(msg: "Pincode is empty");
    } else if (setLoaction == null) {
      Fluttertoast.showToast(msg: "setLoaction is empty");
    } else {
      isloadding = true;
      notifyListeners();
      await FirebaseFirestore.instance
          .collection("AddDeliverAddress")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set({
        "fullName": fullName.text,
        "mobileNo": mobileNo.text,
        "alternateMobileNo": alternateMobileNo.text,
        "landmark": landmark.text,
        "city": city.text,
        "address": address.text,
        "pincode": pincode.text,
        "addressType": myType.toString(),
        "longitude": setLoaction!.longitude,
        "latitude": setLoaction!.latitude,
      }).then((value) async {
        isloadding = false;
        notifyListeners();
        await Fluttertoast.showToast(msg: "Add your deliver address");
        Navigator.of(context).pop();
        notifyListeners();
      });
      notifyListeners();
    }
  }

  List<DeliveryAddressModel> deliveryAdressList = [];
  getDeliveryAddressData() async {
    List<DeliveryAddressModel> newList = [];

    DeliveryAddressModel deliveryAddressModel;
    DocumentSnapshot _db = await FirebaseFirestore.instance
        .collection("AddDeliverAddress")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    if (_db.exists) {
      deliveryAddressModel = DeliveryAddressModel(
        fullName: _db.get("fullName"),
        addressType: _db.get("addressType"),
        address: _db.get("address"),
        alternateMobileNo: _db.get("alternateMobileNo"),
        city: _db.get("city"),
        landMark: _db.get("landmark"),
        mobileNo: _db.get("mobileNo"),
        pinCode: _db.get("pincode"),
      );
      newList.add(deliveryAddressModel);
      notifyListeners();
    }

    deliveryAdressList = newList;
    notifyListeners();
  }

  List<DeliveryAddressModel> get getDeliveryAddressList {
    return deliveryAdressList;
  }

////// Order /////////

  addPlaceOderData({
    required List<ReviewCartModel> oderItemList,
    var subTotal,
    var address,
    var shipping,
  }) async {
    FirebaseFirestore.instance
        .collection("Order")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("MyOrders")
        .doc()
        .set(
      {
        "subTotal": "1234",
        "Shipping Charge": "",
        "Discount": "10",
        "orderItems": oderItemList
            .map((e) => {
                  "orderTime": DateTime.now(),
                  "orderImage": e.cartImage,
                  "orderName": e.cartName,
                  "orderUnit": e.cartUnit,
                  "orderPrice": e.cartPrice,
                  "orderQuantity": e.cartQuantity
                })
            .toList(),
        // "address": address
        //     .map((e) => {
        //           "orderTime": DateTime.now(),
        //           "orderImage": e.cartImage,
        //           "orderName": e.cartName,
        //           "orderUnit": e.cartUnit,
        //           "orderPrice": e.cartPrice,
        //           "orderQuantity": e.cartQuantity
        //         })
        //     .toList(),
      },
    );
  }
}
