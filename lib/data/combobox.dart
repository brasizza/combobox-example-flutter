import 'package:combobox/data/models/neighborhood_model.dart';

class ComboRepoistory {
  List<dynamic> _dados = [
    {"id": 161, "name": "Alto da Boa Vista", "created": null, "modified": null},
    {"id": 188, "name": "Antas", "created": null, "modified": null},
    {"id": 51, "name": "Atenas do Sul", "created": null, "modified": null},
  ];

  Future<List<NeighborhoodModel>?> getNeighborhood() async {
    return _dados.map((nh) => NeighborhoodModel.fromMap(nh)).toList();
  }
}
