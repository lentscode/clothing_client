part of "presentation.dart";

/// The wardrobe page.
///
/// This page displays the user's clothes and outfits.
class WardrobePage extends StatelessWidget {
  /// Creates a [WardrobePage].
  const WardrobePage({super.key, required this.clothingCubit});

  final ClothingCubit clothingCubit;

  @override
  Widget build(BuildContext context) => BlocProvider<ClothingCubit>(
        create: (BuildContext context) => clothingCubit,
        child: BlocListener<ClothingCubit, ClothingState>(
          listener: (BuildContext context, ClothingState state) =>
              switch (state) {
            ClothingError(:Exception error) => switch (error) {
                UnauthenticatedException() => context.push("/auth"),
                _ => null,
              },
            _ => null,
          },
          child: PageLayout(
            top: false,
            body: CustomScrollView(
              slivers: <Widget>[
                SliverToBoxAdapter(
                  child: CustomPaint(
                    painter: WardrobeBackground(context.appTheme.primary),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: MediaQuery.of(context).padding.top,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Il tuo armadio",
                                style: context.appTheme.title.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 16),
                              Text(
                                "I tuoi vestiti",
                                style: context.appTheme.body,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 12),
                        const ClothingListView(),
                        const SizedBox(height: 16),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            "I tuoi outfit",
                            style: context.appTheme.body,
                          ),
                        ),
                        const SizedBox(height: 12),
                      ],
                    ),
                  ),
                ),
                const SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  sliver: OutfitsSliverLits(
                    outfits: <Outfit>[],
                  ),
                )
              ],
            ),
          ),
        ),
      );
}
