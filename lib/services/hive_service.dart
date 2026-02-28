import 'package:hive/hive.dart';
import '../core/data/model/card_model.dart';
class HiveService {
  static String boxName = 'cards';
  final box = Hive.box(boxName);

  Future<void> saveCard(CardModel contact) async {
    await box.add(contact.toMap());
  }

  List<CardModel> getAllCards() {
    return box.values
        .map((e) => CardModel.fromMap(Map.from(e)))
        .toList();
  }

  Future<void> deleteCard(int index) async {
    await box.deleteAt(index);
  }

  Future<void> clearAll() async {
    await box.clear();
  }
}