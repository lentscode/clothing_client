import "package:cached_network_image/cached_network_image.dart";
import "package:flutter/material.dart";
import "package:shared/shared.dart";

class ClothesImagesGrid extends StatelessWidget {
  const ClothesImagesGrid({super.key, required this.clothes});

  final List<Clothing> clothes;

  @override
  Widget build(BuildContext context) => switch (clothes.length) {
        0 => _buildImage(null),
        1 => _buildImage(
            clothes[0].imageUrl,
          ),
        2 => Row(
            children: <Widget>[
              Expanded(child: _buildImage(clothes[0].imageUrl)),
              _buildSeparator(true),
              Expanded(child: _buildImage(clothes[1].imageUrl)),
            ],
          ),
        _ => Row(
            children: <Widget>[
              Expanded(child: _buildImage(clothes[0].imageUrl)),
              _buildSeparator(true),
              Expanded(
                child: Column(
                  children: <Widget>[
                    Expanded(child: _buildImage(clothes[1].imageUrl)),
                    _buildSeparator(false),
                    Expanded(child: _buildImage(clothes[2].imageUrl)),
                  ],
                ),
              )
            ],
          )
      };

  Widget _buildImage(String? imageUrl) => Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          image: imageUrl != null
              ? DecorationImage(
                  image: CachedNetworkImageProvider(imageUrl),
                  fit: BoxFit.cover,
                )
              : null,
        ),
      );

  Widget _buildSeparator(bool isVertical) => Container(
        height: isVertical ? double.infinity : 4,
        width: isVertical ? 4 : double.infinity,
        color: Colors.transparent,
      );
}
