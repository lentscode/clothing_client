import "dart:math";

import "package:flutter/material.dart";
import "package:shared/shared.dart";

import "../../presentation.dart";

class OutfitsSliverLits extends StatelessWidget {
  const OutfitsSliverLits({super.key, required this.outfits});

  final List<Outfit> outfits;

  @override
  Widget build(BuildContext context) => SliverList.separated(
        itemBuilder: (context, index) => OutfitCard(outfit: outfits[index]),
        separatorBuilder: (BuildContext context, int index) =>
            const SizedBox(height: 16),
        itemCount: min(outfits.length, 6),
      );
}
