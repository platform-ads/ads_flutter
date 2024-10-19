// ignore_for_file: avoid_web_libraries_in_flutter

import 'package:flutter/material.dart';
import 'dart:html' as html;

class CopyTextWidget extends StatelessWidget {
  final String textToCopy;
  final String label;

  const CopyTextWidget({super.key, required this.textToCopy, required this.label});

  void copyToClipboard() {
    // Cria um elemento de texto temporário
    final textArea = html.TextAreaElement()
      ..value = textToCopy
      ..style.position = 'fixed' // Para evitar rolagem
      ..style.opacity = '0'; // Ocultar o textarea

    html.document.body!.append(textArea);
    textArea.select();
    html.document.execCommand('copy'); // Copia o texto para a área de transferência
    textArea.remove(); // Remove o elemento após a cópia
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 300),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(textToCopy),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: copyToClipboard,
            child: Text(label),
          ),
        ],
      ),
    );
  }
}
