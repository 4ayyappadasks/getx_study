import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../package_controller/controller.dart';

class package_details extends StatelessWidget {
  const package_details({Key? key,
  this.packageid}) : super(key: key);
  final packageid;

  @override
  Widget build(BuildContext context) {
    var detailcontroller = Get.put(Packagecontroller());
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Text("${detailcontroller.packageDetails?.data.categoryTitle}"),
          Text(
              textAlign: TextAlign.justify,
              "${detailcontroller.packageDetails?.data.categoryDescription}"),
        ],),
      ),
    );
  }
}
