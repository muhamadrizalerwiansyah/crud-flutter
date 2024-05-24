import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../providers/home_provider.dart';

class HomeController extends GetxController {
  final provider = Get.find<HomeProvider>();

  final titleC = TextEditingController();
  final descC = TextEditingController();
  final searchC = TextEditingController();

  var dataList = List<dynamic>.empty().obs;

  final count = 0.obs;
  final statusData = false.obs;
  @override
  void onInit() {
    super.onInit();
    print("tes init");
    getData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void getData() {
    statusData.value = false;
    provider.getData().then((value) {
      if (value.statusCode == 200) {
        dataList.clear();
        print(value.data);
        dataList.addAll(value.data);
        statusData.value = true;
      } else {
        EasyLoading.showInfo("Gagal");
        statusData.value = true;
      }
    });
  }

  void createData() async {
    try {
      provider.save(titleC.text, descC.text).then((value) {
        if (value.statusCode == 201) {
          EasyLoading.showSuccess("Berhasil");
          getData();
          Get.back();
        } else {
          EasyLoading.showInfo("Gagal");
          Get.back();
          print("gagal");
        }
      });
    } catch (e) {
      EasyLoading.showInfo("Gagal");
      Get.back();
      print("gagal");
    }
  }

  void updateData(int id) async {
    try {
      provider.update(id, titleC.text, descC.text).then((value) {
        if (value.statusCode == 200) {
          EasyLoading.showSuccess("Berhasil");
          getData();
          Get.back();
        } else {
          EasyLoading.showInfo("Gagal");
          Get.back();
          print("gagal");
        }
      });
    } catch (e) {
      EasyLoading.showInfo("Gagal");
      Get.back();
      print("gagal");
    }
  }

  void deleteData(int id) async {
    try {
      provider.deleteData(id).then((value) {
        if (value.statusCode == 200) {
          EasyLoading.showSuccess("Berhasil");
          getData();
          Get.back();
        } else {
          EasyLoading.showInfo("Gagal");
          Get.back();
          print("gagal");
        }
      });
    } catch (e) {
      EasyLoading.showInfo("Gagal");
      Get.back();
      print("gagal");
    }
  }
}
