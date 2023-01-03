import 'package:clean_architecture_tdd_course/features/number_trivia/presentation/bloc/number_trivia_bloc.dart';
import 'package:clean_architecture_tdd_course/features/number_trivia/presentation/pages/complex_page.dart';
import 'package:clean_architecture_tdd_course/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'generated/l10n.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<NumberTriviaBloc>(),
      child: MaterialApp(
        title: 'Number Trivia',
        theme: ThemeData(
          primaryColor: Colors.green.shade800,
          colorScheme: ColorScheme.fromSwatch()
              .copyWith(secondary: Colors.green.shade600),
        ),
        supportedLocales: S.delegate.supportedLocales,
        localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate
        ],
        locale: Locale('vi'),
        home: ComplexPage(),
      ),
    );
  }
}
