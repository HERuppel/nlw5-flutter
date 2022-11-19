import 'package:flutter/cupertino.dart';
import 'package:nlw5/challenge/widgets/answer/answer_widget.dart';
import 'package:nlw5/core/app_text_styles.dart';
import 'package:nlw5/shared/models/question_model.dart';

class QuizWidget extends StatelessWidget {
  final QuestionModel question;
  const QuizWidget({Key? key, required this.question}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        SizedBox(height: 64),
        Text(question.title, style: AppTextStyles.heading),
        SizedBox(height: 24),
        ...question.awnsers
            .map(
              (answer) => AnswerWidget(
                  isSelected: false,
                  isRight: answer.isRight,
                  title: answer.title),
            )
            .toList(),
      ],
    ));
  }
}
