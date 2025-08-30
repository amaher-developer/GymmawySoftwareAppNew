import 'dart:developer';

import 'package:zone/core/consts/text_styles.dart';
import 'package:zone/core/managers/strings_assets_constants.dart';
import 'package:zone/spark/presentation/cubit/splash/splash_cuibt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../core/managers/color_manager.dart';
import '../../../../core/utils/utils.dart';
import '../../../../core/widgets/custom_appbar.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
      listenWhen: (previous, current) =>
          current.runtimeType == SplashErrorState,
      listener: (context, state) {
        if (state is SplashErrorState) {
          showToast(
            content: state.message,
            status: NotificationStatus.error,
            length: Toast.LENGTH_LONG,
          );
        }
      },
      child: Scaffold(
        appBar: HeaderWidget(
          title: StringsAssetsConstants.terms_and_condition,
          titleFontSize: 20.sp,
          appBarHeight: 79.h,
          backgroundColor: LightColors.primary,
          isWithImage: true,
          isBack: true,
        ),
        body: BlocBuilder<SplashCubit, SplashState>(
          /*      buildWhen: (previous, current) =>
              current.runtimeType == SplashSuccessState ||
              current.runtimeType == SplashLoadingState,*/
          builder: (context, state) {
            if (state is SplashLoadingState) {
              return showLoadingIndicator();
            }
            if (state is SplashSuccessState) {
              return paragraphWidget(state.splashEntity.terms);
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}

Widget showTextAsNumberedParagraphs(String text) {
  List<String> paragraphs = text.split('\n');

  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Center(
      child: SizedBox(
        width: .9.sw,
        child: ListView.separated(
          itemCount: paragraphs.length - 1,
          itemBuilder: (BuildContext context, int index) {
            return Row(
              children: [
                Expanded(
                  child: Text(
                    ' ${index + 1}. ${paragraphs[index]}',
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black.withOpacity(.48)),
                  ),
                ),
              ],
            );
          },
          separatorBuilder: (BuildContext context, int index) => SizedBox(
            height: 22.h,
          ),
        ),
      ),
    ),
  );
}

List<String> parseText(String html) {
  final List<String> paragraphs = [];

  final RegExp orderedListRegex = RegExp(r'<ol>(.*?)<\/ol>', dotAll: true);
  final RegExp listItemRegex = RegExp(r'<li>(.*?)<\/li>', dotAll: true);
  final RegExp removeTagsRegex = RegExp(r'<.*?>');

  final match = orderedListRegex.firstMatch(html);
  if (match != null) {
    final olContent = match.group(1);
    final matches = listItemRegex.allMatches(olContent!);
    for (final listItemMatch in matches) {
      final listItem = listItemMatch.group(1);
      final headLine = listItem!.replaceAll(removeTagsRegex, '');
      paragraphs.add(headLine.trim());
    }
  }

  final RegExp paragraphRegex = RegExp(r'<p>(.*?)<\/p>', dotAll: true);
  final RegExp removeParagraphTagsRegex = RegExp(r'<.*?>');
  log('paragraphRegex is $paragraphRegex');
  log('removeTagsRegex is $removeParagraphTagsRegex');
  final matches = paragraphRegex.allMatches(html);
  log('matches is $matches');
  for (final paragraphMatch in matches) {
    log('paragraphMatch is $paragraphMatch');
    final paragraph = paragraphMatch.group(1);
    log('paragraph is $paragraph');
    final cleanedText = paragraph!.replaceAll(removeParagraphTagsRegex, '');
    log('cleanedText is $cleanedText');
    paragraphs.add(cleanedText.trim());
  }

  log('paragraphs is $paragraphs');
  return paragraphs;
}

Widget paragraphWidget(String html) {
  final List<String> paragraphs = parseText(html);
  return SafeArea(
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 28.0),
      child: Center(
        child: SizedBox(
          width: .9.sw,
          height: .8.sh,
          child: ListView.separated(
            itemCount: paragraphs.length,
            itemBuilder: (context, index) {
              final paragraph = paragraphs[index];
              return ListTile(
                title: Text(
                  paragraph,
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.start,
                  style: index == 0
                      ? AppTextStyle.black_18BOLD.copyWith(
                          fontSize: 19,
                          fontWeight: FontWeight.w700,
                        )
                      : AppTextStyle.grey_16.copyWith(
                          fontWeight: FontWeight.w700,
                          color: const Color(0XFF888888),
                        ),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) => SizedBox(
              height: 22.h,
            ),
          ),
        ),
      ),
    ),
  );
}
