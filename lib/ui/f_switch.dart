import 'package:flutter/material.dart';
import 'package:foc_ui/foc_ui.dart';

// ignore: camel_case_types
class fSwitch extends StatefulWidget {
  final String title;
  final bool value;
  final ValueChanged<bool> onChanged;

  /// Active color
  final Color selectedColor;

  const fSwitch({
    Key? key,
    required this.title,
    required this.value,
    required this.onChanged,
    required this.selectedColor,
  }) : super(key: key);

  @override
  _fSwitchState createState() => _fSwitchState();
}

// ignore: camel_case_types
class _fSwitchState extends State<fSwitch> with SingleTickerProviderStateMixin {
  late Animation _circleAnimation;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 100));
    _circleAnimation = AlignmentTween(
            begin: widget.value ? Alignment.centerRight : Alignment.centerLeft,
            end: widget.value ? Alignment.centerLeft : Alignment.centerRight)
        .animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.linearToEaseOut,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return GestureDetector(
          onTap: () {
            if (_animationController.isCompleted) {
              _animationController.reverse();
            } else {
              _animationController.forward();
            }
            widget.value == false
                ? widget.onChanged(true)
                : widget.onChanged(false);
          },
          child: Row(
            children: [
              Container(
                width: 45.0,
                height: 28.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24.0),
                  color: _circleAnimation.value == Alignment.centerLeft
                      ? Colors.transparent
                      : widget.selectedColor,
                  border: Border.all(
                    color: widget.selectedColor.withOpacity(0.5),
                    width: 2,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 2.0,
                    bottom: 2.0,
                    right: 2.0,
                    left: 2.0,
                  ),
                  child: Container(
                    alignment: widget.value
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Container(
                      width: 20.0,
                      height: 20.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _circleAnimation.value == Alignment.centerLeft
                            ? widget.selectedColor
                            : Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              vSpaceSmall,
              fText.bodyText2(widget.title, context: context),
            ],
          ),
        );
      },
    );
  }
}
