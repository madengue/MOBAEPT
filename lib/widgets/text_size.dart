// ignore_for_file: public_member_api_docs, sort_constructors_first, avoid_unnecessary_containers
import 'package:flutter/material.dart';

class SizedText extends StatelessWidget {
  final String text;
  final Color color;

  const SizedText({
    Key? key,
    required this.text,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size textSize = _textSize(text);
    return Container(
      child: Column(
        children: [
          Text(
            text,
            style: TextStyle(
                fontSize: 16, color: color, fontWeight: FontWeight.w700),
            maxLines: 1,
            softWrap: false,
            overflow: TextOverflow.clip,
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              for (int i = 0; i < textSize.width / 5; i++)
                i.isEven
                    ? Container(
                        width: 5,
                        height: 2,
                        color: color,
                      )
                    : Container(
                        width: 5,
                        height: 2,
                        color: Colors.white,
                      ),
            ],
          ),
        ],
      ),
    );
  }

  Size _textSize(String text) {
    final TextPainter textPainter = TextPainter(
      maxLines: 1,
      textDirection: TextDirection.ltr,
      text: TextSpan(
        text: text,
        style: TextStyle(
          fontSize: 16,
          color: color,
          fontWeight: FontWeight.w700,
        ),
      ),
    )..layout(maxWidth: double.infinity, minWidth: 0);
    return textPainter.size;
  }
}
