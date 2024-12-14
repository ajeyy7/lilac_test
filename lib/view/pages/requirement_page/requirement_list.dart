import 'package:flutter/material.dart';
import 'package:lilac_test/constants/colors.dart';
import 'package:lilac_test/view/common/common_button.dart';
import 'package:lilac_test/view/common/drop_down.dart';
import 'package:lilac_test/view_model/requirements_vm.dart';
import 'package:provider/provider.dart';

class RequirementList extends StatelessWidget {
  const RequirementList({super.key});

  @override
  Widget build(BuildContext context) {
    final requirementListVm = Provider.of<RequirementsVm>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Vehicle requirement'),
      ),
      body: Column(
        children: [
          CommonDropDown(
            items: requirementListVm.brandList,
            onChanged: (value) {
              requirementListVm.updateSelectedBrand(value);
            },
            title: 'Brand',
            selectedValue: requirementListVm.selectedBrand,
          ),
          CommonDropDown(
            items: requirementListVm.modelList,
            onChanged: (value) {
              requirementListVm.updateSelectedModel(value);
            },
            title: 'Model',
            selectedValue: requirementListVm.selectedModel,
          ),
          CommonDropDown(
            items: requirementListVm.variantList,
            onChanged: (value) {
              requirementListVm.updateSelectedVariant(value);
            },
            title: 'Variant',
            selectedValue: requirementListVm.selectedVariant,
          ),
          CommonDropDown(
            items: requirementListVm.yearList,
            onChanged: (value) {
              requirementListVm.updateSelectedYear(value);
            },
            title: 'Year',
            selectedValue: requirementListVm.selectedYear,
          ),

          ////transmission button
          CommonDropDown(
            items: requirementListVm.fuelTypeList,
            onChanged: (value) {
              requirementListVm.updateSelectedFuelType(value);
            },
            title: 'Fuel',
            selectedValue: requirementListVm.selectedFuelType,
          ),
          CommonDropDown(
            items: requirementListVm.colorList,
            onChanged: (value) {
              requirementListVm.updateSelectedColor(value);
            },
            title: 'Color',
            selectedValue: requirementListVm.selectedColor,
          ),

          CommonButton(
            onTap: (){
               requirementListVm.submitRequirement(context);
            },
              color: primary,
              widget: Text(
                'Submit',
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
    );
  }
}
