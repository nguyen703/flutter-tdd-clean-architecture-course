import 'package:get_it/get_it.dart';

import 'number_trivia_facade.dart';
import 'presentation/bloc/number_trivia_bloc.dart';
import 'presentation/bloc/number_trivia_event.dart';

class NumberTriviaFacadeImpl implements NumberTriviaFacade {
  final instance = GetIt.instance.get<NumberTriviaBloc>();

  @override
  void getRandomTrivia() => instance.add(GetTriviaForRandomNumber());
}
