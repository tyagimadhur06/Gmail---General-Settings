import 'package:flutter/material.dart';

class DraggableStars extends StatefulWidget {
  const DraggableStars({super.key});

  @override
  State<DraggableStars> createState() => _DraggableStarsState();
}

class _DraggableStarsState extends State<DraggableStars> {
  List<StarData> stars = [
    StarData(color: Colors.blue),
    StarData(color: Colors.green),
    StarData(color: Colors.orange),
  ]; //
  @override
  Widget build(BuildContext context) {
    return Row(
      children: stars.map((star) {
        return Draggable(
          data: star,
          child: _buildStar(star),
          feedback: _buildStar(star, isFeedback: true),
          childWhenDragging:
              Container(), // Widget shown in place of the original when dragging
          onDragCompleted: () {
            setState(() {});
          },
        );
      }).toList(),
    );
  }

  Widget _buildStar(StarData star, {bool isFeedback = false}) {
    return DragTarget<StarData>(
      builder: (context, candidateData, rejectedData) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 5),
          child: Icon(
            Icons.star,
            color: isFeedback ? Colors.grey : star.color,
            size: 30,
          ),
        );
      },
      onWillAccept: (data) {
        return true;
      },
      onAccept: (data) {
        setState(() {
          if (!stars.contains(data)) {
            stars.add(data);
          }
        });
      },
      onLeave: (data) {
        setState(() {
          // Example: Dim the target star slightly
          star = star.copyWith(color: star.color.withOpacity(0.7));
        });

        // 2. Data Handling:
        if (!stars.contains(data)) {
          // Example: Remove temporary placeholder
          stars.removeWhere((star) => star.color == Colors.grey);
        }
      },
    );
  }
}

class StarData {
  final Color color;

  StarData({required this.color});
  StarData copyWith({Color? color}) {
    return StarData(color: color ?? this.color);
  }
}