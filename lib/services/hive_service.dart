import 'package:hive/hive.dart';
import '../features/scan/data/model/card_model.dart';
class HiveService {
  static String boxName = 'cards';
  final box = Hive.box(boxName);

  Future<void> saveContact(CardModel contact) async {
    await box.add(contact.toMap());
  }

  List<CardModel> getAllContacts() {
    return box.values
        .map((e) => CardModel.fromMap(Map.from(e)))
        .toList();
  }

  Future<void> deleteContact(int index) async {
    await box.deleteAt(index);
  }

  Future<void> clearAll() async {
    await box.clear();
  }
}