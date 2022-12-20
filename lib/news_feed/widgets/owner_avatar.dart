part of screens.news_feed;

class _OwnerAvatar extends StatelessWidget {
  const _OwnerAvatar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.brown.shade800,
      child: const Text('AH'),
      radius: 18,
    );
  }
}
