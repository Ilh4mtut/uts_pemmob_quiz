import 'package:flutter/material.dart';
import '../constants.dart';

class NextButton extends StatelessWidget {
  const NextButton({Key? key, required this.nextQuestion}) : super(key: key);

  final VoidCallback
      nextQuestion; // Fungsi yang dipanggil ketika tombol "Soal Selanjutnya" ditekan

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: nextQuestion, // Panggil fungsi nextQuestion saat tombol ditekan
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color:
              Color.fromARGB(255, 234, 190, 108), // Warna latar belakang tombol
          borderRadius: BorderRadius.circular(
              10.0), // Border radius untuk membuat sudut tombol
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3), // Warna bayangan tombol
              spreadRadius: 10, // Besarnya penyebaran bayangan
              blurRadius: 20, // Besarnya blur pada bayangan
              offset:
                  const Offset(0, 3), // Posisi bayangan relatif terhadap tombol
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Text(
              'Soal Selanjutnya',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: background,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Positioned(
              right: 10, // Posisi ikon panah ke kanan
              child: Icon(
                Icons.arrow_forward, // Ikon panah ke kanan
                color: Color.fromARGB(255, 36, 10, 52), // Warna ikon
              ),
            ),
          ],
        ),
      ),
    );
  }
}
