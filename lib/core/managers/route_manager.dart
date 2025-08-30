import 'package:zone/spark/presentation/cubit/attendances/attendances_cubit.dart';
import 'package:zone/spark/presentation/cubit/available_trainings/available_trainings_cubit.dart';
import 'package:zone/spark/presentation/cubit/available_trainings/training_details/training_details_cubit.dart';
import 'package:zone/spark/presentation/cubit/available_trainings/training_reserivation/training_reservation_cubit.dart';
import 'package:zone/spark/presentation/cubit/banners/all_banners/banners_cubit.dart';
import 'package:zone/spark/presentation/cubit/banners/banner_details/banner_details_cubit.dart';
import 'package:zone/spark/presentation/cubit/contact/contact_cubit.dart';
import 'package:zone/spark/presentation/cubit/home/home_cubit.dart';
import 'package:zone/spark/presentation/cubit/main_layout/cubit.dart';
import 'package:zone/spark/presentation/cubit/splash/splash_cuibt.dart';
import 'package:zone/spark/presentation/cubit/store/store_cubit.dart';
import 'package:zone/spark/presentation/cubit/store/store_deatails/store_details_cubit.dart';
import 'package:zone/spark/presentation/cubit/track_details/track_details_cubit.dart';
import 'package:zone/spark/presentation/cubit/tracks/tracks_cubit.dart';
import 'package:zone/spark/presentation/pages/attendance_sessions_page.dart';
import 'package:zone/spark/presentation/pages/following_up_page.dart';
import 'package:zone/spark/presentation/pages/training_diets_programs_page.dart';
import 'package:zone/spark/presentation/pages/training_seesions_page.dart';
import 'package:zone/spark/presentation/screens/gallery/photo_viewer.dart';
import 'package:zone/spark/presentation/screens/home/home_screen.dart';
import 'package:zone/spark/presentation/screens/login/login_screen.dart';
import 'package:zone/spark/presentation/screens/main_layout/main_layout.dart';
import 'package:zone/spark/presentation/screens/notification/notification_screen.dart';
import 'package:zone/spark/presentation/screens/shopping_details/shopping_details_screen.dart';
import 'package:zone/spark/presentation/screens/subscriptions/subscriptions_screen.dart';
import 'package:zone/spark/presentation/screens/subscriptions_details/subscription_details_screen.dart';
import 'package:zone/spark/presentation/screens/terms_conditions/terms_condition_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../spark/presentation/cubit/activites/all_activites/activities_cubit.dart';
import '../../spark/presentation/cubit/activites/avtivity_deatails/activity_details_cubit.dart';
import '../../spark/presentation/cubit/subscription_details/subscription_details_cubit.dart';
import '../../spark/presentation/cubit/training_plan/training_plan_cubit.dart';
import '../../spark/presentation/cubit/training_plans/training_plans_cubit.dart';
import '../../spark/presentation/cubit/trining_session/training_sessions_cubit.dart';
import '../../spark/presentation/pages/report_page.dart';
import '../../spark/presentation/pages/training_dites_detail_page.dart';
import '../../spark/presentation/screens/activity/activity_screen.dart';
import '../../spark/presentation/screens/activity_details/activity_details_screen.dart';
import '../../spark/presentation/screens/available_training/available_trainings_screen.dart';
import '../../spark/presentation/screens/available_training_details/available_trainings_details_screen.dart';
import '../../spark/presentation/screens/contact_us/contact_us_view.dart';
import '../../spark/presentation/screens/gallery/gallery_screen.dart';
import '../../spark/presentation/screens/offers/offers_screen.dart';
import '../../spark/presentation/screens/register/register_screen.dart';
import '../../spark/presentation/screens/shopping/shopping_screen.dart';
import '../../spark/presentation/screens/splash/splash_screen.dart';
import '../enums/enums.dart';
import '../services/services.dart' as di;

class Routes {
  static const String initial = '/';
  static const String login = '/login';
  static const String register = '/register';
  static const String contactUs = '/contact-us';
  static const String availableTrainings = '/available-training';
  static const String availableTrainingDetails = '/available-training-details';
  static const String activity = '/activity';
  static const String activityDetails = '/activityDetails';
  static const String shopping = '/shopping';
  static const String shoppingDetails = '/shoppingDetails';
  static const String termsAndConditions = '/terms-and-conditions';
  static const String offers = '/offers';
  static const String gallery = 'gallery';
  static const String home = '/home';
  static const String attendanceSessions = '/attendanceSessions';
  static const String followingUp = 'followingUp';
  static const String reports = '/reports';
  static const String trainingAndDietsProgramDetail =
      '/trainingAndDietsProgramsDetail';
  static const String trainingAndDietsPrograms = '/trainingAndDietsPrograms';
  static const String trainingSessions = '/trainingSessions';
  static const String subscriptions = '/subscriptions';
  static const String subscriptionDetails = '/subscriptionDetails';
  static const String mainLayout = '/mainLayout';
  static const String notifications = '/notifications';

