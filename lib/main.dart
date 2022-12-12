import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}

// import 'dart:convert';
// import 'package:http/http.dart' as http;

// void main() async {
//   Uri url = Uri.parse('https://hiringmobile.qtera.co.id/province');
//   var res = await http.get(url);
//   List data = (jsonDecode(res.body) as Map<String, dynamic>)['data'];
//   print(data);
// }
