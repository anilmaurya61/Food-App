class DeliveryAddressModel {
  String? fullName;
  String? mobileNo;
  String? alternateMobileNo;
  String? landMark;
  String? city;
  String? address;
  String? pinCode;
  String? addressType;

  DeliveryAddressModel({
    this.addressType,
    this.address,
    this.alternateMobileNo,
    this.city,
    this.fullName,
    this.landMark,
    this.mobileNo,
    this.pinCode,
  });
}
