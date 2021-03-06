part of 'widget.dart';

class MyProjectCard extends StatelessWidget {
  final MyProject myProject;

  MyProjectCard(this.myProject);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 156,
      width: 200,
      decoration: BoxDecoration(
        color: Color(0xffFBFCFD),
        border: Border.all(color: Color(0xffE6EAF2)),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 0, 0),
            child: Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  image: DecorationImage(
                      image: NetworkImage(
                        myProject.photoCreator,
                      ),
                      fit: BoxFit.cover)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: Text(
              myProject.name,
              style: blueFontStyle2.copyWith(fontSize: 16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
            child: Row(
              children: [
                Text(myProject.start,
                    style: blueFontStyle3.copyWith(color: Color(0xffD43F51))),
                SizedBox(width: 2),
                Text(
                  myProject.date,
                  style: blueFontStyle3.copyWith(color: greyColor),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
