part of "../../presentation.dart";

class OutfitCard extends StatelessWidget {
  const OutfitCard({super.key, required this.outfit});

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
