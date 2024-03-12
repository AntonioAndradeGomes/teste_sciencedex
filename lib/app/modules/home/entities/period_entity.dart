import 'package:intl/intl.dart';

class PeriodEntity {
  String name;
  DateTime dateInit;
  DateTime dateEnd;
  String category;
  String goal1;
  String goal2;

  PeriodEntity({
    required this.name,
    required this.dateInit,
    required this.dateEnd,
    required this.category,
    required this.goal1,
    required this.goal2,
  });

  String get dateInitFormated => DateFormat('dd/MM/yyyy').format(dateInit);
  String get dateEndFormated => DateFormat('dd/MM/yyyy').format(dateEnd);
  String get periodDatesFormated => '$dateInitFormated a $dateEndFormated';
}
