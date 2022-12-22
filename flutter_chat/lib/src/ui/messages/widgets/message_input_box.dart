import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MessageInputBox extends StatelessWidget {
  const MessageInputBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.image_outlined),
            ),
          ),
          Expanded(
            flex: 1,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.video_call_outlined),
            ),
          ),
          Expanded(
            flex: 10,
            child: TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'message...',
                contentPadding: EdgeInsets.symmetric(
                  vertical: 2.h,
                  horizontal: 5.w,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.send),
            ),
          ),
        ],
      ),
    );
  }
}
