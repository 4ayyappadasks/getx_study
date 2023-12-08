// import 'package:get/get.dart';
// import 'package:getx_study/Get/package_controller/packagelist_model.dart';
// import 'package:http/http.dart' as http;
//
//
// class Packagecontroller extends GetxController
// {
//   Packagelist?packagelist;
//   var isloading = true.obs;
//   //create method
//   method1()async{
//     Uri url = Uri.parse("https://ltsdemo.theamsive.com/api/en/category");
//     var responce = await http.get(url,
//       headers: {"Authorization":"Bearer 1257|4KnOizdq8gcSCZZciz5R2YZdJ0UiPIeFEB3xMpQV"},);
//     if(responce.statusCode==200)
//       {
//         var data=packagelistFromJson(responce.body);
//         packagelist=data;
//         print("packlist :${packagelist}");
//         print(responce.body);
//         isloading.value=false;
//       }
//     else
//       {
//         print("no data found");
//       }
//   }
//   @override
//   void onInit() {
//     method1();
//     super.onInit();
//   }
// }

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:getx_study/Get/package_controller/packagelist_model.dart';
import 'package:http/http.dart' as http;
import 'package_details_model.dart';

class Packagecontroller extends GetxController {
  Packagelist?packagelist;
  PackageDetails?packageDetails;
  var isloading = true.obs;
  function1() async {
    var response = await http
        .get(Uri.parse("https://ltsdemo.theamsive.com/api/en/category"),
    headers: {
      "Authorization":"Bearer 1257|4KnOizdq8gcSCZZciz5R2YZdJ0UiPIeFEB3xMpQV"
    });
    if(response.statusCode==200)
      {
        var data  = packagelistFromJson(response.body);
        packagelist = data;
        isloading.value= false;
      }
    else
    {
      print("no data found");
    }
  }

  function2(category_id) async
  {
    var responce2 = await http.get(Uri.parse("https://ltsdemo.theamsive.com/api/en/categorysingle/${category_id}"),
    headers: {
      "Authorization":"Bearer 1257|4KnOizdq8gcSCZZciz5R2YZdJ0UiPIeFEB3xMpQV"
    });
    print("http ${"https://ltsdemo.theamsive.com/api/en/categorysingle/${category_id}"}");
    print("responce2 = ${responce2.body}");
    if(responce2.statusCode==200)
      {
        var data = packageDetailsFromJson(responce2.body);
        packageDetails = data;
      }
    else
      {
        print("no data ");
      }
  }
  @override
  void onInit() {
    function1();
    super.onInit();
  }
}
