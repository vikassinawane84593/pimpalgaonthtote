import 'package:flutter/material.dart';
import 'package:pimpalgaonthote/model/officialmodel.dart';

class OfficialCard extends StatelessWidget {
  final OfficialModel officialModel;
  //final String imageUrl;
  //final String name;
  //final String post;
  //final String department;
  final VoidCallback onCall;

  const OfficialCard({
    super.key,
    //required this.imageUrl,
    //required this.name,
    //required this.post,
    //required this.department,
    required this.onCall,
    required this.officialModel
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            blurRadius: 20,
            color: Colors.black12,
            offset: Offset.zero,
            spreadRadius: 3
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 38,
            backgroundImage: NetworkImage(officialModel.imageUrl),
          ),

          const SizedBox(width: 16),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  officialModel.name,
                 // name,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  officialModel.post,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  officialModel.department,
                  //department,
                  style: TextStyle(
                    color: Colors.grey.shade700,
                  ),
                ),
              ],
            ),
          ),

          Container(
            height: 70,
            width: 1,
            color: Colors.grey.shade300,
          ),

          const SizedBox(width: 16),

          InkWell(
            onTap: onCall,
            borderRadius: BorderRadius.circular(50),
            child: Container(
              padding: const EdgeInsets.all(14),
              decoration: const BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.call,
                color: Colors.white,
                size: 28,
              ),
            ),
          ),
        ],
      ),
    );
  }
}