part of 'widget.dart';

class ProfileCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 300,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top:50),
                child: Container(
                  height: 257,
                  color: Colors.white
                ),
              )
            ],
            
          ),
        )
      ],
    );
  }
}