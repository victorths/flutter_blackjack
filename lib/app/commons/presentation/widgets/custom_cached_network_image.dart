import '../../commons.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  const CustomCachedNetworkImage({
    super.key,
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: image,
      alignment: Alignment.center,
      placeholder: (context, url) => Image.asset(
        Assets.back,
      ),
      errorWidget: (context, url, error) => const Placeholder(),
    );
  }
}
