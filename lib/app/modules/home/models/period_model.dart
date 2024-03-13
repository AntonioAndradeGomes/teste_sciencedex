import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

class PeriodModel extends Equatable {
  int? id;
  final String name;
  final DateTime dateInit;
  final DateTime dateEnd;
  final String category;
  final String? goal1;
  final String? goal2;

  PeriodModel({
    this.id,
    required this.name,
    required this.dateInit,
    required this.dateEnd,
    required this.category,
    this.goal1,
    this.goal2,
  });

  String get dateInitFormated => DateFormat('dd/MM/yyyy').format(dateInit);
  String get dateEndFormated => DateFormat('dd/MM/yyyy').format(dateEnd);
  String get periodDatesFormated => '$dateInitFormated a $dateEndFormated';

  @override
  List<Object?> get props => [
        id,
        name,
        dateInit,
        dateEnd,
        category,
        goal1,
        goal2,
      ];

  factory PeriodModel.fromJson(Map<String, dynamic> data) => PeriodModel(
        id: data['id'],
        name: data['name'],
        dateInit: DateTime.parse(data['dateInit']),
        dateEnd: DateTime.parse(data['dateEnd']),
        category: data['category'],
        goal1: data['goal1'],
        goal2: data['goal2'],
      );

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'name': name,
      'dateInit': dateInit.toIso8601String(),
      'dateEnd': dateEnd.toIso8601String(),
      'category': category,
      'goal1': goal1,
      'goal2': goal2,
    };
    return map;
  }
}
