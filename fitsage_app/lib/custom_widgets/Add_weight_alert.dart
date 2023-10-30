import 'package:fitsage_app/custom_widgets/button.dart';
import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSave;
  final VoidCallback onCancel;

  DialogBox({
    Key? key,
    required this.onSave,
    required this.controller,
    required this.onCancel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Text(
              "Current Weight",
              style: TextStyle(
                fontFamily: "source sans pro",
                fontSize: 18,
                color: Colors.black.withOpacity(0.6),
                fontWeight: FontWeight.normal,
                decoration: TextDecoration.none,
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: controller,
              cursorColor: const Color(0xFF514644),
              decoration: InputDecoration(
                alignLabelWithHint: true,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                    color: Color(0xFF514644),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                    color: Color(0xFFEFC8B1),
                  ),
                ),
                labelText: '65',
                labelStyle: const TextStyle(fontSize: 18),
                contentPadding: const EdgeInsets.all(15),
                floatingLabelBehavior: FloatingLabelBehavior.never,
                suffixText: 'Losing 2kg',
                suffixStyle: const TextStyle(fontSize: 10),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Save button
                MyButton(text: "Save", onPressed: onSave),

                const SizedBox(width: 10),

                // Cancel button
                MyButton(text: "Cancel", onPressed: onCancel),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
