import 'package:final_iti/features/developer/presentation/views/developer_page.dart';
import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffEF6494),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          color: Colors.white,
        ),
        title: const Text(
          "Your Beauty",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return DeveloperPage();
                }));
              },
              icon: const Icon(
                Icons.developer_board,
                color: Colors.white,
              ))
        ],
      ),
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.network(
              "https://as1.ftcdn.net/v2/jpg/08/16/09/06/1000_F_816090676_rNsGQSB1jKSnWrNjMBQfTyXQ0a8LBf4z.jpg",
              fit: BoxFit.fill,
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "Our cosmetics application is your go_to destination for the finest beauty products at cpmpetitive prices.\n\nFeaturing a sleek and user_friendly design , the app allows you to browse a wide range of products , from makeup and skincare to fragrances and beauty tools \n\nJoin our community now and enjoy a unique and deligthful shopping experience for all your beauty needs . \n\nYou can see our developers app by click the icon at the right of this page . ",
              style: TextStyle(
                color: Colors.white,
                fontSize: 23,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
