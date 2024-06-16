import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircularProgressIndicator(), // Indikator loading
          SizedBox(height: 16), // Spasi antara indikator loading dan teks
          Text('Loading...'), // Teks untuk menunjukkan bahwa sedang proses loading
        ],
      ),
    );
  }
}
