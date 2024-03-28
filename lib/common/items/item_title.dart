import 'package:flutter/material.dart';

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
    this.selected = false,  this.cardColor, this.cardTitle
  });

  @override
  Widget build(BuildContext context) {
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
                  color: Colors.black,
                  fontSize: 20,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                  // height: 0.07,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          )
        ],
      ),
    );
  }
}
