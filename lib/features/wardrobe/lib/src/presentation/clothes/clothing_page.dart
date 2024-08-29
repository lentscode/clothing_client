part of "../presentation.dart";

/// Page that shows details of a piece of clothing.
class ClothingPage extends StatelessWidget {
  /// Returns an instance of [ClothingPage].
  const ClothingPage({super.key, required this.clothing});

  /// The clothing to show.
  final Clothing clothing;

  @override
  Widget build(BuildContext context) => PageLayout(
        appBar: AppBar(
          leading: IconButton(
            onPressed: context.pop,
            iconSize: 36,
            style: const ButtonStyle(
              splashFactory: NoSplash.splashFactory,
            ),
            icon: const Icon(
              Icons.chevron_left_rounded,
            ),
          ),
          actions: <Widget>[
            IconButton(
              onPressed: () {},
              iconSize: 28,
              style: const ButtonStyle(
                splashFactory: NoSplash.splashFactory,
              ),
              icon: const Icon(
                Icons.edit_outlined,
              ),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Row(),
                const SizedBox(height: 32),
                Hero(
                  tag: clothing.oid,
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.grey.shade300,
                        image: clothing.imageUrl != null
                            ? DecorationImage(
                                image: NetworkImage(clothing.imageUrl!),
                                fit: BoxFit.cover,
                              )
                            : null,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  clothing.name,
                  style: context.appTheme.title,
                ),
                const SizedBox(height: 4),
                Text.rich(
                  TextSpan(
                    children: <InlineSpan>[
                      TextSpan(text: "Colore: ", style: context.appTheme.body),
                      TextSpan(
                        text: clothing.color,
                        style: context.appTheme.body
                            .copyWith(fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 4),
                Builder(
                  builder: (BuildContext context) => clothing.brand == null
                      ? const SizedBox()
                      : Text.rich(
                          TextSpan(
                            children: <InlineSpan>[
                              TextSpan(
                                  text: "Brand: ",
                                  style: context.appTheme.body),
                              TextSpan(
                                text: clothing.brand,
                                style: context.appTheme.body
                                    .copyWith(fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                        ),
                ),
              ],
            ),
          ),
        ),
      );
}
