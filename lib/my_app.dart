import 'package:flutter/services.dart';
import 'package:gpt_app/features/chat/logic/chat_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/di/dependency_injection.dart';
import 'core/routing/app_router.dart';
import 'core/routing/routes.dart';
import 'core/theming/app_theme_cubit/app_theme_cubit.dart';
import 'core/theming/app_theme_cubit/app_theme_state.dart';
import 'core/theming/app_themes.dart';

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  const MyApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppThemeCubit>(
          create: (context) => getIt<AppThemeCubit>()..fetchAppTheme(),
        ),

        BlocProvider<ChatCubit>(
          create: (context) => getIt<ChatCubit>(),
        ),
      ],
      child:
          BlocBuilder<AppThemeCubit, AppThemeState>(builder: (context, state) {
            SystemChrome.setSystemUIOverlayStyle(
              SystemUiOverlayStyle(
                statusBarColor: Colors.transparent,
                statusBarIconBrightness: AppThemeCubit.isDarkMode
                    ? Brightness.light
                    : Brightness.dark,
              ),
            );
            return ScreenUtilInit(
              designSize: const Size(375, 812),
              minTextAdapt: true,
              child: MaterialApp(
                debugShowCheckedModeBanner: false,
                theme:
                // context.read<AppThemeCubit>().themeMode == ThemeMode.dark
                //     ? AppThemes.darkTheme
                //     :
                AppThemes.lightTheme,//AppThemes.lightTheme,
                darkTheme: AppThemes.darkTheme,
                themeMode: context.read<AppThemeCubit>().themeMode,
                onGenerateRoute: appRouter.generateRoute,
                initialRoute: Routes.splashScreen,
              ),
            );
      }),
    );
  }
}
