import 'package:flutter/material.dart';
import 'package:nlw5/challenge/challenge_controller.dart';
import 'package:nlw5/challenge/widgets/next_button/next_button_widget.dart';
import 'package:nlw5/challenge/widgets/question_indicator/question_indicator_widget.dart';
import 'package:nlw5/challenge/widgets/quiz/quiz_widget.dart';
import 'package:nlw5/result/result_page.dart';
import 'package:nlw5/shared/models/question_model.dart';

class ChallengePage extends StatefulWidget {
  final List<QuestionModel> questions;
  ChallengePage({Key? key, required this.questions}) : super(key: key);

  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  final controller = ChallengeController();
  final pageController = PageController();
  @override
  void initState() {
    pageController.addListener(() {
      controller.currentPage = pageController.page!.toInt() + 1;
    });

    super.initState();
  }

  void nextPage() {
    if (controller.currentPage < widget.questions.length)
      pageController.nextPage(
          duration: Duration(milliseconds: 300), curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(86),
          child: SafeArea(
              top: true,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BackButton(),
                  ValueListenableBuilder<int>(
                    valueListenable: controller.currentPageNotifier,
                    builder: (context, value, _) => QuestionIndicatorWidget(
                      currentPage: value,
                      length: widget.questions.length,
                    ),
                  )
                ],
              )),
        ),
        body: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: pageController,
          children: [
            ...widget.questions
                .map((question) => QuizWidget(
                      question: question,
                      onChange: nextPage,
                    ))
                .toList()
          ],
        ),
        bottomNavigationBar: SafeArea(
          bottom: true,
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ValueListenableBuilder<int>(
                  valueListenable: controller.currentPageNotifier,
                  builder: (context, value, _) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          if (value < widget.questions.length)
                            Expanded(
                                child: NextButtonWidget.white(
                              label: "Pular",
                              onTap: nextPage,
                            )),
                          if (value == widget.questions.length)
                            Expanded(
                                child: NextButtonWidget.green(
                              label: "Confirmar",
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ResultPage()));
                              },
                            )),
                        ],
                      ))),
        ));
  }
}
