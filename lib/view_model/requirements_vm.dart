import 'package:flutter/material.dart';
import 'package:lilac_test/api_service/apiservices.dart';

class RequirementsVm extends ChangeNotifier {
  bool isLoading = false;
  String? errorMessage;

  String? selectedBrand;
  String? selectedModel;
  String? selectedVariant;
  String? selectedTransmission = '1';
  String? selectedFuelType;
  String? selectedColor;
  String? selectedYear;

  List<String> brandList = ['1', '2', '3'];
  List<String> modelList = ['1', '2', '3'];
  List<String> variantList = ['1', '2', '3'];
  List<String> yearList = ['2023', '2024', '2025'];
  List<String> fuelTypeList = ['1', '2'];
  List<String> colorList = ['1', '2', '3'];

  final ApiServices apiServices = ApiServices();

  void updateSelectedBrand(String? value) {
    selectedBrand = value;
    notifyListeners();
  }

  void updateSelectedModel(String? value) {
    selectedModel = value;
    notifyListeners();
  }

  void updateSelectedVariant(String? value) {
    selectedVariant = value;
    notifyListeners();
  }

  void updateSelectedFuelType(String? value) {
    selectedFuelType = value;
    notifyListeners();
  }

  void updateSelectedColor(String? value) {
    selectedColor = value;
    notifyListeners();
  }

  void updateSelectedYear(String? value) {
    selectedYear = value;
    notifyListeners();
  }

  Future<void> submitRequirement(BuildContext context) async {
    if (selectedBrand == null ||
        selectedModel == null ||
        selectedVariant == null ||
        selectedFuelType == null ||
        selectedColor == null ||
        selectedYear == null) {
      errorMessage = "Please fill all fields";
      notifyListeners();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill all fields")),
      );
      return;
    }

    final data = {
      "vehicle_type_id": "1",
      "brand_id": selectedBrand!,
      "vehicle_model_id": selectedModel!,
      "vehicle_variant_id": selectedVariant!,
      "transmission_id": selectedTransmission!,
      "fuel_type_id": selectedFuelType!,
      "vehicle_color_id": selectedColor!,
      "year": selectedYear!,
    };

    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      final response = await apiServices.addRequirement(data);

      if (response['status'] == true) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Requirement submitted successfully!")),
        );
      } else {
        throw Exception(response['message']);
      }
    } catch (e) {
      errorMessage = e.toString();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: $errorMessage")),
      );
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
