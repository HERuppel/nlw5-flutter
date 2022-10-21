import 'package:flutter/material.dart';
import 'package:nlw5/core/app_colors.dart';
import 'package:nlw5/core/app_images.dart';
import 'package:nlw5/core/app_text_styles.dart';

class QuizCardWidget extends StatelessWidget {
  const QuizCardWidget({Key? key}) : super(key: key);

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
              'Gerenciamento de Estado',
              style: AppTextStyles.heading15,
            ),
            SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                    flex: 1,
                    child: Text('3 de 10', style: AppTextStyles.body11)),
                Expanded(
                  flex: 4,
                  child: LinearProgressIndicator(
                    value: 0.3,
                    backgroundColor: AppColors.chartSecondary,
                    valueColor:
                        AlwaysStoppedAnimation<Color>(AppColors.chartPrimary),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}