
import 'package:flutter/material.dart';

class UiProvider extends ChangeNotifier {

  int _selectedMenuOpt = 1;

  int get selectedMenuOpt {
    return _selectedMenuOpt;
  }

  set selectedMenuOpt(int i){
    _selectedMenuOpt = i;
    notifyListeners();
  }



}