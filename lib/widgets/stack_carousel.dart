import 'package:flutter/material.dart';

class CardModel {
  final int id;
  double zIndex;
  final Widget? child;

  CardModel({required this.id, this.zIndex = 0.0, this.child});
}

class StackCarousel extends StatefulWidget {
  final List<Widget> widgets;
  final Function(int) onClicked;
  final int? currentIndex;

  const StackCarousel({
    super.key,
    required this.widgets,
    required this.onClicked,
    this.currentIndex,
  });

  @override
  StackCarouselState createState() => StackCarouselState();
}

class StackCarouselState extends State<StackCarousel> {
  double currentIndex = 2;

  @override
  void initState() {
    if (widget.currentIndex != null) {
      currentIndex = widget.currentIndex!.toDouble();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 55.0, bottom: 55),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return GestureDetector(
            onPanUpdate: (details) {
              setState(() {
                final index = currentIndex - details.delta.dx * 0.01;
                if (index >= -1 && index <= widget.widgets.length - 1) {
                  currentIndex = index;
                }
              });
            },
            onPanEnd: (details) {
              setState(() {
                currentIndex = currentIndex.ceil().toDouble();
              });
            },
            child: OverlappedCarouselCardItems(
              cards: List.generate(
                widget.widgets.length,
                    (index) => CardModel(id: index, child: widget.widgets[index]),
              ),
              centerIndex: currentIndex,
              maxWidth: constraints.maxWidth,
              maxHeight: constraints.maxHeight,
              onClicked: widget.onClicked,
            ),
          );
        },
      ),
    );
  }
}

class OverlappedCarouselCardItems extends StatelessWidget {
  final List<CardModel> cards;
  final Function(int) onClicked;
  final double centerIndex;
  final double maxHeight;
  final double maxWidth;

  const OverlappedCarouselCardItems({
    super.key,
    required this.cards,
    required this.centerIndex,
    required this.maxHeight,
    required this.maxWidth,
    required this.onClicked,
  });

  double getCardPosition(int index) {
    final double center = maxWidth / 2;
    final double centerWidgetWidth = maxWidth / 9;
    final double basePosition = center - centerWidgetWidth / 2 - 20;
    final distance = centerIndex - index;

    final double nearWidgetWidth = centerWidgetWidth / 5 * 4;
    final double farWidgetWidth = centerWidgetWidth / 5 * 3;

    if (distance == 0) {
      return basePosition;
    } else if (distance.abs() > 0.0 && distance.abs() <= 1.0) {
      if (distance > 0) {
        return basePosition - nearWidgetWidth * distance.abs();
      } else {
        return basePosition + centerWidgetWidth * distance.abs();
      }
    } else if (distance.abs() >= 1.0 && distance.abs() <= 2.0) {
      if (distance > 0) {
        return (basePosition - nearWidgetWidth) -
            farWidgetWidth * (distance.abs() - 1);
      } else {
        return (basePosition + centerWidgetWidth + nearWidgetWidth) +
            farWidgetWidth * (distance.abs() - 2) -
            (nearWidgetWidth - farWidgetWidth) * (distance - distance.floor());
      }
    } else {
      if (distance > 0) {
        return (basePosition - nearWidgetWidth) -
            farWidgetWidth * (distance.abs() - 1);
      } else {
        return (basePosition + centerWidgetWidth + nearWidgetWidth) +
            farWidgetWidth * (distance.abs() - 2);
      }
    }
  }

  double getCardWidth(int index) {
    final double distance = (centerIndex - index).abs();
    final double centerWidgetWidth = maxWidth / 3.5;
    final double nearWidgetWidth = centerWidgetWidth / 5 * 4.5;
    final double farWidgetWidth = centerWidgetWidth / 5 * 3.5;

    if (distance >= 0.0 && distance < 1.0) {
      return centerWidgetWidth -
          (centerWidgetWidth - nearWidgetWidth) * (distance - distance.floor());
    } else if (distance >= 1.0 && distance < 2.0) {
      return nearWidgetWidth -
          (nearWidgetWidth - farWidgetWidth) * (distance - distance.floor());
    } else {
      return farWidgetWidth;
    }
  }

  Matrix4 getTransform(int index) {
    final distance = centerIndex - index;

    final transform = Matrix4.identity()
      ..setEntry(3, 2, 0.007)
      ..rotateY(-0.25 * distance)
      ..scale(1.25, 1.25, 1.25);
    if (index == centerIndex) transform.scale(1.05, 1.05, 1.05);
    return transform;
  }

  Widget _buildItem(CardModel item) {
    final int index = item.id;
    final width = getCardWidth(index);
    final height = maxHeight - 20 * (centerIndex - index).abs();
    final position = getCardPosition(index);
    final verticalPadding = width * 0.05 * (centerIndex - index).abs();

    return Positioned(
      left: position,
      child: Transform(
        transform: getTransform(index),
        alignment: FractionalOffset.center,
        child: Container(
          width: width,
          padding: EdgeInsets.symmetric(vertical: verticalPadding),
          height: height > 0 ? height : 0,
          child: item.child,
        ),
      ),
    );
  }

  List<Widget> _sortedStackWidgets(List<CardModel> widgets) {
    for (int i = 0; i < widgets.length; i++) {
      if (widgets[i].id == centerIndex) {
        widgets[i].zIndex = widgets.length.toDouble();
      } else if (widgets[i].id < centerIndex) {
        widgets[i].zIndex = widgets[i].id.toDouble();
      } else {
        widgets[i].zIndex =
            widgets.length.toDouble() - widgets[i].id.toDouble();
      }
    }
    widgets.sort((a, b) => a.zIndex.compareTo(b.zIndex));
    return widgets.map((e) {
      final double distance = (centerIndex - e.id).abs();
      if (distance >= 0 && distance <= 3) {
        return _buildItem(e);
      } else {
        return Container();
      }
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: AlignmentDirectional.center,
        clipBehavior: Clip.none,
        children: _sortedStackWidgets(cards),
      ),
    );
  }
}
