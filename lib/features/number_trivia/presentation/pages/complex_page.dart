import 'package:clean_architecture_tdd_course/bridge.dart';
import 'package:clean_architecture_tdd_course/features/number_trivia/presentation/bloc/bloc.dart';
import 'package:clean_architecture_tdd_course/features/number_trivia/presentation/pages/number_trivia_page.dart';
import 'package:clean_architecture_tdd_course/features/number_trivia/presentation/widgets/loading_widget.dart';
import 'package:clean_architecture_tdd_course/features/number_trivia/presentation/widgets/message_display.dart';
import 'package:clean_architecture_tdd_course/features/number_trivia/presentation/widgets/trivia_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ComplexPage extends StatelessWidget {
  const ComplexPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Complex Page'),
      ),
      body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => NumberTriviaPage()));
                },
                child: Text(
                  "Push to page 2",
                  style: TextStyle(fontSize: 24),
                )),
            BlocBuilder<NumberTriviaBloc, NumberTriviaState>(
              builder: (context, state) {
                if (state is Empty) {
                  return MessageDisplay(
                    message: 'Start searching!',
                  );
                } else if (state is Loading) {
                  return LoadingWidget();
                } else if (state is Loaded) {
                  return TriviaDisplay(numberTrivia: state.trivia);
                } else if (state is Error) {
                  return MessageDisplay(
                    message: state.message,
                  );
                }
                return const SizedBox.shrink();
              },
            ),
            const Trigger(),
            TextButton(
                onPressed: () => BlocProvider.of<NumberTriviaBloc>(context)
                    .add(GetTriviaForRandomNumber()),
                child: Text("Trigger in module"))
          ])),
    );
  }
}
