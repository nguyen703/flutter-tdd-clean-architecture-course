import 'package:clean_architecture_tdd_course/features/number_trivia/number_trivia_facade_impl.dart';

abstract class NumberTriviaFacade {
  void getRandomTrivia();

  static NumberTriviaFacade get instance => NumberTriviaFacadeImpl();
}
