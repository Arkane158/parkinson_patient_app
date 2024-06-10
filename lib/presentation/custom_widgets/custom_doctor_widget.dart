import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:parkinson_app/model/model/doctor.dart';

class CustomDoctorWidget extends StatelessWidget {
  final DoctorData doctor;

  const CustomDoctorWidget({Key? key, required this.doctor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var spacing = size.height * .01;

    // Function to truncate long address
    String truncateAddress(String address) {
      const maxLength = 30; // Maximum length of the address
      if (address.length > maxLength) {
        return '${address.substring(0, maxLength)}...'; // Truncate and add ellipsis
      } else {
        return address; // Return full address if it's not too long
      }
    }

    return Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        width: size.width * .5,
        height: size.height * .4, // Increase the height here
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: size.height * .02, // Adjust initial height as needed
            ),
            CachedNetworkImage(
              imageUrl: doctor.img,
              imageBuilder: (context, imageProvider) => CircleAvatar(
                radius: size.width * 0.12,
                backgroundColor: Colors.transparent,
                backgroundImage: imageProvider,
              ),
              placeholder: (context, url) => CircleAvatar(
                radius: size.width * 0.12, // Match radius with image
                backgroundColor: Colors.grey,
                child: const Icon(
                  Icons.person,
                  color: Colors.white,
                ),
              ),
              errorWidget: (context, url, error) => CircleAvatar(
                radius: size.width * 0.12, // Match radius with image
                backgroundColor: Colors.grey,
                child: const Icon(
                  Icons.error,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: spacing,
            ),
            SizedBox(height: size.height * .01),
            Text(
              doctor.name,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
            const Text(
              'doctor.speciality',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: spacing,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.location_on_outlined,
                  color: Color(0xff757575),
                ),
                const SizedBox(width: 8), // Fixed space of 8 pixels
                Flexible(
                  child: Tooltip(
                    message: doctor.address, // Display full address on hover
                    child: Text(
                      truncateAddress(doctor.address), // Truncate long address
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff757575),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: spacing * 3, // Additional space at the bottom
            ),
          ],
        ),
      ),
    );
  }
}
