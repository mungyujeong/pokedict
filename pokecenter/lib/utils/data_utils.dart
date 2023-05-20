import 'package:pokeapi/model/pokemon/pokemon.dart';
import 'package:pokecenter/const/type.dart';
import 'package:pokecenter/model/type_model.dart';

class DataUtils {
  static List<TypeModel> getTypeModel({required List<Types> types}) {
    List<TypeModel> results = [];
    for (int i = 0; i < types.length; i++) {
      results.addAll(
          typeInfo.where((element) => element.typeName == types[i].type?.name));
    }
    return results;
  }
}