  static const String photoView = '/photoView';
}

class RouteGenerator {
  static Route<dynamic>? getRoute(RouteSettings settings) {
    switch (settings.name) {
      //splash
      case Routes.initial:
        return MaterialPageRoute(
          builder: (_) {
            return const SplashScreen();
          },
        );

      ///login
      case Routes.login:
        return MaterialPageRoute(
          builder: (_) {
            return const LoginScreen();
          },
        );

      ///login
      case Routes.photoView:
        return MaterialPageRoute(
          builder: (_) {
            return PhotoViewer(
              galleryItems: [],
              page: 0,
            );
          },
        );

      ///home
      case Routes.home:
        return MaterialPageRoute(
          builder: (_) {
            return BlocProvider<HomeCubit>(
              child: const HomeScreen(),
              create: (BuildContext context) =>
                  di.sl<HomeCubit>()..getHomeData(),
            );
          },
        );
      case Routes.register:
        final arguments = settings.arguments as Map<String, dynamic>;
        final bool? isFromTraining = arguments['isFromTraining'];
        final bool? isFromSubscription = arguments['isFromSubscription'];
        final int? id = arguments['id'];
        return MaterialPageRoute(
          builder: (_) {
            return RegisterScreen(
              fromProfile: true,
              id: id ?? -1,
              isFromSubscription: isFromSubscription,
              isFromTraining: isFromTraining,
            );
          },
        );
      case Routes.contactUs:
        return MaterialPageRoute(
          builder: (BuildContext context) {
            return BlocProvider(
                create: (BuildContext context) => di.sl<ContactCubit>(),
                child: const ContactUsView());
          },
        );

      case Routes.activity:
        return MaterialPageRoute(
          builder: (BuildContext context) {
            return BlocProvider(
                create: (BuildContext context) =>
                    di.sl<ActivitiesCubit>()..getAllActivities(),
                child: const ActivityScreen());
          },
        );
      case Routes.availableTrainings:
        return MaterialPageRoute(
          builder: (BuildContext context) {
            return BlocProvider(
              child: const AvailableTrainingsView(),
              create: (BuildContext context) =>
                  di.sl<AvailableTrainingsCubit>()..getAvailableTrainings(),
            );
          },
        );
      case Routes.activityDetails:
        final arguments = settings.arguments as Map<String, dynamic>;
        final selectedActivityId = arguments['id'];
        return MaterialPageRoute(
          builder: (BuildContext context) {
            return BlocProvider(
              child: ActivityDetailsScreen(
                id: selectedActivityId,
              ),
              create: (BuildContext context) => di.sl<ActivityDetailsCubit>()
                ..getActivityDetails(selectedActivityId),
            );
          },
        );
      case Routes.availableTrainingDetails:
        final arguments = settings.arguments as Map<String, dynamic>;
        final int selectedTrainingId = arguments['id'];
        return MaterialPageRoute(
          builder: (BuildContext context) {
            return MultiBlocProvider(
              providers: [
                BlocProvider<TrainingDetailsCubit>(
                  create: (BuildContext context) =>
                      di.sl<TrainingDetailsCubit>()
                        ..getTrainingDetails(selectedTrainingId),
                ),
                BlocProvider<TrainingReservationCubit>(
                  create: (BuildContext context) =>
                      di.sl<TrainingReservationCubit>(),
                )
              ],
              child: AvailableTrainingsScreenDetailsView(
                trainingId: selectedTrainingId,
              ),
            );
          },
        );

      case Routes.shopping:
        return MaterialPageRoute(
          builder: (BuildContext context) {
            return BlocProvider(
              child: const ShoppingScreen(),
              create: (BuildContext context) =>
                  di.sl<StoreCubit>()..getStoreProducts(),
            );
          },
        );
      case Routes.shoppingDetails:
        final arguments = settings.arguments as Map<String, dynamic>;
        final int selectedStoreId = arguments['id'];
        return MaterialPageRoute(
          builder: (BuildContext context) {
            return BlocProvider(
              child: ShoppingDetailsScreen(
                storeId: selectedStoreId,
              ),
              create: (BuildContext context) =>
                  di.sl<StoreDetailsCubit>()..getStoreDetails(selectedStoreId),
            );
          },
        );
      case Routes.termsAndConditions:
        return MaterialPageRoute(
          builder: (BuildContext context) {
            return BlocProvider(
                child: TermsAndConditions(),
                create: (BuildContext context) =>
                    di.sl<SplashCubit>()..getSplashData());
          },
        );
      case Routes.offers:
        final arguments = settings.arguments as Map<String, dynamic>;
        final int selectedBannerId = arguments['id'];
        final int selectedBannerType = arguments['type'] ?? 0;
        return MaterialPageRoute(
          builder: (BuildContext context) {
            return BlocProvider(
              child: OffersScreen(
                bannerId: selectedBannerId,
                type: selectedBannerType,
              ),
              create: (BuildContext context) => di.sl<BannerDetailsCubit>()
                ..getBannerDetails(selectedBannerId, selectedBannerType),
            );
          },
        );
      case Routes.gallery:
        return MaterialPageRoute(
          builder: (BuildContext context) {
            return const GalleryScreen();
          },
        );
      case Routes.attendanceSessions:
        return MaterialPageRoute(
          builder: (BuildContext context) {
            return BlocProvider<AttendancesCubit>(
              create: (context) => di.sl<AttendancesCubit>()..getAttendances(),
              child: const AttendanceSessionsPage(),
            );
          },
        );
      case Routes.followingUp:
        return MaterialPageRoute(
          builder: (BuildContext context) {
            return BlocProvider<TracksCubit>(
              create: (context) => di.sl<TracksCubit>()..getTracks(),
              child: FollowingUpPage(),
            );
          },
        );
      case Routes.trainingAndDietsPrograms:
        return MaterialPageRoute(
          builder: (BuildContext context) {
            return BlocProvider<TrainingPlansCubit>(
              create: (context) => di.sl<TrainingPlansCubit>()
                ..getTrainingPlans(TrainingPlans.allType.type),
              child: TrainingAndDietsProgramsPage(),
            );
          },
        );
      case Routes.trainingSessions:
        return MaterialPageRoute(
          builder: (BuildContext context) {
            return BlocProvider(
              create: (context) =>
                  di.sl<TrainingSessionsCubit>()..getTrainingSessions(),
              child: const TrainingSessionsPage(),
            );
          },
        );
      case Routes.subscriptions:
        return MaterialPageRoute(
          builder: (BuildContext context) {
            return const SubscriptionsScreen();
          },
        );
      case Routes.subscriptionDetails:
        final arguments = settings.arguments as Map<String, dynamic>;
        final id = arguments['selectedActivityId'];
        return MaterialPageRoute(
          builder: (BuildContext context) {
            return BlocProvider(
              create: (context) =>
                  di.sl<SubscriptionDetailsCubit>()..getSubscriptionDetails(id),
              child: SubscriptionDetailsScreen(id: id),
            );
          },
        );
      case Routes.reports:
        return MaterialPageRoute(
          builder: (BuildContext context) {
            final arguments = settings.arguments as Map<String, dynamic>;
            final trackId = arguments['id'];
            return BlocProvider<TrackDetailsCubit>(
              create: (context) =>
                  di.sl<TrackDetailsCubit>()..getTrackDetails(id: trackId),
              child: ReportPage(
                id: trackId,
              ),
            );
          },
        );
      case Routes.mainLayout:
        return MaterialPageRoute(
          builder: (BuildContext context) {
            return BlocProvider<MainLayoutCubit>(
              create: (context) => di.sl<MainLayoutCubit>(),
              child: MainLayout(),
            );
          },
        );
      case Routes.notifications:
        return MaterialPageRoute(
          builder: (BuildContext context) {
            return BlocProvider(
              child: const NotificationScreen(),
              create: (BuildContext context) =>
                  di.sl<BannersCubit>()..getAllBanners(),
            );
          },
        );
      case Routes.trainingAndDietsProgramDetail:
        return MaterialPageRoute(
          builder: (BuildContext context) {
            final arguments = settings.arguments as Map<String, dynamic>;
            final trainingPlanId = arguments['id'];
            return BlocProvider<TrainingPlanCubit>(
              create: (context) =>
                  di.sl<TrainingPlanCubit>()..getTrainingPlan(trainingPlanId),
              child: TrainingAndDietsProgramDetailScreen(
                trainingPlanId: trainingPlanId,
              ),
            );
          },
        );
    }
    return null;
  }
}
