import 'package:zone/core/managers/strings_assets_constants.dart';
import 'package:zone/core/widgets/conditional_builder.dart';
import 'package:zone/spark/presentation/cubit/available_trainings/available_trainings_cubit.dart';
import 'package:zone/spark/presentation/cubit/available_trainings/available_trainings_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/managers/color_manager.dart';
import '../../../../core/managers/route_manager.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../available_training_details/widgets/training_card_widget.dart';
import '../payment_page/payment_screen.dart';

class AvailableTrainingsView extends StatelessWidget {
  const AvailableTrainingsView({Key? key}) : super(key: key);

/*
  /// for unImaged appBar
  appBar:  HeaderWidget(
        title: 'الأنشطة',
        textColor: Colors.black,
        isWithImage: false,
        backgroundColor: Colors.transparent,
        backButtonBackgroundColor: LightColors.black,
        isBack: true,
      ),
* */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LightColors.white,
      appBar: HeaderWidget(
        title: StringsAssetsConstants.trainings,
        titleFontSize: 20.sp,
        appBarHeight: 60.h,
        textColor: LightColors.black,
        isBack: true,
        backgroundColor: LightColors.white,
        backButtonBackgroundColor: LightColors.black,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(12.r),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BlocConsumer<AvailableTrainingsCubit, AvailableTrainingsStates>(
                listener: (context, state) {
                  // TODO: implement listener
                },
                builder: (context, state) {
                  final cubit = AvailableTrainingsCubit.get(context);
                  return ConditionalBuilder(
                    condition: state is LoadingAvailableTrainingsStates,
                    builder: (context) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    fallback: (context) => ConditionalBuilder(
                      condition: state is ErrorAvailableTrainingsStates,
                      builder: (context) => Center(
                        child: Text(
                          (state as ErrorAvailableTrainingsStates).error,
                        ),
                      ),
                      fallback: (context) => Expanded(
                        child: ListView.separated(
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                              onTap: (){
                                Navigator.of(context).pushNamed(
                                    Routes.availableTrainingDetails,
                                    arguments: {'id': cubit.availableTrainings[index]?.id});
                              },
                              child: AvailableTrainingCard(
                                trainingName:
                                    cubit.availableTrainings[index]?.name,
                                currency:
                                    cubit.availableTrainings[index]?.currency,
                                imageLink: cubit.availableTrainings[index]?.image,
                                price: cubit.availableTrainings[index]?.price,
                                numberOfTrainingSessions:
                                    cubit.availableTrainings[index]?.classes,
                                id: cubit.availableTrainings[index]?.id ?? 0,
                                getIdCallback: (int selectedTrainingId) {
                                  Navigator.of(context).pushNamed(
                                      Routes.availableTrainingDetails,
                                      arguments: {'id': selectedTrainingId});
                                },
                              ),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return const SizedBox.shrink();
                          },
                          itemCount: cubit.availableTrainings.length,
                        ),
                      ),
                    ),
                  );
                },
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
        ),
      ),
    );
  }
}
