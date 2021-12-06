import 'package:get/get.dart';
import 'package:whole_snack/core/model/data_model/add_address_model.dart';
import 'package:whole_snack/core/model/data_model/region_model.dart';
import 'package:whole_snack/core/model/service_model/http_custom_response.dart';
import 'package:whole_snack/core/model/service_model/http_get_result.dart';
import 'package:whole_snack/core/repos/add_address_repo.dart';
import 'package:whole_snack/core/repos/get_all_region_repo.dart';


class AddAddressPageController extends GetxController {
 RxList<RegionModel> townshipList = RxList();
 RegionModel ? choosenValue;
 RxBool isSuccessful = RxBool(false) as RxBool;

 late String regionId;
late GetAllRegionRepo getAllRegion;
late AddAddressRepo _addAddressRepo;

  AddAddressPageController() {


    getAllRegion =  Get.put(GetAllRegionRepo());
    _addAddressRepo = Get.put(AddAddressRepo());



    addTownshipAddress();
  }

  addTownshipAddress() async  {

    HttpGetResult<RegionModel>  regionResult = await getAllRegion.getTownshipList();

    townshipList.addAll(regionResult.mData);

    update();
  }


  changeDropDownValue(RegionModel model) {

   int index = townshipList.indexOf(model);
   choosenValue = townshipList[index];
   print('hahahah $choosenValue');

   regionId = townshipList[index].regId;



    update();
  }

  addNewAddress(AddAddressModel model) async {

    HttpCustomResponse response = await _addAddressRepo.addAddresData(model);

    print("this si status code ${response.stateCode}");
    isSuccessful.value = response.isSuccessful;
  }
}
