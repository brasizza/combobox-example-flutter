import 'package:combobox/data/combobox.dart';
import 'package:combobox/data/models/neighborhood_model.dart';
import 'package:flutter/material.dart';

class HomeController {
  final _repository = ComboRepoistory();
  Future<List<DropdownMenuItem<NeighborhoodModel>>> buildCombobox() async {
    final _neighborhoods = await _repository.getNeighborhood();

    return _setDropDown(_neighborhoods);
  }

  _setDropDown(List<NeighborhoodModel>? neighborhoods) {
    List<DropdownMenuItem<NeighborhoodModel>> _item = [];
    if (neighborhoods != null) {
      neighborhoods.forEach((neighborhood) {
        _item.add(DropdownMenuItem(
          child: Text(neighborhood.name!),
          value: neighborhood,
        ));
      });

      return _item;
    }
  }
}
