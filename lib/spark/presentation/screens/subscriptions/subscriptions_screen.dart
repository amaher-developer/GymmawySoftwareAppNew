import 'package:zone/core/managers/route_manager.dart';
import 'package:zone/core/managers/strings_assets_constants.dart';
import 'package:zone/core/widgets/conditional_builder.dart';
import 'package:zone/spark/presentation/screens/subscriptions/widgets/subscription_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/managers/color_manager.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../../../../core/widgets/failure_widget.dart';
import '../../cubit/subscriptions/subscriptions_cubit.dart';
import '../../cubit/subscriptions/subscriptions_state.dart';

class SubscriptionsScreen extends StatelessWidget {
  const SubscriptionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SubscriptionsCubit, SubscriptionsStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (state is LoadingSubscriptionsStates) {
          return const Center(child: CircularProgressIndicator());
        }
        final cubit = SubscriptionsCubit.get(context);
        return Scaffold(
          backgroundColor: LightColors.white,
          appBar: HeaderWidget(
            title: StringsAssetsConstants.subscriptions,
            textColor: Colors.black,
            titleFontSize: 20.sp,
            appBarHeight: 60.h,
            titleFontWeight: FontWeight.bold,
            isWithImage: false,
            backgroundColor: Colors.white,
            backButtonBackgroundColor: LightColors.black,
            isBack: false,
          ),
          body: SafeArea(
            child: ConditionalBuilder(
              condition: state is SuccessSubscriptionsStates,
              builder: (context) => Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // comment
                  SizedBox(height: 20.h),
                  Expanded(
                    child: RefreshIndicator(
                      onRefresh: () async {
                        cubit.getSubscriptions();
                      },
                      child: GridView.builder(
                        physics: const AlwaysScrollableScrollPhysics(),
                        padding: EdgeInsets.all(24.r),
                        itemBuilder: (BuildContext context, int index) {
                          return state is SuccessSubscriptionsStates
                              ? SubscriptionWidget(
                                  isFromSubscriptions: true,
                                  isWithDiscount:
                                      state.subscriptions[index]?.isDiscount ==
                                          1,
                                  id: state.subscriptions[index]?.id,
                                  subscriptionPrice:
                                      state.subscriptions[index]?.price,
                                  duration: state.subscriptions[index]?.name,
                                  otherInfo: state
                                      .subscriptions[index]?.shortDescription,
                                  discount:
                                      state.subscriptions[index]?.discount,
                                  onTapWithId: (int? selectedActivityId) {
                                    Navigator.of(context).pushNamed(
                                        Routes.subscriptionDetails,
                                        arguments: {
                                          'selectedActivityId':
                                              selectedActivityId
                                        });

                                    /*                           MaterialPageRoute(
                                      builder: (BuildContext context) {
                                        return BlocProvider(
                                          create: (context) =>
                                              di.sl<SubscriptionDetailsCubit>(),
                                          child: SubscriptionDetailsScreen(
                                            id: state
                                                    .subscriptions[index]?.id ??
                                                -1,
                                          ),
                                        );
                                      },
                                    );*/
                                  })
                              : SubscriptionWidget(
                                  isWithDiscount: index == 4,
                                  subscriptionPrice: '300 جنيه',
                                  duration: '5 شهور',
                                  otherInfo: 'متاح لكل تدريبة',
                                  discount: '500',
                                  onTap: () {
                                    Navigator.of(context)
                                        .pushNamed(Routes.subscriptionDetails);
                                  },
                                );
                        },
                        itemCount: state is SuccessSubscriptionsStates
                            ? state.subscriptions.length
                            : 0,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisSpacing: 30.h,
                            childAspectRatio: 0.9,
                            crossAxisCount: 3,
                            crossAxisSpacing: 10.w
                            //mainAxisExtent: 100,
                            ),
                      ),
                    ),
                  ),
                  const SizedBox(width: double.infinity),

                  /*OutlinedButton(
              onPressed: () {
                navigateAndKeepStack(context, ContactUsView());
                translator.setNewLanguage(
                  context,
                  newLanguage: 'ar',
                  remember: true,
                  restart: true,
                );
              }, child: Text('hhhhhhhhhhhh'),
            ),*/
                ],
              ),
              fallback: (context) => Center(
                child: FailureWidget(
                  message: 'لا يوجد اتصال بالانترنت',
                  onRetry: () {
                    cubit.getSubscriptions();
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
