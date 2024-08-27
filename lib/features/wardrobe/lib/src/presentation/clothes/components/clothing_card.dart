part of "../../presentation.dart";

/// A card that displays a clothing item.
class ClothingCard extends StatelessWidget {
  /// Creates a [ClothingCard].
  const ClothingCard({super.key, required this.clothing});

  /// The clothing item to display.
  final Clothing clothing;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => context.push("/clothing", extra: clothing),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Hero(
                tag: clothing.oid,
                child: Container(
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.grey.shade300,
                    image: clothing.imageUrl != null
                        ? DecorationImage(
                            image:
                                CachedNetworkImageProvider(clothing.imageUrl!),
                            fit: BoxFit.cover,
                          )
                        : null,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Text(
                clothing.name,
                style: context.appTheme.cardTitle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
              ),
            ),
          ],
        ),
      );
}
