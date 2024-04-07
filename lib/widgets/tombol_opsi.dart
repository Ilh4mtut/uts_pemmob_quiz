import 'package:flutter/material.dart';
import '../constants.dart';

class OptionCard extends StatelessWidget {
  const OptionCard({
    Key? key,
    required this.option,
    required this.color,
  }) : super(key: key);

  final String option;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Card(
        color: color, // Warna latar belakang dari opsi
        child: ListTile(
          title: Text(
            option, // Teks dari opsi
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: "Itim",
              fontWeight: FontWeight.bold,
              fontSize: 15.0,
              color: color.red != color.green // Jika warna latar belakang tidak abu-abu, gunakan warna netral; jika tidak, gunakan warna hitam
                  ? neutral
                  : Color.fromARGB(255, 0, 0, 0), // Warna teks bergantung pada warna latar belakang
            ),
          ),
        ));
  }
}
