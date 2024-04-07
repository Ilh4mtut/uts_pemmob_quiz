import 'package:http/http.dart' as http;
import './pertanyaan_model.dart';
import 'dart:convert';

class DBconnect {
  //membuat fungsi pertama untuk menambah pertanyaan di database.
  //nyatakan nama tabel yang ingin Anda buat dan tambahkan .json di akhiran
  final url = Uri.parse(
      'https://basic-quiz-html-default-rtdb.asia-southeast1.firebasedatabase.app/questions.json');
  Future<void> addQuestion(Question question) async {
    http.post(url,
        body: json.encode({
          'title': question.title,
          'options': question.options,
        }));
  }

  //mengambil data dari database
  Future<void> fetchQuestions() async {
    http.get(url).then((response) {
      //metode 'then' mengembalikan 'respons' yang merupakan data kita
      //untuk mengetahui apa yang ada di dalamnya, kita harus memecahkan kodenya terlebih dahulu
      var data = json.decode(response.body);
      print(data);
    });
  }
}
