part of "../../presentation.dart";

/// Shows a preview of an outfit.
class OutfitCard extends StatelessWidget {
  /// Returns an instance of [OutfitCard].
  const OutfitCard({super.key, required this.outfit});

  /// The outfit to show.
  final Outfit outfit;

  @override
  Widget build(BuildContext context) => Container(
    height: 200,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16),
      color: Colors.grey[200],
    ),
    clipBehavior: Clip.hardEdge,
    alignment: Alignment.center,
    child: ClothesImagesGrid(clothes: outfit.clothings),
  );
}
