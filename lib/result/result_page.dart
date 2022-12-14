import 'package:flutter/material.dart';
import 'package:nlw5/challenge/widgets/next_button/next_button_widget.dart';
import 'package:nlw5/core/app_images.dart';
import 'package:nlw5/core/app_text_styles.dart';
import 'package:share_plus/share_plus.dart';

class ResultPage extends StatelessWidget {
  final String title;
  final int length;
  final int rightAnswers;

  const ResultPage(
      {Key? key,
      required this.title,
      required this.length,
      required this.rightAnswers})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.only(top: 60),
      width: double.maxFinite,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(AppImages.trophy),
          Column(
            children: [
              Text(
                "Parabéns!",
                style: AppTextStyles.heading40,
              ),
              Text.rich(
                TextSpan(
                    text: "Você concluiu",
                    style: AppTextStyles.body,
                    children: [
                      TextSpan(
                        text: "\n$title",
                        style: AppTextStyles.bodyBold,
                      ),
                      TextSpan(
                        text: "\ncom $rightAnswers de $length acertos.",
                        style: AppTextStyles.body,
                      ),
                    ]),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          Column(
            children: [
              Row(
                children: [
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 68),
                    child: NextButtonWidget.purple(
                        label: "Compartilhar",
                        onTap: () {
                          Share.share(
                              "Compartilhando meu resultado no Quiz: $title. Acertei $rightAnswers de $length!");
                        }),
                  )),
                ],
              ),
              SizedBox(
                height: 24,
              ),
              Row(
                children: [
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 68),
                    child: NextButtonWidget.white(
                        label: "Votlar ao início",
                        onTap: () {
                          Navigator.pop(context);
                        }),
                  )),
                ],
              )
            ],
          )
        ],
      ),
    ));
  }
}
