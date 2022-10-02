import 'package:dggcourses/shared/theme.dart';
import 'package:flutter/material.dart';

class Toggle extends StatelessWidget {

  String currentToggle;
  String left;
  String right;
  Function() leftPress;
  Function() rightPress;

  Toggle({
    required this.currentToggle, 
    required this.left, 
    required this.right,
    required this.leftPress,
    required this.rightPress
  });

  @override
  Widget build(BuildContext context) {

    Widget renderLeftSide() {
      return currentToggle == "left" ?
      GestureDetector(
        onTap: leftPress,
        child: Container(
          height: 48,
          width: (MediaQuery.of(context).size.width - 48) * 0.5,
          decoration: BoxDecoration(
            color: secondaryColor,
            borderRadius: BorderRadius.circular(12)
          ),
          child: Center(
            child: Text(
              left,
              style: poppinsText.copyWith(
                fontSize: 14,
                fontWeight: reguler,
                color: white
              ),
            ),
          ),
        ),
      ) :
      Expanded(
        child: GestureDetector(
          onTap: leftPress,
          child: Center(
            child: Text(
              left,
              style: poppinsText.copyWith(
                fontSize: 14,
                fontWeight: reguler,
                color: black
              ),
            ),
          ),
        ),
      );
    }

    Widget renderRightSide() {
      return currentToggle == "right" ?
      GestureDetector(
        onTap: rightPress,
        child: Container(
          height: 48,
          width: (MediaQuery.of(context).size.width - 48) * 0.5,
          decoration: BoxDecoration(
            color: secondaryColor,
            borderRadius: BorderRadius.circular(12)
          ),
          child: Center(
            child: Text(
              right,
              style: poppinsText.copyWith(
                fontSize: 14,
                fontWeight: reguler,
                color: white
              ),
            ),
          ),
        ),
      ) :
      Expanded(
        child: GestureDetector(
          onTap: rightPress,
          child: Center(
            child: Text(
              right,
              style: poppinsText.copyWith(
                fontSize: 14,
                fontWeight: reguler,
                color: black
              ),
            ),
          ),
        ),
      );
    }

    return Container(
      height: 48,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: grey.withOpacity(0.5)
        )
      ),
      child: Row(
        children: [
          renderLeftSide(),
          renderRightSide()
        ],
      ),
    );
  }
}