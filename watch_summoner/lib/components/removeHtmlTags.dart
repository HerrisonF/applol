import 'dart:convert';

String removeAllHtmlTags(String htmlText) {
  RegExp exp = RegExp(r"<.[^>]*>", multiLine: true, caseSensitive: true);
  String newText = htmlText.replaceAll(exp, ' ');

  return utf8.decode(newText.runes.toList());
}
