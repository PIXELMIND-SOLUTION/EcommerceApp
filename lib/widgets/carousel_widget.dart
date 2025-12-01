// import 'dart:convert';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class CarouselWidget extends StatefulWidget {
//   const CarouselWidget({super.key});

//   @override
//   State<CarouselWidget> createState() => _CarouselWidgetState();
// }

// class _CarouselWidgetState extends State<CarouselWidget> {
//   List<String> bannerImages = [];
//   bool isLoading = true;
//   bool isError = false;

//   final String baseUrl = "http://31.97.206.144:3081/";

//   @override
//   void initState() {
//     super.initState();
//     fetchBanners();
//   }

//   Future<void> fetchBanners() async {
//     try {
//       final response = await http.get(
//         Uri.parse("http://31.97.206.144:3081/api/admin/banners"),
//       );

//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body);

//         if (data["success"] == true) {
//           final banners = data["banners"] as List;

//           setState(() {
//             bannerImages = banners
//                 .map((b) => baseUrl + b["image"])
//                 .toList()
//                 .cast<String>();
//             isLoading = false;
//           });
//         } else {
//           setState(() {
//             isError = true;
//             isLoading = false;
//           });
//         }
//       } else {
//         setState(() {
//           isError = true;
//           isLoading = false;
//         });
//       }
//     } catch (e) {
//       print("Error fetching banners: $e");
//       setState(() {
//         isError = true;
//         isLoading = false;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Center(
//         child: isLoading
//             ? const CircularProgressIndicator()
//             : isError
//                 ? const Text(
//                     "Failed to load banners",
//                     style: TextStyle(color: Colors.red),
//                   )
//                 : bannerImages.isEmpty
//                     ? const Text("No banners available")
//                     : CarouselSlider(
//                         options: CarouselOptions(
//                           height: 200,
//                           autoPlay: true,
//                           enlargeCenterPage: true,
//                           viewportFraction: 0.9,
//                           autoPlayInterval: const Duration(seconds: 3),
//                         ),
//                         items: bannerImages.map((url) {
//                           return ClipRRect(
//                             borderRadius: BorderRadius.circular(12),
//                             child: Image.network(
//                               url,
//                               fit: BoxFit.cover,
//                               width: double.infinity,
//                               errorBuilder: (context, error, stackTrace) =>
//                                   Container(
//                                 color: Colors.grey.shade300,
//                                 child: const Center(
//                                   child: Icon(Icons.broken_image, size: 40),
//                                 ),
//                               ),
//                             ),
//                           );
//                         }).toList(),
//                       ),
//       ),
//     );
//   }
// }














import 'dart:convert';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CarouselWidget extends StatefulWidget {
  const CarouselWidget({super.key});

  @override
  State<CarouselWidget> createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<CarouselWidget> {
  List<String> bannerImages = [];
  bool isLoading = true;
  bool isError = false;

  final String baseUrl = "http://31.97.206.144:3081/";

  @override
  void initState() {
    super.initState();
    fetchBanners();
  }

  Future<void> fetchBanners() async {
    try {
      final response = await http.get(
        Uri.parse("http://31.97.206.144:3081/api/admin/banners"),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        if (data["success"] == true) {
          final banners = data["banners"] as List;

          setState(() {
            bannerImages = banners
                .map((b) => baseUrl + b["image"])
                .toList();
            isLoading = false;
          });
        } else {
          setState(() {
            isError = true;
            isLoading = false;
          });
        }
      } else {
        setState(() {
          isError = true;
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        isError = true;
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const SizedBox(
        height: 180,
        child: Center(child: CircularProgressIndicator()),
      );
    }

    if (isError || bannerImages.isEmpty) {
      return const SizedBox(
        height: 180,
        child: Center(child: Text("No banners available")),
      );
    }

    return CarouselSlider(
      options: CarouselOptions(
        height: 180,
        autoPlay: true,
        enlargeCenterPage: true,
        viewportFraction: 0.85,
      ),
      items: bannerImages.map((url) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.network(
            url,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
        );
      }).toList(),
    );
  }
}
