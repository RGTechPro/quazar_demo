import 'package:flutter/material.dart';

class EventError extends StatelessWidget {
  final String errorMessage;
  final VoidCallback onRetry;

  const EventError({
    required this.errorMessage,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
   const     Icon(
          Icons.error_outline,
          size: 48,
          color: Colors.red,
        ),
     const   SizedBox(height: 16),
        Text(
          errorMessage,
          style:const TextStyle(
            fontSize: 16,
            color: Colors.red,
          ),
          textAlign: TextAlign.center,
        ),
       const SizedBox(height: 16),
        ElevatedButton(
          onPressed: onRetry,
          child:const  Text('Retry'),
        ),
      ],
    );
  }
}