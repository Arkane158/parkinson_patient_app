import 'package:flutter/material.dart';
import 'package:parkinson_app/model/model/appointment.dart';

class AppointmentTile extends StatefulWidget {
  final Slots slot;
  final bool isSelected;

  const AppointmentTile({Key? key, required this.slot, this.isSelected = false})
      : super(key: key);

  @override
  AppointmentTileState createState() => AppointmentTileState();
}

class AppointmentTileState extends State<AppointmentTile>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _radiusAnimation;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _radiusAnimation =
        Tween<double>(begin: 25.0, end: 20.0).animate(_controller);

    // Play the animation if the tile is initially selected
    if (widget.isSelected) {
      _controller.forward();
    }
  }

  @override
  void didUpdateWidget(covariant AppointmentTile oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Play animation when the isSelected state changes
    if (widget.isSelected) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _colorAnimation = ColorTween(
      begin: Colors.white,
      end: Theme.of(context).primaryColor,
    ).animate(_controller);

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        return Container(
          height: 20.0, // Adjust this value to reduce the height
          decoration: BoxDecoration(
            color: _colorAnimation.value,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(_radiusAnimation.value),
            boxShadow: widget.isSelected
                ? [
                    BoxShadow(
                      color: Theme.of(context).primaryColor.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 2),
                    ),
                  ]
                : [],
          ),
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Text(
              widget.slot.time,
              style: TextStyle(
                fontSize: 16,
                color: widget.isSelected ? Colors.white : Colors.black,
              ),
            ),
          ),
        );
      },
    );
  }
}
