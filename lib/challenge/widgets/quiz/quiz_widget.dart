import 'package:flutter/cupertino.dart';
import 'package:nlw5/challenge/widgets/answer/answer_widget.dart';
import 'package:nlw5/core/app_text_styles.dart';

class QuizWidget extends StatelessWidget {
  final String title;
  const QuizWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        SizedBox(height: 64),
        Text(title, style: AppTextStyles.heading),
        SizedBox(height: 24),
        AnswerWidget(
            isSelected: true,
            isRight: false,
            title:
                'Possibilita a criação de aplicativos compilados nativamente'),
        AnswerWidget(
            title:
                'Possibilita a criação de aplicativos compilados nativamente'),
        AnswerWidget(
            title:
                'Possibilita a criação de aplicativos compilados nativamente'),
        AnswerWidget(
            title:
                'Possibilita a criação de aplicativos compilados nativamente'),
      ],
    ));
  }
}
