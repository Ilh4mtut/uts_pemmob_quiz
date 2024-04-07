import 'package:flutter/material.dart'; 
import '../constants.dart'; //untuk mengakses konstanta warna dan nilai lainnya
import '../models/pertanyaan_model.dart'; //untuk mengakses kelas Pertanyaan
import '../widgets/pertanyaan_widget.dart'; //untuk menampilkan pertanyaan
import '../widgets/tombol_next.dart'; //untuk menampilkan tombol next
import '../widgets/tombol_opsi.dart'; // untuk menampilkan opsi jawaban
import '../widgets/hasil.dart'; //untuk menampilkan hasil akhir kuis

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Deklarasi daftar pertanyaan
  List<Question> _questions = [
    // Pertanyaan-pertanyaan disusun dalam sebuah list
    Question(
      id: '1',
      title: 'Penulisan yang benar untuk program HTML adalah',
      imagePath: 'assets/images/html.png',
      options: {
        '<html> … <\html>': false,
        '</html>… </html>': false,
        '<html> … </html>': true,
        '</html> … <html>': false
      },
    ),
    Question(
      id: '2',
      title: 'Kegunaan utama dari tag <script> dalam HTML?',
      imagePath: 'assets/images/script.png',
      options: {
        'Menampilkan gambar': false,
        'Menambah skrip JavaScript ke halaman': true,
        'Membuat tabel data': false,
        'Menambahkan audio': false,
      },
    ),
    Question(
      id: '3',
      title:
          'Tag html yang fungsinya menghubungkan ke internal/eksternal halaman web?',
      imagePath: 'assets/images/ahref.png',
      options: {
        '<a href>': true,
        '<br>': false,
        '<src>': false,
        '<marquee>': false
      },
    ),
    Question(
      id: '4',
      title:
          'Tag html yang digunakan untuk list menggunakan nomor, huruf, dll adalah?',
      imagePath: 'assets/images/ol.png',
      options: {'<li>': false, '<ul>': false, '<tr>': false, '<ol>': true},
    ),
    Question(
      id: '5',
      title: 'Tag untuk mengelompokan elemen yang pada form adalah ?',
      imagePath: 'assets/images/fieldset.png',
      options: {
        '<textarea>': false,
        '<form>': false,
        '<div>': false,
        '<fieldset>': true
      },
    ),
    Question(
      id: '6',
      title:
          'tag yang berfungsi sebagai pembuat input dengan pilihan yang berbentuk list drop down adalah?',
      imagePath: 'assets/images/select.png',
      options: {
        '<option>': false,
        '<select>': true,
        '<datalist>': false,
        '<checkbox>': false
      },
    ),
    Question(
      id: '7',
      title: 'Apa fungsi utama dari atribut src dalam tag <img> dalam HTML?',
      imagePath: 'assets/images/img.png',
      options: {
        'Menentukan URL sumber gambar.': true,
        'Menambah skrip JavaScript ke halaman': false,
        'Menentukan tautan URL untuk halaman web': false,
        'Menambahkan audio': false
      },
    ),
    Question(
      id: '8',
      title: 'Apa yang menjadi standarisasi web?',
      imagePath: 'assets/images/w3c.png',
      options: {
        'ECMAN (uropean Computer Manufacturers Association)': false,
        'PSR (PHP Standars Recommendation)': false,
        'W3C (World Wide Web Consortium)': true,
        'ChatGPT': false
      },
    ),
    Question(
      id: '9',
      title: 'Untuk membuat komentar di HTML adalah?',
      imagePath: 'assets/images/komentar.png',
      options: {
        '<!–....–>': true,
        '<? ..... ?>': false,
        '// ......*//': false,
        '#......#': false
      },
    ),
    Question(
      id: '10',
      title: 'Apa kepanjangan dari HTML?',
      imagePath: 'assets/images/hhttmmll.png',
      options: {
        'Hyper Tool Markup Laguage': false,
        'Hyper Link Markup Leaguage': false,
        'Hyper Test Markup Laguage': false,
        'Hyper Text Markup Laguage': true
      },
    )
  ];


  int index = 0; // Index untuk melacak pertanyaan yang sedang ditampilkan
  int score = 0; // Skor pengguna

  bool isPressed = false; // Menandai apakah pengguna telah menjawab pertanyaan
  bool isAlreadySelected = false; // Menandai apakah opsi sudah dipilih sebelumnya


   // Fungsi untuk menampilkan pertanyaan selanjutnya atau hasil jika semua pertanyaan telah dijawab
  void nextQuestion() {
    if (index == _questions.length - 1) {
      showDialog(
          context: context,
          barrierDismissible:
              false, //menonaktifkan fungsi dissmiss pada saat mengklik di luar kotak
          builder: (ctx) => ResultBox(
              result: score, //nilai yang diperoleh pengguna
              questionLength: _questions.length,
              onRestartPressed: startOver,
              onFinishPressed: finishQuiz));
    } else {
      // Jika pengguna sudah menjawab pertanyaan saat ini, lanjutkan ke pertanyaan berikutnya
      if (isPressed) {
        setState(() {
          index++;
          isPressed = false;
          isAlreadySelected = false;
        });
      } else {
        // Jika pengguna belum menjawab, tampilkan pesan untuk menjawab pertanyaan terlebih dahulu
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Dijawab dulu soalnya yaa'),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.symmetric(vertical: 20.0),
        ));
      }
    }
  }


  // Fungsi untuk memeriksa jawaban dan memperbarui skor
  void checkAnswerAndUpdate(bool value) {
    if (isAlreadySelected) {
      return; // Jika opsi sudah dipilih sebelumnya, kembalikan tanpa melakukan apa-apa
    } else {
      // Jika opsi belum dipilih sebelumnya, tandai bahwa pengguna telah menjawab
      setState(() {
        isPressed = true;
        isAlreadySelected = true;
      });
      // Perbarui skor jika jawaban benar
      if (value == true) {
        score++;
      }
    }
  }


  // Fungsi untuk memulai kembali kuis
  void startOver() {
    setState(() {
      index = 0;
      score = 0;
      isPressed = false;
      isAlreadySelected = false;
    });
    Navigator.pop(context); // Tutup dialog hasil
  }


  // Fungsi untuk menampilkan dialog hasil dan informasi proyek
  void finishQuiz() {
    // Menampilkan dialog dengan pesan
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => AlertDialog(
        title: Text('Kuis Selesai'),
        content: Text(
          'Projek ini dikerjakan oleh:\n'
          '1. M.Ilham Al Faridsi 22091397069\n'
          '2. Ibnu Salim H 22091397043\n'
          '3. Reza Fatkhur R 22091397061',
          textAlign: TextAlign.left, // Penyusunan teks ke kiri
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Tutup dialog
              startOver(); // Mulai kembali kuis jika diinginkan
            },
            child: Text('Mulai Lagi'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
          title: const Text('Basic Quiz HTML',
              style: TextStyle(
                  color: const Color.fromARGB(255, 255, 253, 253),
                  fontFamily: "ShadowsIntoLight",
                  fontWeight: FontWeight.bold)),
          backgroundColor: Color.fromARGB(255, 36, 10, 52),
          shadowColor: Color.fromARGB(0, 191, 36, 36),
          actions: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(
                'Nilaimu : $score',
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 255, 237, 216),
                ),
              ),
            ),
          ]),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            // Widget untuk menampilkan pertanyaan
            QuestionWidget(
              indexAction: index,
              question: _questions[index].title,
              totalQuestions: _questions.length,
              imagePath: _questions[index].imagePath,
            ),
            const Divider(color: neutral),
            const SizedBox(height: 25.0),
            // Loop untuk membuat widget opsi jawaban
            for (int i = 0; i < _questions[index].options.length; i++)
              GestureDetector(
                onTap: () => checkAnswerAndUpdate(
                    _questions[index].options.values.toList()[i]),
                child: OptionCard(
                  option: _questions[index].options.keys.toList()[i],
                  // Mengubah warna opsi sesuai dengan jawaban yang benar/salah
                  color: isPressed
                      ? _questions[index].options.values.toList()[i] == true
                          ? correct
                          : incorrect
                      : neutral,
                ),
              ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: NextButton(
          nextQuestion: nextQuestion,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
