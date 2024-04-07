import 'package:flutter/material.dart';
import '../constants.dart';

class ResultBox extends StatelessWidget {
  const ResultBox({
    Key? key,
    required this.result,
    required this.questionLength,
    required this.onRestartPressed,
    required this.onFinishPressed,
  }) : super(key: key);

  final int result; // Skor atau nilai akhir dari kuis
  final int questionLength; // Jumlah total pertanyaan dalam kuis
  final VoidCallback onRestartPressed; // Fungsi yang dipanggil ketika tombol "Mulai lagi" ditekan
  final VoidCallback onFinishPressed; // Fungsi yang dipanggil ketika tombol "Selesai" ditekan

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color.fromARGB(255, 255, 142, 0), // Warna latar belakang kotak hasil kuis
      content: Padding(
        padding: const EdgeInsets.all(60.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Nilaimu', // Judul kotak hasil kuis
              style: TextStyle(
                  color: Color.fromARGB(255, 69, 63, 120), // Warna teks judul
                  fontSize: 22.0, // Ukuran teks judul
                  fontFamily: "Viga"), // Jenis font judul
            ),

            const SizedBox(height: 20.0),

            CircleAvatar(
              child: Text(
                '$result/$questionLength', // Menampilkan skor/nilai akhir dalam format "skor/jumlah_pertanyaan"
                style: TextStyle(fontFamily: "Viga", fontSize: 40.0),
               ),
              radius: 70.0,
              backgroundColor: result == questionLength / 2
                  ? Colors.yellow // Warna latar belakang avatar jika nilai benar hanya setengah dari soal
                  : result < questionLength / 2
                      ? incorrect //Warna latar belakang avatar jika nilai benar kurang dari setengah dari soal
                      : correct, // Warna latar belakang avatar jika nilai benar lebih dari setengah dari soal
            ),

            const SizedBox(height: 20.0,),

            Text(
              result == questionLength / 2
                  ? 'Sedikit lagi' // Pesan tambahan jika nilai benar hanya setengah dari soal
                  : result < questionLength / 2
                      ? 'Belajar LAGI!!!!' // Pesan tambahan jika nilai benar kurang dari setengah dari soal
                      : 'Kelaszz', // Pesan tambahan jika nilai benar lebih dari setengah dari soal
              style: const TextStyle(
                  color: Color.fromARGB(255, 121, 84, 88), fontFamily: "Viga"),
            ),

            const SizedBox(height: 25.0),

            Container(
              width: double.infinity,
              child: Column(
                mainAxisSize: MainAxisSize
                    .min, // Agar Column hanya memakan ruang yang dibutuhkan
                children: [
                  ElevatedButton(
                    onPressed: onRestartPressed, // Fungsi yang dipanggil saat tombol "Mulai lagi" ditekan
                    child: const Text(
                      'Mulai lagi',
                      style: TextStyle(fontFamily: "Viga", fontSize: 16),
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                    ),
                  ),

                  const SizedBox(height: 10),
                          
                  ElevatedButton(
                    onPressed: onFinishPressed, // Fungsi yang dipanggil saat tombol "Selesai" ditekan
                    child: const Text(
                      'Selesai',
                      style: TextStyle(fontFamily: "Viga", fontSize: 16),
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
