part of '../notes_page.dart';

class _NoteCard extends StatefulWidget {
  final NoteRowViewModel noteRowViewModel;
  final Function() onDeleteIconTapped;
  final Function(bool) onFavoriteIconTapped;

  const _NoteCard({
    required this.noteRowViewModel,
    required this.onDeleteIconTapped,
    required this.onFavoriteIconTapped,
  });

  static const _cardHeight = 95.0;
  static const _cardWidth = double.infinity;

  @override
  State<_NoteCard> createState() => _NoteCardState();
}

class _NoteCardState extends State<_NoteCard> {
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _NoteCard._cardHeight,
      width: _NoteCard._cardWidth,
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.defaultHorizontalPadding,
      ),
      decoration: BoxDecoration(
        color: AppContextColors.noteCardBackground,
        borderRadius: BorderRadius.circular(
          AppDimensions.defaultHorizontalPadding,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.noteRowViewModel.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.title.large.copyWith(
                    color: AppContextColors.noteCardText,
                  ),
                ),
                Text(
                  widget.noteRowViewModel.content,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.body.medium.copyWith(
                    color: AppContextColors.noteCardText,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                _isFavorite = !_isFavorite;
              });
              widget.onFavoriteIconTapped.call(_isFavorite);
            },
            icon: Icon(
              _isFavorite ? Icons.favorite : Icons.favorite_border_outlined,
              color: AppContextColors.noteIcon,
            ),
          ),
          IconButton(
            onPressed: widget.onDeleteIconTapped,
            icon: const Icon(
              Icons.delete,
              color: AppContextColors.noteIcon,
            ),
          ),
        ],
      ),
    );
  }
}
