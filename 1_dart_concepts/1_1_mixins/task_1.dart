void main() {
  // Implement an extension on [DateTime], returning a [String] in format of
  // `YYYY.MM.DD hh:mm:ss` (e.g. `2023.01.01 00:00:00`).
  DateTime date = DateTime.now();
  print(date.dateToString());
}

extension StringOut on DateTime {
  String dateToString() {
    return "${year.toString()}.${month.toString().padLeft(2, '0')}.${day.toString().padLeft(2, '0')} ${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}:${second.toString().padLeft(2, '0')}";
  }
}
