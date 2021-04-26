part of 'widget.dart';

class PendingProject2Card extends StatelessWidget {
  final PendingProject pendingProject;

  PendingProject2Card(this.pendingProject);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 152,
      width: double.infinity,
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
                        pendingProject.photoCreator,
                      ),
                      fit: BoxFit.cover)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 32, 16, 0),
            child: Text(
              pendingProject.name,
              style: blueFontStyle2.copyWith(fontSize: 16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
            child: Row(
              children: [
                Text(pendingProject.start,
                    style: blueFontStyle3.copyWith(color: Color(0xffD43F51))),
                SizedBox(width: 2),
                Text(
                  pendingProject.date,
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
