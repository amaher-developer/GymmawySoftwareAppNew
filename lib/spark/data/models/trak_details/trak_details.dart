/*
{
         "track": {
            "id": 3,
            "title": "26 مايو 2023",
            "image": "https://sw.gymmawy.com/resources/assets/front/images/report_track.png",
            "height": "180.00 cm ",
            "weight": "80.00 kg ",
            "report": "<p><span style=\"color: rgb(51, 51, 51); font-family: DroidArabicKufi-Regular, sans-serif, Arial; font-size: 16px;\">توجد مجموعة من الخطوات التي يجب التقيد بها من أجل كتابة التقرير الطبي، وهي: استخدام قلم حبر جاف، مع الحرص على ترتيب الخط أثناء الكتابة. يجب أن يُكتب التقرير الطبي من قبل الطبيب، أو المعالج فقط، أو الشخص الذي يمتلك القدرة على كتابتهِ بناءً على تفويضٍ مسبق من قبل الجهة الطبية المسؤولة. الالتزام بتعبئة كافة البيانات الخاصة بالمريض في الخانات المخصصة لها، مع كتابة تاريخ إعداد التقرير الطبي. كتابة التفاصيل الخاصة بالحالة المرضية، على شكل نقاط، أو أسلوب سردي. الحرص على توضيح أسباب المرض للمؤسسة، أو المنشأة التي سيتم توجيه التقرير لها. بعد الانتهاء من كتابة التقرير الطبي، يجب توقيعه من قبل الطبيب، مع ختمهِ بالختم الخاص بهِ، وبالمستشفى في حال كان صادراً من قبلها. يوضع التقرير الطبي في المغلف الخاص بهِ لحفظه من التعرّض للتلف، حتى يتمّ تسليمه للمريض أو للشخص المفوّض بذلك.</span><br style=\"color: rgb(51, 51, 51); font-family: DroidArabicKufi-Regular, sans-serif, Arial; font-size: 16px;\"><br style=\"color: rgb(51, 51, 51); font-family: DroidArabicKufi-Regular, sans-serif, Arial; font-size: 16px;\"><span style=\"color: rgb(51, 51, 51); font-family: DroidArabicKufi-Regular, sans-serif, Arial; font-size: 16px;\">إقرأ المزيد على موضوع.كوم:&nbsp;</span><a href=\"https://mawdoo3.com/%D9%83%D9%8A%D9%81%D9%8A%D8%A9_%D9%83%D8%AA%D8%A7%D8%A8%D8%A9_%D8%AA%D9%82%D8%B1%D9%8A%D8%B1_%D8%B7%D8%A8%D9%8A\" style=\"color: rgb(26, 101, 158); outline: none; line-height: inherit; background: rgb(255, 255, 255); font-family: DroidArabicKufi-Regular, sans-serif, Arial; font-size: 16px;\">https://mawdoo3.com/%D9%83%D9%8A%D9%81%D9%8A%D8%A9_%D9%83%D8%AA%D8%A7%D8%A8%D8%A9_%D8%AA%D9%82%D8%B1%D9%8A%D8%B1_%D8%B7%D8%A8%D9%8A</a><br></p>",
            "date": "26 مايو 2023",
            "short_content": "تقرير كابتن ahmed maher"
        }

}

 */
// create model class
import 'package:zone/spark/domain/entities/trak_details/trak_details_entity.dart';

class TrackDetailsModel extends TrackDetailsEntity {
  TrackDetailsModel({
    final int? id,
    final String? title,
    final String? image,
    final String? height,
    final String? weight,
    final String? report,
    final String? date,
    final String? shortContent,
  }) : super(
          id: id,
          title: title,
          image: image,
          height: height,
          weight: weight,
          report: report,
          date: date,
          shortContent: shortContent,
        );

  factory TrackDetailsModel.fromJson(Map<String, dynamic> json) {
    return TrackDetailsModel(
      id: json['id'],
      title: json['title'],
      image: json['image'],
      height: json['height'],
      weight: json['weight'],
      report: json['report'],
      date: json['date'],
      shortContent: json['short_content'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'image': image,
      'height': height,
      'weight': weight,
      'report': report,
      'date': date,
      'short_content': shortContent,
    };
  }
}
