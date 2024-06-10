import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WeekPicker extends StatefulWidget {
  final Function(DateTime) onDateSelected;
  final double itemWidth;
  final Color primaryColor;

  const WeekPicker({
    Key? key,
    required this.onDateSelected,
    required this.primaryColor,
    this.itemWidth = 85.0, // Default value for itemWidth
  }) : super(key: key);

  @override
  WeekPickerState createState() => WeekPickerState();
}

class WeekPickerState extends State<WeekPicker>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  DateTime? selectedDate;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300), // Adjust duration as needed
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleSelected(DateTime date) {
    setState(() {
      selectedDate = date;
    });
    widget.onDateSelected(date);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * .12, // Set a fixed height
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 14, // 14 days
        itemBuilder: (context, index) {
          final currentDate = DateTime.now().add(Duration(days: index));
          final isSelected = currentDate.day == selectedDate?.day;
          final dayOfMonth = DateFormat('d')
              .format(currentDate); // Single 'd' for day without leading zeros
          final dayName = DateFormat.EEEE().format(currentDate);
          final month = DateFormat('M').format(
              currentDate); // Single 'M' for month without leading zeros

          return GestureDetector(
            onTap: () {
              _toggleSelected(currentDate);
              if (isSelected) {
                _animationController.reverse();
              } else {
                _animationController.forward();
              }
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300), // Animation duration
              width: widget.itemWidth,
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color:
                    isSelected ? Theme.of(context).primaryColor : Colors.white,
                borderRadius: BorderRadius.circular(isSelected ? 30 : 8),
                border: Border.all(
                  color: Colors.grey,
                  width: 1.0,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).primaryColor.withOpacity(0.5),
                    spreadRadius: isSelected ? 1 : 0,
                    blurRadius: 2,
                    offset: isSelected ? const Offset(0, 1) : Offset.zero,
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    dayOfMonth,
                    style: TextStyle(
                      fontSize: 18,
                      color: isSelected ? Colors.white : Colors.black,
                    ),
                  ),
                  Text(
                    dayName,
                    style: TextStyle(
                      fontSize: 12,
                      color: isSelected ? Colors.white : Colors.black,
                    ),
                  ),
                  Text(
                    month,
                    style: TextStyle(
                      fontSize: 12,
                      color: isSelected ? Colors.white : Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
