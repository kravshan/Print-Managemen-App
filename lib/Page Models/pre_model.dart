import 'package:hive/hive.dart';

part 'pre_model.g.dart';

@HiveType(typeId: 0)
class PreModel{
  @HiveField(0)
  late String paperType;
  @HiveField(1)
  late int rmsPkt;
  @HiveField(2)
  late double unitPrice;

  PreModel(this.paperType, this.rmsPkt, this.unitPrice);
}