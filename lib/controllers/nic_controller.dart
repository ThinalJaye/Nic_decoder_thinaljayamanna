import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/nic_model.dart';
import '../utils/nic_decoder.dart';
import '../utils/nic_formats.dart';

/// Controller responsible for NIC number decoding and validation operations.
class NicController extends GetxController {
  /// The current NIC number input
  var nicTextController = TextEditingController();
  
  /// The decoded NIC data result
  var dateOfBirth = ''.obs;
  var gender = ''.obs;
  var age = 0.obs;
  var weekday = ''.obs;
  var canVote = false.obs;
  var isValid = false.obs;
  var serialNumber = ''.obs;
  final RxString nicFormat = ''.obs;

  /// Validates and decodes the input NIC number.
  /// Returns true if successful, false otherwise.
  void decodeNic() {
    String nic = nicTextController.text.trim();
    try {
      if (nic.isEmpty) {
        Get.snackbar('Error', 'Please enter NIC number');
        return;
      }
      

      NicModel nicModel = NicDecoder.decodeNic(nic);
      dateOfBirth.value = nicModel.dateOfBirth;
      gender.value = nicModel.gender;
      age.value = nicModel.age;
      weekday.value = nicModel.weekday;
      canVote.value = nicModel.canVote;
      serialNumber.value = nicModel.serialNumber;
      isValid.value = true;
      detectFormat(nic);
    } catch (e) {
      Get.snackbar('Error', 'Invalid NIC format');
      isValid.value = false;
    }
  }

  /// Determines the NIC format.
  /// Returns 'Old Format (9 digits + letter)', 'New Format (12 digits)', or 'Invalid Format'.
  void detectFormat(String nic) {
    if (NICFormats.isOldFormat(nic)) {
      nicFormat.value = 'Old Format (9 digits + letter)';
    } else if (NICFormats.isNewFormat(nic)) {
      nicFormat.value = 'New Format (12 digits)';
    } else {
      nicFormat.value = 'Invalid Format';
    }
  }

  @override
  void onClose() {
    nicTextController.dispose();
    super.onClose();
  }
}