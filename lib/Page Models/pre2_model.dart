import 'package:hive/hive.dart';

part 'pre2_model.g.dart';

@HiveType(typeId: 1)
class Pre2Model{
  @HiveField(0)
  late int typeUnit;
  @HiveField(1)
  late double typeUnitPrice;


  @HiveField(3)
  late int photoUnit;
  @HiveField(4)
  late double photoUnitPrice;


  @HiveField(6)
  late int designUnit;
  @HiveField(7)
  late double designUnitPrice;


  @HiveField(9)
  late int proofUnit;
  @HiveField(10)
  late double proofUnitPrice;


  @HiveField(12)
  late int transUnit;
  @HiveField(13)
  late double transUnitPrice;


  Pre2Model(
      this.typeUnit,
      this.typeUnitPrice,
      this.photoUnit,
      this.photoUnitPrice,
      this.designUnit,
      this.designUnitPrice,
      this.proofUnit,
      this.proofUnitPrice,
      this.transUnit,
      this.transUnitPrice,
      );

}