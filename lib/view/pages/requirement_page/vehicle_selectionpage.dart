import 'package:flutter/material.dart';
import 'package:lilac_test/view/pages/requirement_page/requirement_list.dart';

class VehicleSelectionPage extends StatelessWidget {
  const VehicleSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('What would you preffered to have'),
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                VehicleButton(
                  image: 'assets/images/bike.png',
                  onTap: () {},
                ),
                VehicleButton(
                  image: 'assets/images/car.png',
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => RequirementList()));
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class VehicleButton extends StatelessWidget {
  final String image;
  final void Function() onTap;
  const VehicleButton({
    super.key,
    required this.image,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: 100,
        width: 100,
        child: Container(
          height: 60,
          width: 60,
          decoration:
              BoxDecoration(image: DecorationImage(image: AssetImage(image))),
        ),
      ),
    );
  }
}
