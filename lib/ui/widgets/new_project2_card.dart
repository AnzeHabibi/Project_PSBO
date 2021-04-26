part of 'widget.dart';

class NewProject2Card extends StatelessWidget {
  final NewProject newProject;

  NewProject2Card(this.newProject);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 224,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Color(0xffFBFCFD),
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(spreadRadius: 3, blurRadius: 15, color: Colors.black12)
          ]),
      child: Column(
        children: [
          Container(
            height: 140,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(18),
                    topRight: Radius.circular(18)),
                image: DecorationImage(
                    image: NetworkImage(newProject.picturePath),
                    fit: BoxFit.cover)),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
            width: double.infinity,
            child: Text(
              newProject.name,
              style: blueFontStyle2,
              maxLines: 2,
              overflow: TextOverflow.clip,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
            child: Row(
              children: [
                Text(newProject.start,
                    style: blueFontStyle3.copyWith(
                      color: Color(0xff1DAD2B),
                    )),
                SizedBox(width: 2),
                Text(
                  newProject.date,
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
