part of 'widget.dart';

class MyProjectCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 152,
      width: 200,
      decoration: BoxDecoration(
        color: Color(0xffFBFCFD),
        border: Border.all(color: Color(0xffE6EAF2)),
        borderRadius: BorderRadius.circular(18),),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 0 ,0),
            child: Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                image: DecorationImage(
                  image: NetworkImage("https://i.stack.imgur.com/l60Hf.png",), fit:BoxFit.cover
                )
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16 , 0),
            child: Text("UX Project for Competition", style: blueFontStyle2.copyWith(fontSize:16),),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16 ,16),  
            child: Row(
              children: [
              Text("No", style: blueFontStyle3.copyWith(color: greyColor,)),
              SizedBox(width:2),
              Text("Deadline", style: blueFontStyle3.copyWith(color:Color(0xffD43F51)),)
            ],),
          )
        ],
      ),
    );
  }
}