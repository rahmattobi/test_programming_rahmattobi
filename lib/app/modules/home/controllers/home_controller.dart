import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:test_programming_rahmattobihidayat/app/modules/home/models/kota_m.dart';
import 'package:test_programming_rahmattobihidayat/app/modules/home/models/province_m.dart';

class HomeController extends GetxController {
  TextEditingController date = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController jk = TextEditingController();
  TextEditingController prov = TextEditingController();
  TextEditingController kota = TextEditingController();

  // JK
  String? selectedGender;
  final List<String> gender = ["Male", "Female"];

  String? select;

  get listType => null;
  void onClickRadioButton(value) {
    select = value;
    update();
  }

  // Get Province
  Future<List<Province>> getProvince() async {
    Uri url = Uri.parse('https://hiringmobile.qtera.co.id/province');
    var res = await http.get(url);
    List data = (jsonDecode(res.body) as Map<String, dynamic>)['data'];
    return data.map((e) => Province.fromJson(e)).toList();
  }

  Future<List<Kota>> getKota() async {
    Uri url = Uri.parse('https://hiringmobile.qtera.co.id/city');
    var res = await http.get(url);
    List data = (jsonDecode(res.body) as Map<String, dynamic>)['data'];
    return data.map((e) => Kota.fromJson(e)).toList();
  }

  // Province
  String? selectedValue;

  void onSelected(String value) {
    selectedValue = value;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    date = TextEditingController();
    name = TextEditingController();
    jk = TextEditingController();
    prov = TextEditingController();
    kota = TextEditingController();
    getProvince();
  }

  @override
  void onClose() {
    date.dispose();

    super.onClose();
  }
}
