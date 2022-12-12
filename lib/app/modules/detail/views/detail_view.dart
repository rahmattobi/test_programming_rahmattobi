import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:test_programming_rahmattobihidayat/app/modules/detail/model/siswa_m.dart';
import 'package:test_programming_rahmattobihidayat/app/modules/widget/siswa_card.dart';

import '../controllers/detail_controller.dart';

class DetailView extends GetView<DetailController> {
  const DetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Siswa'),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),
      body: Container(
        margin: const EdgeInsets.all(24),
        child: FutureBuilder<List<Siswa>>(
          future: controller.getSiswa(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 1,
                itemBuilder: (context, index) {
                  return const Center(child: CircularProgressIndicator());
                },
              );
            }

            // untuk mengcheck apakah ada data
            if (!snapshot.hasData) {
              return const Center(
                child: Text('Tidak Mempunyai data'),
              );
            }
            return ListView.builder(
              itemCount: snapshot.data!.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                Siswa siswa = snapshot.data![index];
                return SiswaCard(
                  name: siswa.name,
                  jk: siswa.gender,
                  tgl: siswa.birthDate,
                  prov: siswa.province,
                  kota: siswa.city,
                  image: siswa.photo,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
