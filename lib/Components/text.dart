import 'package:flutter/material.dart';

Widget textfill({required context, required name, required size}) {
  return Container(
    height: size.height * 0.05,
    alignment: Alignment.center,
    child: TextField(
      cursorColor: Colors.black,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 20,
            color: Colors.orange,
          ),
        ),
        hintText: name,
        hintStyle: TextStyle(
            fontSize: size.height * 0.016, color: Colors.grey.shade500),
        prefixIcon: Icon(
          Icons.search,
          size: size.height * 0.028,
          color: Colors.grey,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            width: 2,
            color: Colors.grey,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            width: 2,
            color: Colors.grey,
          ),
        ),
      ),
    ),
  );
}
