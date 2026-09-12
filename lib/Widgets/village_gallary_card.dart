import 'package:flutter/material.dart';
import 'package:pimpalgaonthote/model/gallerymodel.dart';

class Villagegallarycard extends StatelessWidget {
  //final String imageUrl;
  //final String title;
  final VoidCallback? onTap;
  final ImageModel imageModel;

  const Villagegallarycard({
    super.key,
    //required this.imageUrl,
    //required this.title,
    required this.onTap,
    required this.imageModel,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(12),
                ),
                child: Image.network(
                  imageModel.imageUrl,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  loadingBuilder: (conext,child,loading){
                    if(loading==null){
                      return child;
                    }
                    return Center(
                        child: CircularProgressIndicator()
                    );
                  },
                  errorBuilder: (a,b,v){
                    return Center(
                        child: CircularProgressIndicator()
                    );
                  },
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                imageModel.caption,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}