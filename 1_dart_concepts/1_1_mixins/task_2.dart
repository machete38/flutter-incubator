void main() {
  // Implement an extension on [String], parsing links from a text.
  //
  // Extension should return a [List] of texts and links, e.g.:
  // - `Hello, google.com, yay` ->
  //   [Text('Hello, '), Link('google.com'), Text(', yay')].
  print('Hello, google.com, yay'.toList());
}

extension ListParser on String {
  List toList() {
    List list = List.from([]);
    split(', ').forEach((match) {
      if (match.contains('.')) {
        list.add('Link(\'$match\')');
      } else {
        list.add('Text(\'$match\')');
      }
    });
    return list;
  }
}
