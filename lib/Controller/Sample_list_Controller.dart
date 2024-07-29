import 'package:get/get.dart';

class SampleListController extends GetxController {
  var sampleList = [].obs;

  insertDataIntoList(String value) {
    sampleList.add(value);
  }

  deleteDataFromList(String value){
    sampleList.remove(value);
  }
}