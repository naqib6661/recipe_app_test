import 'package:flutter/material.dart';
import 'package:task/core/constants/colors.dart';

class CustomSearchBar extends StatelessWidget {
  final Function(String) onChanged;
  const CustomSearchBar({ required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 5.0,left: 5),
      child: TextField(

        decoration: InputDecoration(
          hintText: "Search",
         hintStyle: TextStyle(
           fontSize: 14,
           color: Colors.grey
         ),
         filled: true,
          fillColor: textFieldColor,
          prefixIcon: Icon(Icons.search),
          suffixIcon: Container(
              decoration: BoxDecoration(
                color: Colors.white38,
                borderRadius: BorderRadius.circular(50),

              ),
              child: Icon(Icons.close,size: 18,)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,

          ),
        ),
        onChanged: onChanged,
      ),
    );
  }
}
