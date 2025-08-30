import 'package:zone/spark/presentation/cubit/training_plan/training_plan_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/consts/text_styles.dart';
import '../../../core/managers/color_manager.dart';
import '../../../core/utils/utils.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/failure_widget.dart';

class TrainingAndDietsProgramDetailScreen extends StatelessWidget {
  final int trainingPlanId;

  const TrainingAndDietsProgramDetailScreen(
      {Key? key, required this.trainingPlanId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrainingPlanCubit, TrainingPlanState>(
        builder: (context, state) {
      if (state is TrainingPlanLoadingState) {
        return Scaffold(
          body: showLoadingIndicator(),
        );
      }
      if (state is TrainingPlanErrorState) {
        return Scaffold(
          body: Center(
            child: FailureWidget(
              message: state.message,
              onRetry: () {
                context
                    .read<TrainingPlanCubit>()
                    .getTrainingPlan(trainingPlanId);
              },
            ),
          ),
        );
      }
      if (state is TrainingPlanSuccessState) {
        return Scaffold(
          appBar: HeaderWidget(
            title: state.planEntity.title,
            titleFontSize: 20.sp,
            appBarHeight: 70.h,
            textColor: Colors.black,
            isWithImage: false,
            backgroundColor: Colors.transparent,
            backButtonBackgroundColor: LightColors.black,
            isBack: true,
          ),
          body: paragraphWidget(
            state.planEntity.planDetails,
          ),
        );
      }
      return Scaffold(
        body: Center(
          child: FailureWidget(
            message: 'Unknown error occurred',
            onRetry: () {
              context.read<TrainingPlanCubit>().getTrainingPlan(trainingPlanId);
            },
          ),
        ),
      );
    });
  }
}

List<String> parseParagraphs(String html) {
  final List<String> paragraphs = [];
  final List<String> temp = html.split('<p>');
  temp.removeAt(0); // Remove empty element at index 0
  for (String element in temp) {
    final String paragraph = element.split('</p>').first;
    final String cleanedParagraph = paragraph
        .replaceAllMapped(
            RegExp(r'<span.*?>(.*?)<\/span>'), (match) => match.group(1)!)
        .replaceAll('<br>', '')
        .replaceAll('<b>', 'this text is Headline')
        .replaceAll('</b>', '')
        .trim(); // Rem
    if (cleanedParagraph.isNotEmpty) {
      paragraphs.add(cleanedParagraph);
    }
  }
  return paragraphs;
}

List<String> orderParagraphs(List<String> paragraphs) {
  final List<String> orderedParagraphs = [];
  final List<String> headings = [];
  String currentHeading = '';

  for (String paragraph in paragraphs) {
    final RegExp numberRegex = RegExp(r'^\s*([\d]+)\b');
    final RegExpMatch? match = numberRegex.firstMatch(paragraph);
    if (match != null) {
      final int? number = int.tryParse(match.group(1)!);
      if (number == null) {
        currentHeading = paragraph.trim();
        continue;
      }
    }

    if (currentHeading.isNotEmpty) {
      orderedParagraphs.add(currentHeading);
      currentHeading = '';
    }
    orderedParagraphs.add(paragraph.trim());
  }

  for (String heading in headings) {
    orderedParagraphs.add(heading);
  }
  return orderedParagraphs;
}

// List<String> parseText(String html) {
//   final List<String> paragraphs = [];
//
//   final RegExp orderedListRegex = RegExp(r'<ol>(.*?)<\/ol>', dotAll: true);
//   final RegExp listItemRegex = RegExp(r'<li>(.*?)<\/li>', dotAll: true);
//   final RegExp removeTagsRegex = RegExp(r'<.*?>');
//
//   final match = orderedListRegex.firstMatch(html);
//   if (match != null) {
//     final olContent = match.group(1);
//     final matches = listItemRegex.allMatches(olContent!);
//     for (final listItemMatch in matches) {
//       final listItem = listItemMatch.group(1);
//       final headLine = listItem!.replaceAll(removeTagsRegex, '');
//       paragraphs.add(headLine.trim());
//     }
//   }
//
//   final RegExp paragraphRegex = RegExp(r'<p>(.*?)<\/p>', dotAll: true);
//   final RegExp removeParagraphTagsRegex = RegExp(r'<.*?>');
//   log('paragraphRegex is $paragraphRegex');
//   log('removeTagsRegex is $removeParagraphTagsRegex');
//   final matches = paragraphRegex.allMatches(html);
//   log('matches is $matches');
//   for (final paragraphMatch in matches) {
//     log('paragraphMatch is $paragraphMatch');
//     final paragraph = paragraphMatch.group(1);
//     log('paragraph is $paragraph');
//     final cleanedText = paragraph!.replaceAll(removeParagraphTagsRegex, '');
//     log('cleanedText is $cleanedText');
//     paragraphs.add(cleanedText.trim());
//   }
//
//   log('paragraphs is $paragraphs');
//   return paragraphs;
// }
//
Widget paragraphWidget(String html) {
  final List<String> paragraphs = orderParagraphs(parseParagraphs(html));
  return SafeArea(
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 28.0),
      child: Center(
        child: SizedBox(
          width: .9.sw,
          height: .9.sh,
          child: ListView.separated(
            itemCount: paragraphs.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: SizedBox(
                  width: .7.sw,
                  child: Text(
                    paragraphs[index].contains('Headline')
                        ? paragraphs[index].split('Headline')[1]
                        : paragraphs[index],
                    textAlign: TextAlign.justify,
                    style: paragraphs[index].contains('Headline')
                        ? AppTextStyle.black_18BOLD.copyWith(
                            fontSize: 19,
                            height: 1.5,
                          )
                        : AppTextStyle.white_16.copyWith(
                            color: LightColors.textColor.withOpacity(0.5),
                            fontWeight: FontWeight.bold,
                            height: 1.5,
                          ),
                  ),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) =>
                paragraphs[index + 1].contains('Headline')
                    ? SizedBox(
                        height: 20.h,
                      )
                    : const SizedBox(
                        height: 0,
                      ),
          ),
        ),
      ),
    ),
  );
}

// ListView
// (
// physics: const NeverScrollableScrollPhysics(),
// children: [
// SizedBox(
// height: 0.9.sh,
// child: ListView.separated(
// padding: EdgeInsets.symmetric(horizontal: 20.w),
// physics: const BouncingScrollPhysics(),
// itemCount:state.planEntity,
// itemBuilder: (context, index) {
// return Row(
// crossAxisAlignment: CrossAxisAlignment.start,
// mainAxisAlignment: MainAxisAlignment.start,
// children: [
// Text(
// ' ${index + 1} - ',
// textAlign: TextAlign.justify,
// style: AppTextStyle.white_18.copyWith(
// color: LightColors.textColor.withOpacity(0.5),
// fontWeight: FontWeight.bold,
// height: 1.5,
// ),
// ),
// SizedBox(
// width: 0.7.sw,
// child: Text(
// '${'هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر.'}',
// textAlign: TextAlign.justify,
// style: AppTextStyle.white_18.copyWith(
// color: LightColors.textColor.withOpacity(0.5),
// fontWeight: FontWeight.bold,
// height: 1.5,
// ),
// ),
// ),
// ],
// );
// },
// separatorBuilder: (context, index) {
// return SizedBox(height: 20.h);
// },
// )
// ,
// )
// ,
// ]
// ,
// )
// ,
