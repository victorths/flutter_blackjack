import '../../commons.dart';

enum CustomFilledButtomSize {
  small,
  large,
}

class CustomFilledButtom extends StatelessWidget {
  const CustomFilledButtom({
    super.key,
    required this.text,
    this.onPressed,
    this.expanded = true,
    this.size = CustomFilledButtomSize.small,
  });

  final CustomFilledButtomSize size;
  final bool expanded;
  final String text;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: expanded ? double.infinity : null,
      child: FilledButton(
        style: FilledButton.styleFrom(
          padding: const EdgeInsets.all(20),
          side: const BorderSide(
            color: Colors.white,
            width: 2,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: Colors.black,
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: _getTextStyle,
        ),
      ),
    );
  }

  TextStyle? get _getTextStyle {
    switch (size) {
      case CustomFilledButtomSize.small:
        return const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
        );
      case CustomFilledButtomSize.large:
        return const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
        );
    }
  }
}
