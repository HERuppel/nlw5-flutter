import 'package:flutter/widgets.dart';
import 'package:nlw5/core/app_text_styles.dart';
import 'package:nlw5/shared/widgets/progress_indicator/progress_indicator_widget.dart';

class QuestionIndicatorWidget extends StatelessWidget {
  const QuestionIndicatorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
          child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Questão 04', style: AppTextStyles.body),
              Text('de 10', style: AppTextStyles.body)
            ],
          ),
          SizedBox(height: 16),
          ProgressIndicatorWidget(value: 0.7)
        ],
      )),
    );
  }
}
