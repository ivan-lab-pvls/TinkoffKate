import 'package:zenmoney/features/quiz/data/author.dart';

abstract class Entry {
  final String content;
  final Author author;
  final String date;

  Entry({
    required this.content,
    required this.author,
    required this.date,
  });
}
