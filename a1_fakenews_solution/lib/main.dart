import 'package:a1_fakenews/news/view/news_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'news/cubit/news_cubit.dart';
import 'news_observer.dart';

//main program entry point
void main() {
  BlocOverrides.runZoned(
        () => runApp( const MyApp()),
    blocObserver: NewsObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NewsCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.amber,
          textTheme: GoogleFonts.judsonTextTheme(
            Theme.of(context).textTheme,
          ),
          fontFamily: GoogleFonts.oswald(fontWeight: FontWeight.w500).fontFamily,
        ),
        home: const NewsPage(),
      )
    );
  }
}

