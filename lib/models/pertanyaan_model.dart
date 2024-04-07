class Question {
  final String id; //ID unik untuk pertanyaan

  final String title; // Teks pertanyaan

  final Map<String, bool> options; // Pilihan jawaban untuk pertanyaan (teks opsi dan kebenaran jawaban)

  final String? imagePath; // Jalur gambar opsional yang terkait dengan pertanyaan

  //constructor
  Question({
    required this.id, // Parameter wajib
    required this.title, // Parameter wajib
    required this.options, // Parameter wajib
    this.imagePath, // Parameter opsional
  }); 


  // Override dari metode toString() untuk memberikan representasi string dari objek Question
  @override
  String toString() {
    return 'Question(id: $id, title: $title, options: $options, imagePath: $imagePath)';
  }
}
