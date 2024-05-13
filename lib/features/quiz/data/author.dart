class Author {
  final String name;
  final String assetName;

  Author({required this.name, required this.assetName});

  static final List<Author> authorList = [
    Author(
      name: 'Emma',
      assetName: 'assets/images/quiz/1.png',
    ),
    Author(
      name: 'Olivia',
      assetName: 'assets/images/quiz/2.png',
    ),
    Author(
      name: 'James',
      assetName: 'assets/images/quiz/3.png',
    ),
    Author(
      name: 'William',
      assetName: 'assets/images/quiz/4.png',
    ),
    Author(
      name: 'Michael',
      assetName: 'assets/images/quiz/5.png',
    ),
  ];
}
