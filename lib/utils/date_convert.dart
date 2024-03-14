
import 'package:jiffy/jiffy.dart';

String dateConvert (String date) {

  var splitDate = date.split('T');
  var data = splitDate[0].split('-');

  String newDate = Jiffy.parseFromMap({Unit.year: int.parse(data[0]), Unit.month: int.parse(data[1]), Unit.day: int.parse(data[2])}).format(
      pattern: 'do, MMM yyyy');

  return newDate;
}