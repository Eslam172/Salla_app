import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salla_app/screens/register/register_screen.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../shared/components/components.dart';
import '../shared/styles/colors.dart';

class BoardingModel{
  String image;
  String title;
  String body;

  BoardingModel({required this.image,required this.title,required this.body});
}

class OnBoardScreen extends StatefulWidget {
   const OnBoardScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  var boardController = PageController();

  bool isLast = false;

  List<BoardingModel> board =[
    BoardingModel(
        image: 'assets/images/open.png',
        title: 'We are open all over the day',
        body: 'You can come and buy anything at anytime we are at your service.'
    ),
    BoardingModel(
        image: 'assets/images/buy.png',
        title: 'You can buy hot products',
        body: 'We offer hot products you can see our products in our application.'
    ),
    BoardingModel(
        image: 'assets/images/search.png',
        title: 'You can search in products',
        body: 'You can easily search in our products and choose your product.'
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: (){
                navigateTo(context, const RegisterScreen());
              },
              child: Text('Skip',style: TextStyle(
                fontFamily: GoogleFonts.aBeeZee().fontFamily
              ),)
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              onPageChanged: (int index){
                if(index ==board.length-1){
                  setState((){
                    isLast = true;
                  });
                }else {
                  setState((){
                    isLast = false;
                  });
                }
              },
              controller: boardController,
                itemBuilder: (context,index) => boardItem(board[index]),
              itemCount: board.length,
              physics: const BouncingScrollPhysics(),
            ),
          ),
          SmoothPageIndicator(
            effect:  const ExpandingDotsEffect(
                spacing: 5,
                expansionFactor: 4,
                dotColor: secondColor,
                dotWidth: 8,
                dotHeight: 8,
              activeDotColor: Colors.white
            ),
              controller: boardController,
              count: board.length,
          ),
          const SizedBox(height: 20,),
          FloatingActionButton(
              onPressed: (){
                if(isLast == true){
                  navigateTo(context, const RegisterScreen());
                }else{
                  boardController.nextPage(
                      duration: const Duration(milliseconds: 750),
                      curve: Curves.easeOutSine
                  );
                }
              },
            child: const CircleAvatar(
              backgroundColor: Colors.white,
              radius: 20,
              child: Icon(Icons.arrow_forward_ios,
                color: secondColor,
              ),
            ),
          ),
          const SizedBox(height: 30,)
        ],
      ),
    );
  }

  Widget boardItem(BoardingModel model) => Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children:   [
      Image(image: AssetImage(model.image)),
      const SizedBox(height: 15,),
      Text(model.title,style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontFamily: GoogleFonts.alata().fontFamily
      ),),
      const SizedBox(height: 15,),
      Text(model.body,textAlign: TextAlign.center,style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: Colors.grey[300],
          fontFamily: GoogleFonts.alata().fontFamily
      ),)
    ],
  );
}
