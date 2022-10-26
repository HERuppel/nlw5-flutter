import 'package:flutter/foundation.dart';
import 'package:nlw5/core/app_images.dart';
import 'package:nlw5/home/home_state.dart';
import 'package:nlw5/shared/models/answer_model.dart';
import 'package:nlw5/shared/models/question_model.dart';
import 'package:nlw5/shared/models/quiz_model.dart';

import '../shared/models/user_model.dart';

class HomeController {
  final stateNotifier = ValueNotifier<HomeState>(HomeState.empty);

  set state(HomeState state) => stateNotifier.value = state;
  HomeState get state => stateNotifier.value;

  UserModel? user;
  List<QuizModel>? quizzes;

  void getUser() async {
    state = HomeState.loading;
    await Future.delayed(Duration(seconds: 2));
    user = UserModel(
        name: 'Renato Ruppel',
        photoUrl: 'https://avatars.githubusercontent.com/u/61123552?v=4');
    state = HomeState.success;
  }

  void getQuizzes() async {
    state = HomeState.loading;
    await Future.delayed(Duration(seconds: 2));

    quizzes = [
      QuizModel(
          title: 'NLW 5 - Flutter',
          questionAnswered: 1,
          questions: [
            QuestionModel(title: 'Está curtindo o Flutter?', answers: [
              AnswerModel(title: 'Estou curtindo'),
              AnswerModel(title: 'Muito Bom'),
              AnswerModel(title: 'Mais ou menos'),
              AnswerModel(title: 'Não'),
            ]),
            QuestionModel(title: 'Está curtindo o Flutter?', answers: [
              AnswerModel(title: 'Estou curtindo'),
              AnswerModel(title: 'Muito Bom'),
              AnswerModel(title: 'Mais ou menos'),
              AnswerModel(title: 'Não'),
            ])
          ],
          image: AppImages.blocks,
          level: Level.facil)
    ];
    state = HomeState.success;
  }
}
