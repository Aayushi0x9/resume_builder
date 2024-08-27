import 'package:flutter/material.dart';

Widget buildInputField(
  // dynamic controller,
  String label,
  IconData icon,
  String hint,
  Function(String?) onSave,
  String? Function(String?) validator, {
  TextInputType keyboardType = TextInputType.text,
  int maxLength = 0,
  String? initialValue,
  int maxLines = 1,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 5),
        Transform(
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.001)
            ..rotateX(0.05)
            ..rotateY(0.05),
          alignment: FractionalOffset.center,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                colors: [
                  Colors.teal.shade50, // Start color
                  Colors.teal.shade100, // End color
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              // Optional: You can keep the boxShadow or remove it if it doesn't match well with the gradient.
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  offset: Offset(3, 3),
                  blurRadius: 5,
                  spreadRadius: 2,
                ),
                BoxShadow(
                  color: Colors.white.withOpacity(0.7),
                  offset: Offset(-3, -3),
                  blurRadius: 10,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: TextFormField(
              // controller: controller,
              onSaved: onSave,
              validator: validator,
              initialValue: initialValue,
              keyboardType: keyboardType,
              maxLength: maxLength > 0 ? maxLength : null,
              maxLines: maxLines,
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: const TextStyle(
                  fontSize: 12,
                ),
                // prefixIcon: Icon(icon, color: Colors.teal),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors
                    .transparent, // Set to transparent to show the gradient
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
