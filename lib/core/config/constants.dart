import 'package:flutter/material.dart';

import '../../main.dart';

class Constants{
  static var mediaQuery=MediaQuery.of(navigateKey.currentState!.context).size;
  static var theme =Theme.of(navigateKey.currentState!.context);
  static var baseUrl = "https://route-ecommerce.onrender.com";
  static var myToken = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2MTA2OGVhMWZjMzljMDAzNDRmM2VlYiIsIm5hbWUiOiJTYWVlZCBtZWxpZ3kiLCJyb2xlIjoidXNlciIsImlhdCI6MTcxMjUwMTAzNCwiZXhwIjoxNzIwMjc3MDM0fQ.K9MCeFMRkiq36vWekQcFA4NpaT6CXxuKYZ1v14bcl4o";
}