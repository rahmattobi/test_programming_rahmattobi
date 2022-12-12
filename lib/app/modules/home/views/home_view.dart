import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:test_programming_rahmattobihidayat/app/modules/home/models/kota_m.dart';
import 'package:test_programming_rahmattobihidayat/app/modules/home/models/province_m.dart';
import 'package:test_programming_rahmattobihidayat/app/routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        height: 60,
        width: double.infinity,
        color: Colors.grey,
        child: const Center(
          child: Text(
            'Tambah Data',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      );
    }

    Widget namaLengkap() {
      return Container(
        margin: const EdgeInsets.only(
          left: 24,
          right: 24,
          top: 24,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Informasi Dasar',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Nama Lengkap',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 18,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(),
              ),
              child: TextFormField(
                controller: controller.name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
                decoration: const InputDecoration(
                  hintText: 'Nama',
                  border: InputBorder.none,
                  hintStyle: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget jenisKelamin() {
      Row addRadioButton(int btnIndex, String title) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            GetBuilder<HomeController>(
              builder: (_) => Radio(
                activeColor: Colors.blue,
                value: controller.gender[btnIndex],
                groupValue: controller.select,
                onChanged: (value) => controller.onClickRadioButton(value),
              ),
            ),
            Text(title)
          ],
        );
      }

      return Container(
        margin: const EdgeInsets.only(
          left: 24,
          right: 24,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Jenis Kelamin',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 18,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                addRadioButton(
                  0,
                  "Male",
                ),
                addRadioButton(1, "Female"),
              ],
            ),
          ],
        ),
      );
    }

    Widget tanggalLahir() {
      return Container(
        margin: const EdgeInsets.only(
          left: 24,
          right: 24,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Tanggal Lahir',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 18,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(),
              ),
              child: TextFormField(
                controller: controller.date,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
                decoration: const InputDecoration(
                  hintText: 'Tanggal Lahir',
                  border: InputBorder.none,
                  hintStyle: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                onTap: (() async {
                  DateTime? picker = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2101));

                  if (picker != null) {
                    controller.date.text =
                        DateFormat('yyyy-MM-dd').format(picker);
                  }
                }),
              ),
            )
          ],
        ),
      );
    }

    Widget provinsi() {
      return Container(
        margin: const EdgeInsets.only(
          left: 24,
          right: 24,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Provinsi',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 18,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(),
              ),
              child: FutureBuilder<List<Province>>(
                  future: controller.getProvince(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(
                        child: Text('Tidak Mempunyai data'),
                      );
                    }

                    List<String?> myList = [];
                    for (var i = 0; i < snapshot.data!.length; i++) {
                      Province data = snapshot.data![i];
                      myList.add(data.name);
                    }
                    return DropdownButton<String>(
                        hint: const Text('Province'),
                        value: controller.selectedValue,
                        onChanged: (String? value) {
                          controller.onSelected(value!);
                        },
                        elevation: 10,
                        items: myList.map((String? value) {
                          return DropdownMenuItem(
                            value: value,
                            child: Text(value!),
                          );
                        }).toList());
                  }),
            )
          ],
        ),
      );
    }

    Widget kota() {
      return Container(
        margin: const EdgeInsets.only(
          left: 24,
          right: 24,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Kota / Kabupaten',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 18,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(),
              ),
              child: FutureBuilder<List<Kota>>(
                  future: controller.getKota(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(
                        child: Text('Tidak Mempunyai data'),
                      );
                    }

                    List<String?> myList = [];
                    for (var i = 0; i < snapshot.data!.length; i++) {
                      Kota data = snapshot.data![i];
                      myList.add(data.name);
                    }
                    return DropdownButton<String>(
                        hint: const Text('Kota'),
                        value: controller.selectedValue,
                        onChanged: (String? value) {
                          controller.onSelected(value!);
                        },
                        elevation: 10,
                        items: myList.map((String? value) {
                          return DropdownMenuItem(
                            value: value,
                            child: Text(value!),
                          );
                        }).toList());
                  }),
            )
          ],
        ),
      );
    }

    Widget foto() {
      return Container(
        margin: const EdgeInsets.only(
          left: 24,
          right: 24,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Foto',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 18,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(),
                ),
                child: TextButton(
                    onPressed: () async {
                      final result = await FilePicker.platform.pickFiles();
                    },
                    child: const Text('Uploud Foto')))
          ],
        ),
      );
    }

    Widget submitButton() {
      return Container(
        margin: const EdgeInsets.only(
          top: 24,
          right: 24,
          left: 24,
        ),
        height: 60,
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(15),
        ),
        child: TextButton(
          onPressed: () {
            Get.toNamed(Routes.DETAIL);
          },
          child: const Center(
            child: Text(
              'Simpan',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
        ),
      );
    }

    Widget cancelButton() {
      return Container(
        margin: const EdgeInsets.only(
          top: 24,
          right: 24,
          left: 24,
        ),
        height: 60,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(15),
        ),
        child: TextButton(
          onPressed: () {
            // addpC.addP(
            //   productC.namapC.text,
            //   productC.jumlahpC.text,
            //   productC.hargapC.text,
            // );
            // productC.clearText();
          },
          child: const Center(
            child: Text(
              'Cancel',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: ListView(
        children: [
          header(),
          namaLengkap(),
          jenisKelamin(),
          tanggalLahir(),
          provinsi(),
          kota(),
          foto(),
          submitButton(),
          cancelButton(),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
