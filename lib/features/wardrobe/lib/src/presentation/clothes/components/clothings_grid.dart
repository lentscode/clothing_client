part of "../../presentation.dart";

/// A grid that displays clothing items.
/// 
/// The grid will display [ClothingCard]s in a 2x2 layout.
class ClothingsGrid extends StatelessWidget {
  /// Creates a [ClothingsGrid].
  const ClothingsGrid({super.key, required this.clothings});

  /// The list of clothing items to display.
  final List<Clothing> clothings;

  @override
  Widget build(BuildContext context) => Expanded(
        child: GridView.builder(
          padding: const EdgeInsets.only(bottom: 32, left: 16, right: 16),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: .8,
          ),
          itemBuilder: (BuildContext context, int index) => ClothingCard(
            clothing: clothings[index],
          ),
          itemCount: clothings.length,
        ),
      );
}
