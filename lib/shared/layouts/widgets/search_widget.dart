part of bootstrap.appbar;

class _SearchWidget extends StatelessWidget {
  const _SearchWidget({
    Key? key,
    this.onTap,
  }) : super(key: key);

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ButtonWidget(
      onTap: onTap,
      height: 40.0,
      color: AppTheme.ext(context).inputButtonColor,
      padding: ButtonWidget.buttonWidgetPadding.copyWith(
        left: 20.0,
        right: 20.0,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          20.0,
        ),
      ),
      child: Row(
        children: const [
          Expanded(
            child: Text("Search recipe"),
          ),
          FaIcon(
            FontAwesomeIcons.magnifyingGlass,
            size: 15.0,
          )
        ],
      ),
    );
  }
}
