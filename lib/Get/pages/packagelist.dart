import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../package_controller/controller.dart';
import 'detailpage.dart';

class packagelist extends StatelessWidget {
  const packagelist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var packcontroller = Get.put(Packagecontroller());
    return SafeArea(
      child: Scaffold(body: Container(
          width: double.maxFinite,
          child: Obx(()=>
              packcontroller.isloading.value==true
                  ? Center(child: CircularProgressIndicator())
              :ListView.builder(
                shrinkWrap: true,
                itemCount: packcontroller.packagelist?.data.length,
                itemBuilder: (context, index) => Card(child: ListTile(
                  onTap: () async {
                    await packcontroller.function2(packcontroller.packagelist?.data[index].categoryId);
                    Get.to(package_details(packageid:"${packcontroller.packagelist?.data[index].categoryId}"));
                  },
                  trailing: Text("${packcontroller.packagelist?.data[index].status}"),
                    subtitle: Text("${packcontroller.packagelist?.data[index].categoryDescription}",overflow: TextOverflow.ellipsis,maxLines: 1),
                    title: Text("${packcontroller.packagelist?.data[index].categoryTitle}"))),),
          )),),
    );
  }
}
 