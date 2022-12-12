import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:test_programming_rahmattobihidayat/app/modules/detail/model/siswa_m.dart';

class DetailController extends GetxController {
  Future<List<Siswa>> getSiswa() async {
    Uri url = Uri.parse('https://hiringmobile.qtera.co.id/students');
    var res = await http.get(url);
    List data = (jsonDecode(res.body) as Map<String, dynamic>)['data'];
    return data.map((e) => Siswa.fromJson(e)).toList();
  }
}
