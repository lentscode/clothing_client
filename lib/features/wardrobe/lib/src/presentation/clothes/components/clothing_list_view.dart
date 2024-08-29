part of "../../presentation.dart";

/// Shows a horizontal view of [ClothingCard].
class ClothingListView extends StatelessWidget {
  /// Returns an instance of [ClothingListView].
  const ClothingListView({super.key});

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 200,
        child: BlocBuilder<ClothingCubit, ClothingState>(
            builder: (BuildContext context, ClothingState state) =>
                switch (state) {
                  ClothingLoading() =>
                    const Center(child: CircularProgressIndicator.adaptive()),
                  ClothingError(:Exception error) => Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.red, width: 2),
                      ),
                      alignment: Alignment.center,
                      child: Text(error.toString(), style: context.appTheme.body),
                    ),
                  ClothingInitial() => const SizedBox(),
                  ClothingLoaded(:List<Clothing> clothes) => clothes.isEmpty
                      ? Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.grey.shade300, width: 2),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            "Ancora nessun vestito registrato",
                            style: context.appTheme.body,
                          ),
                        )
                      : ListView.separated(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) =>
                              ClothingCard(clothing: clothes[index]),
                          separatorBuilder: (BuildContext context, int index) =>
                              const SizedBox(width: 12),
                          itemCount: min(clothes.length, 10),
                        ),
                }),
      );
}
