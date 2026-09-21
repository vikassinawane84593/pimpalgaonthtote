import 'package:flutter/material.dart';

class ContactWidget extends StatelessWidget {
  final String name;
  final String number;
  final String tag;

  const ContactWidget({
    super.key,
    required this.name,
    required this.number,
    required this.tag
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 6,
      ),
      child: Card(
        elevation: 3,
        shadowColor: Colors.black26,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),

          // Profile
          leading: CircleAvatar(
            radius: 27,
            backgroundColor: Colors.orange.shade100,
            child: Icon(
              Icons.person,
              color: Colors.orange.shade800,
              size: 30,
            ),
          ),

          // Name + Number + Tag
          title: Text(
            name,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          subtitle: Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  number,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade700,
                    fontWeight: FontWeight.bold
                  ),
                ),

                const SizedBox(height: 6),

                // Tag
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.green.shade50,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.green.shade200,
                    ),
                  ),
                  child: Text(
                    tag,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.green.shade800,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Call Button
          trailing: Material(
            color: Colors.green.shade50,
            shape: const CircleBorder(),
            child: InkWell(
              customBorder: const CircleBorder(),
              onTap: () {
                // Call function
              },
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Icon(
                  Icons.call,
                  color: Colors.green.shade700,
                  size: 24,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}