import 'package:flutter/material.dart';
import 'package:nlw5/challenge/challenge_page.dart';
import 'package:nlw5/core/app_colors.dart';
import 'package:nlw5/home/home_controller.dart';
import 'package:nlw5/home/home_state.dart';
import 'package:nlw5/home/widgets/appbar/appbar_widget.dart';
import 'package:nlw5/home/widgets/level_button/level_button_widget.dart';
import 'package:nlw5/home/widgets/quiz_card/quiz_card_widget.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  @override
  void initState() {
    super.initState();
    controller.getUser();
    controller.getQuizzes();
    controller.stateNotifier.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    if (controller.state == HomeState.success) {
      return Scaffold(
          appBar: AppBarWidget(user: controller.user!),
          body: Column(
            children: [
              SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    LevelButtonWidget(label: 'Fácil'),
                    LevelButtonWidget(label: 'Médio'),
                    LevelButtonWidget(label: 'Difícil'),
                    LevelButtonWidget(label: 'Perito'),
                  ],
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Expanded(
                  child: GridView.count(
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                crossAxisCount: 2,
                children: controller.quizzes!
                    .map((e) => QuizCardWidget(
                          title: e.title,
                          completed:
                              '${e.questionAnswered} de ${e.questions.length}',
                          percent: e.questionAnswered / e.questions.length,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ChallengePage()));
                          },
                        ))
                    .toList(),
              ))
            ],
          ));
    } else {
      return Scaffold(
          body: Center(
              child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(AppColors.darkGreen),
      )));
    }
  }
}
