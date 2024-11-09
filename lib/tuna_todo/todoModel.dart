class ToDo {
  String? id;
  String? todoText;
  bool isDone;

  ToDo({
    required this.id,
    required this.todoText,
    this.isDone = false,
  });

  static List<ToDo> todoList() {
    return [
      ToDo(id: '01', todoText: '200 soru çöz', isDone: false),
      ToDo(id: '02', todoText: '30 dakika Türkçe çalış', isDone: false),
      ToDo(id: '03', todoText: 'Matematik konu tekrarı yap', isDone: false),
      ToDo(id: '04', todoText: 'Bir deneme sınavı çöz', isDone: false),
    ];
  }
}