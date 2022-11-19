import 'package:flutter/cupertino.dart';
import 'package:nlw5/challenge/widgets/answer/answer_widget.dart';
import 'package:nlw5/core/app_text_styles.dart';
import 'package:nlw5/shared/models/answer_model.dart';
import 'package:nlw5/shared/models/question_model.dart';

class QuizWidget extends StatefulWidget {
  final QuestionModel question;
  final ValueChanged<bool> onSelected;
  const QuizWidget({Key? key, required this.question, required this.onSelected})
      : super(key: key);

  @override
  State<QuizWidget> createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  int indexSelected = -1;

  AwnserModel answer(int index) => widget.question.awnsers[index];

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        SizedBox(height: 64),
        Text(widget.question.title, style: AppTextStyles.heading),
        SizedBox(height: 24),
        for (var i = 0; i < widget.question.awnsers.length; i++)
          AnswerWidget(
              isSelected: indexSelected == i,
              answer: answer(i),
              disabled: indexSelected != -1,
              onTap: (value) {
                indexSelected = i;
                setState(() {});
                Future.delayed(Duration(seconds: 1))
                    .then((_) => widget.onSelected(value));
              })
      ],
    ));
  }
}
