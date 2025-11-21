import 'package:flutter/material.dart';

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'Reviews',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(onPressed: (){
          Navigator.of(context).pop();
        }, icon: Icon(Icons.arrow_back_ios)),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // PRODUCT DETAILS
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      "https://images.unsplash.com/photo-1521572163474-6864f9cf17ab",
                      height: 60,
                      width: 60,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Edition Valencia",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Linen Shirt",
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  const Text(
                    "\$24.99",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),

              const SizedBox(height: 25),

              // RATING SUMMARY
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "4.9",
                    style: TextStyle(
                      fontSize: 50,
                      height: 1,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 15),
                  Column(
                    children: [
                      Row(
                        children: List.generate(
                          5,
                          (i) => const Icon(Icons.star, color: Colors.amber, size: 22),
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        "224 ratings",
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 20),

              _ratingLine("5", 0.67),
              _ratingLine("4", 0.14),
              _ratingLine("3", 0.05),
              _ratingLine("2", 0.03),
              _ratingLine("1", 0.01),

              const SizedBox(height: 20),

              // REVIEW HEADER
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "13 Reviews",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    "WRITE A REVIEW",
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.blue,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // REVIEWS
              _reviewCard(
                name: "Carly West",
                date: "Oct 20, 2020",
                rating: 4,
                review: "I am very happy to refer to anyone who enjoys online shopping.",
                image:
                    "https://randomuser.me/api/portraits/women/44.jpg",
              ),

              _reviewCard(
                name: "Kate Carter",
                date: "Oct 28, 2020",
                rating: 4,
                review:
                    "I'm very happy with order, it was delivered on and very good quality.",
                image:
                    "https://randomuser.me/api/portraits/women/68.jpg",
              ),

              _reviewCard(
                name: "Kelly Jones",
                date: "Nov 12, 2020",
                rating: 5,
                review: "Absolutely fantastic quality. Loved it!",
                image:
                    "https://randomuser.me/api/portraits/women/22.jpg",
              ),
            ],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {},
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  // Rating Lines
  Widget _ratingLine(String stars, double percent) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        children: [
          Text(stars),
          const SizedBox(width: 6),
          Expanded(
            child: LinearProgressIndicator(
              value: percent,
              backgroundColor: Colors.grey.shade300,
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.amber),
              minHeight: 6,
            ),
          ),
          const SizedBox(width: 10),
          Text("${(percent * 100).round()}%"),
        ],
      ),
    );
  }

  // Review card widget
  Widget _reviewCard({
    required String name,
    required String date,
    required int rating,
    required String review,
    required String image,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 20,
            backgroundImage: NetworkImage(image),
          ),
          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      date,
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),

                const SizedBox(height: 6),

                Row(
                  children: List.generate(
                    5,
                    (i) => Icon(
                      Icons.star,
                      size: 18,
                      color: i < rating ? Colors.amber : Colors.grey.shade300,
                    ),
                  ),
                ),

                const SizedBox(height: 6),

                Text(
                  review,
                  style: const TextStyle(fontSize: 13, color: Colors.black87),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
