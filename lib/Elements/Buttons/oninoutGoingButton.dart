import 'package:flutter/material.dart';

class OnInOutGoingButton extends StatefulWidget {
  final int selectedButtonIndex;

  const OnInOutGoingButton({
    Key? key,
    required this.selectedButtonIndex,
  }) : super(key: key);

  @override
  State<OnInOutGoingButton> createState() => _OnInOutGoingButtonState();
}

class _OnInOutGoingButtonState extends State<OnInOutGoingButton> {
  late int _selectedButtonIndex = 0;

  @override
  void initState() {
    super.initState();
    _selectedButtonIndex = widget.selectedButtonIndex;
  }

  final List<String> buttonLabels = [
    'Đang diễn ra',
    'Sắp diễn ra',
    'Đã kết thúc'
  ];
  final List<Color> buttonColors = [
    const Color(0xffF5F5F5),
    const Color(0xffF5F5F5),
    const Color(0xffF5F5F5),
  ];
  final List<Color> textColors = [Colors.white, Colors.white, Colors.white];

  _OnInOutGoingButtonState() {
    _updateButtonColors();
  }

  void _onButtonPressed(int index) {
    setState(() {
      if (_selectedButtonIndex != -1) {
        buttonColors[_selectedButtonIndex] = const Color(0xffF5F5F5);
        textColors[_selectedButtonIndex] = Colors.black;
      }

      buttonColors[index] = const Color(0xff0269E9);
      textColors[index] = Colors.white;
      _selectedButtonIndex = index;
    });
  }

  void _updateButtonColors() {
    for (int i = 0; i < buttonColors.length; i++) {
      if (i == _selectedButtonIndex) {
        buttonColors[i] = const Color(0xff0269E9);
        textColors[i] = Colors.white;
      } else {
        buttonColors[i] = const Color(0xffF5F5F5);
        textColors[i] = Colors.black;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(buttonLabels.length, (index) {
        final isSelected = index == widget.selectedButtonIndex;

        return Container(
          height: 55,
          padding: const EdgeInsets.all(2),
          child: ElevatedButton(
            onPressed: () => _onButtonPressed(index),
            style: ButtonStyle(
              elevation: MaterialStateProperty.all(0),
              backgroundColor: MaterialStateProperty.all(
                isSelected ? const Color(0xff0269E9) : const Color(0xffF5F5F5),
              ),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            child: Text(
              buttonLabels[index],
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: isSelected ? Colors.white : Colors.black,
                //color: textColors[index],
              ),
            ),
          ),
        );
      }),
    );
  }
}
