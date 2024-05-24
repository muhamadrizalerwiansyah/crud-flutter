import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tes_crud/configs/theme.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(height: 50.h),
              searchSection(size),
              SizedBox(height: 20.h),
              Obx(() => (!controller.statusData.value)
                  ? shimmer(size)
                  : ListView.builder(
                      itemCount: controller.dataList.length,
                      scrollDirection: Axis.vertical,
                      padding: const EdgeInsets.only(top: 0),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext ctxt, int index) {
                        dynamic item = controller.dataList[index];
                        return item["title"]
                                .toLowerCase()
                                .contains(controller.searchC.text)
                            ? ItemListWidget(
                                size: size,
                                title: item["title"],
                                desc: item["body"],
                                update: () async {
                                  controller.titleC.text = item["title"];
                                  controller.descC.text = item["body"];
                                  Get.bottomSheet(Container(
                                    height: 380.h,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(18))),
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: 20.h,
                                        ),
                                        SizedBox(
                                          width: size.width,
                                          child: Text(
                                            "Update",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w700,
                                                fontSize: 14),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20.h,
                                        ),
                                        LabelForm(
                                          title: "Title",
                                          isRequired: true,
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        TextFormField(
                                          controller: controller.titleC,
                                          decoration: Style()
                                              .inputDecoration()
                                              .copyWith(
                                                  hintText: "Title",
                                                  hintStyle: TextStyle(
                                                      fontSize: 12,
                                                      color:
                                                          Color(0xFF919EAB))),
                                        ),
                                        SizedBox(height: 10.h),
                                        LabelForm(
                                          title: "Description",
                                          isRequired: true,
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        TextFormField(
                                          controller: controller.descC,
                                          maxLines: 5,
                                          decoration: Style()
                                              .inputDecoration()
                                              .copyWith(
                                                  hintText: "Description",
                                                  hintStyle: TextStyle(
                                                      fontSize: 12,
                                                      color:
                                                          Color(0xFF919EAB))),
                                        ),
                                        SizedBox(height: 20.h),
                                        SizedBox(
                                          width: size.width,
                                          child: Row(
                                            children: [
                                              Expanded(
                                                  flex: 1,
                                                  child: PrimaryButton(
                                                    title: "Batal",
                                                    isDisabled: true,
                                                    textColor: Colors.white,
                                                    onClick: () {
                                                      Get.back();
                                                    },
                                                  )),
                                              SizedBox(
                                                width: 10.w,
                                              ),
                                              Expanded(
                                                  flex: 1,
                                                  child: PrimaryButton(
                                                      title: "Simpan Perubahan",
                                                      isDisabled: false,
                                                      onClick: () {
                                                        controller.updateData(
                                                            item["id"]);
                                                      }))
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ));
                                },
                                delete: () async {
                                  Get.dialog(
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 40),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(20),
                                              ),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(20.0),
                                              child: Material(
                                                child: Column(
                                                  children: [
                                                    Text(
                                                      "Hapus Data ini",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w700),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                    const SizedBox(height: 15),
                                                    SizedBox(
                                                      width: size.width,
                                                      child: Text(
                                                        "Apakah kamu yakin ingin menghapus data ini dari daftar data list kamu??",
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 13,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w300),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    ),
                                                    const SizedBox(height: 20),
                                                    //Buttons
                                                    SizedBox(
                                                      width: size.width,
                                                      child: Row(
                                                        children: [
                                                          Expanded(
                                                              flex: 1,
                                                              child:
                                                                  PrimaryButton(
                                                                title: "Batal",
                                                                isDisabled:
                                                                    true,
                                                                textColor:
                                                                    Colors
                                                                        .white,
                                                                onClick: () {
                                                                  Get.back();
                                                                },
                                                              )),
                                                          SizedBox(
                                                            width: 10.w,
                                                          ),
                                                          Expanded(
                                                              flex: 1,
                                                              child:
                                                                  PrimaryButton(
                                                                      title:
                                                                          "Hapus",
                                                                      isDisabled:
                                                                          false,
                                                                      onClick:
                                                                          () {
                                                                        controller
                                                                            .deleteData(item["id"]);
                                                                      }))
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              )
                            : Container();
                      })),
            ],
          ),
        ),
        floatingActionButton: InkWell(
            onTap: () async {
              controller.titleC.clear();
              controller.descC.clear();
              Get.bottomSheet(Container(
                height: 380.h,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(18))),
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    SizedBox(
                      width: size.width,
                      child: Text(
                        "Tambah",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 14),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    LabelForm(
                      title: "Title",
                      isRequired: true,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      controller: controller.titleC,
                      decoration: Style().inputDecoration().copyWith(
                          hintText: "Title",
                          hintStyle: TextStyle(
                              fontSize: 12, color: Color(0xFF919EAB))),
                    ),
                    SizedBox(height: 10.h),
                    LabelForm(
                      title: "Description",
                      isRequired: true,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      controller: controller.descC,
                      maxLines: 5,
                      decoration: Style().inputDecoration().copyWith(
                          hintText: "Description",
                          hintStyle: TextStyle(
                              fontSize: 12, color: Color(0xFF919EAB))),
                    ),
                    SizedBox(height: 20.h),
                    SizedBox(
                      width: size.width,
                      child: Row(
                        children: [
                          Expanded(
                              flex: 1,
                              child: PrimaryButton(
                                title: "Batal",
                                isDisabled: true,
                                textColor: Colors.white,
                                onClick: () {
                                  Get.back();
                                },
                              )),
                          SizedBox(
                            width: 10.w,
                          ),
                          Expanded(
                              flex: 1,
                              child: PrimaryButton(
                                  title: "Simpan",
                                  isDisabled: false,
                                  onClick: () {
                                    controller.createData();
                                  }))
                        ],
                      ),
                    ),
                  ],
                ),
              ));
            },
            child: Container(
              width: 150.w,
              height: 40.h,
              decoration: BoxDecoration(
                  color: Color(0xFF103b87),
                  boxShadow: const [
                    BoxShadow(
                        color: Color.fromARGB(255, 173, 195, 255),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: Offset.zero),
                  ],
                  borderRadius: BorderRadius.circular(30)),
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Tambah",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(width: 10.w),
                      InkWell(
                        onTap: () {},
                        child: Icon(
                          Icons.add,
                          size: 20,
                          color: Colors.white,
                        ),
                      )
                    ],
                  )),
            )));
  }

  Shimmer shimmer(Size size) {
    return Shimmer.fromColors(
      baseColor: Color.fromARGB(184, 225, 225, 225),
      highlightColor: Colors.white,
      loop: 200,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
            child: Container(
              width: size.width,
              height: 150.h,
              decoration: BoxDecoration(
                  color: Color(0xFFC4CDD5),
                  boxShadow: const [
                    BoxShadow(
                        color: Color.fromARGB(255, 236, 236, 236),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: Offset(0, 1) // Shadow position
                        ),
                  ],
                  borderRadius: BorderRadius.circular(18)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
            child: Container(
              width: size.width,
              height: 150.h,
              decoration: BoxDecoration(
                  color: Color(0xFFC4CDD5),
                  boxShadow: const [
                    BoxShadow(
                        color: Color.fromARGB(255, 236, 236, 236),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: Offset(0, 1) // Shadow position
                        ),
                  ],
                  borderRadius: BorderRadius.circular(18)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
            child: Container(
              width: size.width,
              height: 150.h,
              decoration: BoxDecoration(
                  color: Color(0xFFC4CDD5),
                  boxShadow: const [
                    BoxShadow(
                        color: Color.fromARGB(255, 236, 236, 236),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: Offset(0, 1) // Shadow position
                        ),
                  ],
                  borderRadius: BorderRadius.circular(18)),
            ),
          )
        ],
      ),
    );
  }

  Padding searchSection(Size size) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: size.width,
        height: 45.h,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Color(0xFF919EAB),
            width: 0.5,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Icon(
                Icons.search,
                color: Color(0xFF919EAB),
                size: 20,
              ),
            ),
            Expanded(
              child: TextField(
                controller: controller.searchC,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Cari sesuatu...",
                  hintStyle: TextStyle(color: Color(0xFF919EAB), fontSize: 12),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  isDense: true,
                ),
                style: TextStyle(
                  fontSize: 14.0,
                  color: Color.fromARGB(255, 88, 88, 88),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ItemListWidget extends StatelessWidget {
  const ItemListWidget({
    super.key,
    required this.size,
    required this.title,
    required this.desc,
    required this.update,
    required this.delete,
  });

  final Size size;
  final String title;
  final String desc;
  final Future<void> Function() update;
  final Future<void> Function() delete;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: SizedBox(
        width: size.width,
        child: Row(
          children: [
            Expanded(
                flex: 5,
                child: SizedBox(
                  width: size.width,
                  child: Column(
                    children: [
                      SizedBox(
                        width: size.width,
                        child: Text(
                          title,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              height: 1),
                        ),
                      ),
                      SizedBox(height: 5.h),
                      SizedBox(
                        width: size.width,
                        child: Text(
                          desc,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              height: 1),
                        ),
                      )
                    ],
                  ),
                )),
            Expanded(
                flex: 1,
                child: JustTheTooltip(
                  isModal: true,
                  content: Container(
                    width: 80.w,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: update,
                            child: const Icon(
                              Icons.edit,
                              size: 20,
                              color: Colors.blue,
                            ),
                          ),
                          InkWell(
                            onTap: delete,
                            child: const Icon(
                              Icons.delete,
                              size: 20,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  child: Icon(
                    Icons.more_horiz_outlined,
                    size: 20,
                    color: Colors.black,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}

class LabelForm extends StatelessWidget {
  bool isRequired;
  String? optionalText;
  String title;

  LabelForm(
      {Key? key,
      required this.isRequired,
      required this.title,
      this.optionalText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "${title}",
          style: TextStyle(fontSize: 12),
        ),
        if (isRequired)
          Text(
            " *",
            style: TextStyle(color: Colors.redAccent),
          ),
        if (optionalText != null)
          Text(
            " ${optionalText}",
            style: Style.paragraphText,
          )
      ],
    );
  }
}

class PrimaryButton extends StatelessWidget {
  var onClick;
  bool isDisabled;
  String title;
  Color? color;
  Color? textColor;
  IconData? icn;

  PrimaryButton(
      {Key? key,
      required this.onClick,
      required this.isDisabled,
      this.color,
      this.textColor,
      this.icn,
      required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        padding: MaterialStatePropertyAll(EdgeInsets.symmetric(vertical: 14)),
        backgroundColor: isDisabled
            ? MaterialStatePropertyAll(Color(0xFFC4CDD5))
            : MaterialStatePropertyAll(color),
        elevation: MaterialStatePropertyAll(isDisabled ? 0 : null),
      ),
      onPressed: onClick,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style:
                isDisabled ? Style.boldGreyText : TextStyle(color: textColor),
          ),
          if (icn != null)
            SizedBox(
              width: 10.w,
            ),
          if (icn != null)
            Icon(
              icn,
              size: 20,
              color: isDisabled ? Color(0xFF62717D) : Colors.white,
            )
        ],
      ),
    );
  }
}
