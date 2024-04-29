
import 'package:gpt_app/features/chat/logic/chat_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/di/dependency_injection.dart';
import 'core/routing/app_router.dart';
import 'core/routing/routes.dart';

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  const MyApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ChatCubit>(create: (context) => getIt<ChatCubit>()),
      ],
      child:
      /*MaterialApp(
            title: 'My App',
            theme: ThemeData(
              //primaryColor: ColorsManager.mainBlue,
              scaffoldBackgroundColor: Colors.white,
            ),
            debugShowCheckedModeBanner: false,
            initialRoute: Routes.signupScreen,
            onGenerateRoute: appRouter.generateRoute,
          ),*/
        ScreenUtilInit(
          designSize: const Size(375, 812),
          minTextAdapt: true,
          child: MaterialApp(
            title: 'My App',
            // theme: theme,
            restorationScopeId: 'app',
            debugShowCheckedModeBanner: false,
            themeMode: ThemeMode.dark,
            // theme: lightTheme,
            // darkTheme: darkTheme,
            // locale: context.locale,
            initialRoute: Routes.splashScreen,
            onGenerateRoute: AppRouter().generateRoute,
          ),
        ),
    );
  }
}
