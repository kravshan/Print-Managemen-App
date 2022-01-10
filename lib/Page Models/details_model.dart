import 'package:hive/hive.dart';

part 'details_model.g.dart';

@HiveType(typeId: 2)
class DetailsModel{
  @HiveField(0)
  late String date;
  @HiveField(1)
  late String quotation;
  @HiveField(3)
  late String clientName;
  @HiveField(4)
  late String job;

  DetailsModel(this.date, this.quotation, this.clientName, this.job);
}