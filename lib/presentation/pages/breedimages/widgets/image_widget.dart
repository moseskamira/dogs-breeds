import 'package:cached_network_image/cached_network_image.dart';
import 'package:dogs/presentation/bloc/app_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImageWidget extends StatefulWidget {
  final String imageUrl;

  const ImageWidget({super.key, required this.imageUrl});

  @override
  State<ImageWidget> createState() => _ImageWidgetState();
}

class _ImageWidgetState extends State<ImageWidget> {
  @override
  Widget build(BuildContext context) {
    final providerWatch = context.watch<AppDataProvider>();
    final providerRead = context.read<AppDataProvider>();
    final favImages = providerWatch.favImages;
    bool isFavorited = favImages.contains(widget.imageUrl);

    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: CachedNetworkImage(
            imageUrl: widget.imageUrl,
            placeholder: (context, url) =>
                const Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => const Icon(Icons.error),
            fit: BoxFit.cover,
            height: 100,
            width: double.infinity,
          ),
        ),
        Positioned(
          top: 6,
          right: 6,
          child: GestureDetector(
            onTap: () {
              if (isFavorited) {
                providerRead.updateFavImages(widget.imageUrl, false);
              } else {
                providerRead.updateFavImages(widget.imageUrl, true);
              }
            },
            child: Icon(
              isFavorited ? Icons.favorite : Icons.favorite_border,
              color: isFavorited ? Colors.red : Colors.white,
              size: 28,
              shadows: [
                Shadow(
                  color: Colors.black.withOpacity(0.5),
                  blurRadius: 4,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
