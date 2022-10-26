import 'package:nlw5/core/app_images.dart';
import 'package:nlw5/home/home_state.dart';
import 'package:nlw5/shared/models/answer_model.dart';
import 'package:nlw5/shared/models/question_model.dart';
import 'package:nlw5/shared/models/quiz_model.dart';

import '../shared/models/user_model.dart';

class HomeController {
  HomeState state = HomeState.empty;

  UserModel? user;
  List<QuizModel>? quizzes;

  void getUser() {
    user = UserModel(
        name: 'Renato Ruppel',
        photoUrl: 'https://avatars.githubusercontent.com/u/61123552?v=4');
  }

  void getQuizzes() {
    quizzes = [
      QuizModel(
          title: 'NLW 5 - Flutter',
          questions: [
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
  }
}
