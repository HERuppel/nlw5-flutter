import 'package:flutter/material.dart';
import 'package:nlw5/core/app_colors.dart';
import 'package:nlw5/core/app_images.dart';
import 'package:nlw5/core/app_text_styles.dart';
import 'package:nlw5/shared/widgets/progress_indicator/progress_indicator_widget.dart';

class QuizCardWidget extends StatelessWidget {
  final String title;
  final String completed;
  final double percent;
  const QuizCardWidget({
    Key? key,
    required this.title,
    required this.completed,
    required this.percent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
            border: Border.fromBorderSide(BorderSide(color: AppColors.border)),
            color: AppColors.white,
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Image.asset(AppImages.blocks),
              height: 30,
              width: 30,
              color: AppColors.white,
            ),
            SizedBox(height: 24),
            Text(
              title,
              style: AppTextStyles.heading15,
            ),
            SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                    flex: 2,
                    child: Text(completed, style: AppTextStyles.body11)),
                Expanded(
                    flex: 5, child: ProgressIndicatorWidget(value: percent))
              ],
            )
          ],
        ),
      ),
    );
  }
}
