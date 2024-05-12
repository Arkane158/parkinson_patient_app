import 'package:flutter/material.dart';

class CustomDoctorWidget extends StatelessWidget {
  const CustomDoctorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        width: size.width * .5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: size.height * .016,
            ),
            CircleAvatar(
              radius: size.width * 0.15,
              backgroundColor: Theme.of(context).primaryColor,
              backgroundImage: const AssetImage('assets/images/doctor_ex.png'),
            ),
            SizedBox(height: size.height * .01),
            const Text(
              'Dr. Ahmed Ali',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 5.0),
            const Text(
              'Physiatrist',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 5.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.location_on_outlined,
                    color: Color(0xff757575)),
                SizedBox(width: size.width * .01),
                const Text(
                  'Nasr City, Cairo',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff757575),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
