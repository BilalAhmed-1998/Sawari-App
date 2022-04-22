import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sawari/Classes/Address.dart';

class DataChangesOverTime extends ChangeNotifier {
  Address pickupLocation, dropoffLocation;


   void updatePickUpLocationAddress(Address pickupAddress) {
    pickupLocation = pickupAddress;
    notifyListeners();
  }

  void updateDropOffLocationAddress(Address dropoffAddress) {
    dropoffLocation =dropoffAddress;
    notifyListeners();
  }
}
