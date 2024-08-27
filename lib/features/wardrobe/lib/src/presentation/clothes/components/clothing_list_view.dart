part of "../../presentation.dart";

class ClothingListView extends StatelessWidget {
  const ClothingListView({super.key, required this.clothes});
  final List<Clothing> clothes;

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 200,
        child: BlocBuilder<ClothingCubit, ClothingState>(
            builder: (BuildContext context, ClothingState state) =>
                switch (state) {
                  ClothingLoading() =>
                    const Center(child: CircularProgressIndicator.adaptive()),
                  ClothingError(:String message) => Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.red),
                      ),
                      alignment: Alignment.center,
                      child: Text(message, style: context.appTheme.body),
                    ),
                  ClothingInitial() => const SizedBox(),
                  ClothingLoaded(:List<Clothing> clothes) => clothes.isEmpty
                      ? Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.grey.shade300),
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
