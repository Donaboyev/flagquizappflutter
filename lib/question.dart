class Question {
  final String imagePath;
  final String variantA;
  final String variantB;
  final String variantC;
  final String variantD;
  final String variantTrue;

  Question({
    required this.imagePath,
    required this.variantA,
    required this.variantB,
    required this.variantC,
    required this.variantD,
    required this.variantTrue,
  });
}

final List<Question> questions = [
  Question(
    imagePath: 'assets/images/uzb.png',
    variantA: 'Tadjikistan',
    variantB: 'Mongolia',
    variantC: 'Uzbekistan',
    variantD: 'Kazakhstan',
    variantTrue: 'Uzbekistan',
  ),
  Question(
    imagePath: 'assets/images/uzb.png',
    variantA: 'Tadjikistan',
    variantB: 'Mongolia',
    variantC: 'Uzbekistan',
    variantD: 'Kazakhstan',
    variantTrue: 'Uzbekistan',
  ),
];
