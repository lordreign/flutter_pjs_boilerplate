import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_pjs_boilerplate/src/config/routes.dart';
import 'package:hive/hive.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'src/config/environment.dart';
import 'src/config/theme.dart';
import 'src/store/cubit/theme/theme_cubit.dart';
import 'src/views/bottom_nav_layout.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // runApp 이전에 비동기로 데이터를 다룰때 꼭  추가해야함
  await EasyLocalization.ensureInitialized();
  await dotenv.load(fileName: Environment.fileName);

  // https://github.com/flutter/flutter/issues/35162
  // android에서 60fps로 고정되어 느려지는 문제 대응
  if (Platform.isAndroid) {
    await FlutterDisplayMode.setHighRefreshRate();
  }

  final Directory tmpDir = await getTemporaryDirectory();
  Hive.init(tmpDir.toString());
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: tmpDir,
  );

  runApp(
    EasyLocalization(
      path: 'assets/translations',
      supportedLocales: const <Locale>[
        Locale('en'),
        Locale('ko'),
      ],
      fallbackLocale: const Locale('en'),
      useFallbackTranslations: true,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ThemeCubit>(
      create: (context) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeModeState>(
        builder: (BuildContext context, ThemeModeState state) {
          return MaterialApp(
            // title에서는 localization 불가
            title: 'Flutter PJS Boilerplate',

            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: state.themeMode,

            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            debugShowCheckedModeBanner: false,

            home: const BottomNavLayout(),
            // initialRoute: '/',
            // routes: routes,
          );
        },
      ),
    );
  }
}
