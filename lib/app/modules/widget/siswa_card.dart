import 'package:flutter/material.dart';

class SiswaCard extends StatelessWidget {
  SiswaCard(
      {super.key,
      this.name,
      this.jk,
      this.tgl,
      this.prov,
      this.kota,
      this.image});

  String? name;
  String? image;
  String? jk;
  String? tgl;
  String? prov;
  String? kota;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                blurRadius: 10,
                color: Colors.grey.withOpacity(0.2),
                offset: Offset(0, 5))
          ]),
      child: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  name.toString(),
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Icon(Icons.more_vert),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(image.toString()),
                    ),
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Jenis Kelamin : ${jk.toString()}'),
                    Text('Tanggal Lahir : ${DateTime.parse(tgl.toString())}'),
                    Text('Provinsi : ${prov.toString()}'),
                    Text('Kota : ${kota.toString()}'),
                  ],
                ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
