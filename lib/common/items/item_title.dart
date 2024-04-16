import 'package:flutter/material.dart';

import '../../level3/list_drag_component.dart';

class ItemTile extends StatelessWidget {
  final VoidCallback? onTap;
  final int index;
  final bool selected;
  String? cardTitle = '';
  Color? cardColor = Colors.orangeAccent;

   ItemTile({
    super.key,
    this.onTap,
    required this.index,
    required this.selected,  this.cardColor, this.cardTitle
  });

  @override
  Widget build(BuildContext context) {
    print(cardColor);
    return Padding(
      padding: const EdgeInsets.all(2),
      child: Column(
        children: [
          Container(
            height: 60,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: cardColor,
            ),
            child: Center(
              child: Text(
                  cardTitle ?? '',
                style: TextStyle(
                  color: selected ? Colors.white : Colors.black,
                  fontSize: 20,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                  // height: 0.07,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
