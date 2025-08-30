import 'dart:io';

import 'package:zone/core/managers/route_manager.dart';
import 'package:zone/core/managers/theme_manager.dart';
import 'package:zone/firebase_options.dart';
import 'package:zone/spark/presentation/cubit/available_trainings/training_reserivation/training_reservation_cubit.dart';
import 'package:zone/spark/presentation/cubit/gallery/gallery_cubit.dart';
import 'package:zone/spark/presentation/cubit/home/home_cubit.dart';
import 'package:zone/spark/presentation/cubit/login/login_cubit.dart';
import 'package:zone/spark/presentation/cubit/main_layout/cubit.dart';
import 'package:zone/spark/presentation/cubit/profile/profile_cubit.dart';
import 'package:zone/spark/presentation/cubit/shared/shared_cubit.dart';
import 'package:zone/spark/presentation/cubit/shared/shared_state.dart';
import 'package:zone/spark/presentation/cubit/splash/splash_cuibt.dart';
import 'package:zone/spark/presentation/cubit/subscriptions/subscriptions_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_translate/flutter_translate.dart';

import 'core/helper/user_helper.dart';
import 'core/localization/localize_preferences.dart';
import 'core/services/services.dart' as di;

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

String currentLanguage = 'en';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  await di.initServices();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  UserHelper.init();
  // UserHelper.clearUser();
  LocalizationDelegate delegate = await LocalizationDelegate.create(
    preferences: LocalizePreferences(),
    supportedLocales: [
      'en',
      'ar',
    ],
    fallbackLocale: 'ar',
  );

  runApp(
    LocalizedApp(
      delegate,
      const MyApp(),
    ),
  );
  await FirebaseMessaging.instance.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
  if (Platform.isAndroid) {
    print("Subscribed to android topic");

    await FirebaseMessaging.instance
        .subscribeToTopic("android")
        .then((value) => debugPrint("Subscribed to android topic"));
  } else if (Platform.isIOS) {
    print("Subscribed to ios topic");
    await FirebaseMessaging.instance
        .subscribeToTopic("ios")
        .then((value) => debugPrint("Subscribed to ios topic"));
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var localizationDelegate = LocalizedApp.of(context).delegate;

    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeCubit>(
          create: (BuildContext context) => di.sl<HomeCubit>()..getHomeData(),
        ),
        BlocProvider<MainLayoutCubit>(
          create: (BuildContext context) => di.sl<MainLayoutCubit>(),
        ),
        BlocProvider<SubscriptionsCubit>(
          create: (BuildContext context) =>
              di.sl<SubscriptionsCubit>()..getSubscriptions(),
        ),
        BlocProvider<GalleryCubit>(
          create: (BuildContext context) =>
              di.sl<GalleryCubit>()..getGalleryImages(),
        ),
        BlocProvider<LoginCubit>(
          create: (BuildContext context) => di.sl<LoginCubit>(),
        ),
        BlocProvider<SplashCubit>(
          create: (BuildContext context) =>
              di.sl<SplashCubit>()..getSplashData(),
        ),
        BlocProvider<ProfileCubit>(
          create: (BuildContext context) =>
              di.sl<ProfileCubit>()..getProfileData(),
        ),
        BlocProvider<SharedCubit>(
          create: (BuildContext context) =>
              di.sl<SharedCubit>()..initLang(context),
        ),
        BlocProvider<TrainingReservationCubit>(
          create: (BuildContext context) => di.sl<TrainingReservationCubit>(),
        ),
      ],
      child: BlocBuilder<SharedCubit, SharedState>(
        builder: (context, state) {
          UserHelper.setIsFirstTime();

          currentLanguage = localizationDelegate.currentLocale.languageCode;
          return LocalizationProvider(
            state: LocalizationProvider.of(context).state,
            child: ScreenUtilInit(
              designSize: const Size(428, 926),
              minTextAdapt: true,
              splitScreenMode: true,
              builder: (BuildContext context, Widget? child) {
                return MaterialApp(
                  navigatorKey: navigatorKey,
                  title: 'Flutter Demo',
                  theme: ThemeManager.lightTheme,
                  debugShowCheckedModeBanner: false,
                  onGenerateRoute: RouteGenerator.getRoute,
                  // Android + iOS Delegates
                  localizationsDelegates: [
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                    localizationDelegate
                  ],
                  supportedLocales: localizationDelegate.supportedLocales,
                  locale: localizationDelegate.currentLocale,
                );
              },
            ),
          );
        },
      ),
    );
  }
}
