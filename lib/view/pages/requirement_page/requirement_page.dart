import 'package:flutter/material.dart';
import 'package:lilac_test/constants/colors.dart';
import 'package:lilac_test/view/common/common_button.dart';
import 'package:lilac_test/view/pages/requirement_page/requirement_list.dart';

class RequirementPage extends StatelessWidget {
  const RequirementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Requirement List'),
        ),
        body: Column(
          children: [
            CommonButton(
              color: primary,
              widget: Text(
                'Requirements',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => RequirementList()));
              },
            )
          ],
        ));
  }
}
