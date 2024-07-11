import 'package:flutter/material.dart';
import '../screens/places_screen.dart';

class Recommendations extends StatefulWidget {
  final Widget? title;
  final Widget? title2;
  final double? height;
  final double? width;
  final double? insideContainerHeight;
  final double? insideContainerWidth;
  final double? outsideFirstContainerHeight;
  final double? outsideFirstContainerWidth;
  final double? outsideSecondContainerHeight;
  final double? outsideSecondContainerWidth;
  final bool showSaveButton;
  final bool isRow;
  final bool textInside;

  // Constructor for inside layout
  const Recommendations.inside({
    super.key,
    required this.isRow,
    required this.showSaveButton,
    this.title,
    this.title2,
    this.insideContainerHeight,
    this.insideContainerWidth,
    this.height,
    this.width,
  }) : textInside = true,
       outsideFirstContainerHeight = null,
       outsideFirstContainerWidth = null,
       outsideSecondContainerHeight = null,
       outsideSecondContainerWidth = null;

  // Constructor for outside layout
  const Recommendations.outside({
    super.key,
    required this.isRow,
    required this.showSaveButton,
    this.title,
    this.title2,
    this.outsideFirstContainerHeight,
    this.outsideFirstContainerWidth,
    this.outsideSecondContainerHeight,
    this.outsideSecondContainerWidth,
    this.height,
    this.width,
  }) : textInside = false,
       insideContainerHeight = null,
       insideContainerWidth = null;

  @override
  State<Recommendations> createState() => _RecommendationsState();
}

class _RecommendationsState extends State<Recommendations> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const PlacesScreen()
          )
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 3.0),
        child: Card(
          elevation: 5,
          child: SizedBox(
            width: widget.width,
            height: widget.height,
            child: widget.textInside
              ? _buildInsideTextLayout()
              : widget.isRow
                ? _rowLayout()
                : _columnLayout(),
          )
        )
      )
    );
  }

  Widget _buildInsideTextLayout() {
    return Stack(
      children: [
        _imageContainer(borderRadius: BorderRadius.circular(15)),
        Align(
          alignment: widget.isRow ? Alignment.centerRight : Alignment.bottomCenter,
          child: Container(
            width: widget.insideContainerWidth,
            height: widget.insideContainerHeight,
            color: Colors.black12,
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (widget.title != null) widget.title!,
                if (widget.title2 != null) widget.title2!,
              ]
            )
          )
        ),
        if (widget.showSaveButton == true && widget.isRow == true) _saveButton(left: 5, top: 5),
        if (widget.showSaveButton == true && widget.isRow == false) _saveButton(right: 5, top: 5)
      ],
    );
  }

  Widget _rowLayout() {
    return Row(
      children: [
        _imageContainer(
          borderRadius: const BorderRadius.horizontal(left: Radius.circular(15)),
          height: widget.outsideFirstContainerHeight,
          width: widget.outsideFirstContainerWidth,
        ),
        Expanded(
          child: Stack(
            children: [
              Container(
                height: widget.outsideSecondContainerHeight,
                width: widget.outsideSecondContainerWidth,
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (widget.title != null) widget.title!,
                      if (widget.title2 != null) widget.title2!,
                    ]
                  )
                )
              ),
              if (widget.showSaveButton) _saveButton(right: 5, top: 5),
            ]
          )
        )
      ],
    );
  }

  Widget _columnLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            _imageContainer(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
              height: widget.outsideFirstContainerHeight,
              width: widget.outsideFirstContainerWidth,
            ),
            if (widget.showSaveButton) _saveButton(right: 5, top: 5),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          child: Column(
            children: [
              if (widget.title != null) widget.title!,
              if (widget.title2 != null) widget.title2!,
            ]
          )
        )
      ]
    );
  }

  Widget _imageContainer({
    BorderRadius? borderRadius,
    double? height,
    double? width,
  }) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        image: const DecorationImage(
          image: AssetImage('images/Flutter-feature.png'),
          fit: BoxFit.cover,
        ),
      )
    );
  }

  Widget _saveButton({
    double? right,
    double? left,
    double? top,
    double? bottom
  }) {
    return Positioned(
      right: right,
      left: left,
      top: top,
      bottom: bottom,
      child: IconButton(
        onPressed: () {
          setState(() {
            isSelected = !isSelected;
          });
        },
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(
            Colors.white
          )
        ),
        icon: Icon(
          isSelected ? Icons.favorite : Icons.favorite_outline,
          color: isSelected ? Colors.red : Colors.black,
        )
      )
    );
  }
}
