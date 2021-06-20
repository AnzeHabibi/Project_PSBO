part of 'pages.dart';

class UploadPost extends StatefulWidget {
  @override
  _UploadPost createState() => _UploadPost();
}

class _UploadPost extends CreateProjectController {
  List<File> _image = [];
  DateTimeRange dateRange;
  String imageNameFile = '';
  bool keyboardOpen = false;

  @override
  void initState() {
    super.initState();
    KeyboardVisibilityNotification().addNewListener(
      onChange: (bool visible) {
        setState(() => keyboardOpen = visible);
      },
    );
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () async {
                        FilePickerResult result =
                            await FilePicker.platform.pickFiles(
                          allowMultiple: true,
                          type: FileType.custom,
                          allowedExtensions: ['jpg', 'png'],
                        );

                        if (result != null) {
                          List<File> files =
                              result.paths.map((path) => File(path)).toList();
                          setState(() {
                            _image.addAll(files);
                          });
                        } else {
                          // User canceled the picker
                        }
                        Navigator.of(context).pop();
                      }),
                ],
              ),
            ),
          );
        });
  }

  String setDate() {
    if (dateRange == null) {
      return 'Input start-deadline';
    } else {
      return DateFormat('dd-MMM-yyyy').format(dateRange.start) +
          " - " +
          DateFormat('dd-MMM-yyyy').format(dateRange.end);
    }
  }

  Future pickDateRange(BuildContext context) async {
    final initialDateRange = DateTimeRange(
      start: DateTime.now(),
      end: DateTime.now().add(Duration(hours: 24 * 3)),
    );
    final newDateRange = await showDateRangePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
      initialDateRange: dateRange ?? initialDateRange,
    );

    if (newDateRange == null) return;

    setState(() => dateRange = newDateRange);
  }

  @override
  Widget build(BuildContext context) {
    return isLoading()
        ? Center(
            child: CircularProgressIndicator(),
          )
        : MaterialApp(
            home: Scaffold(
                backgroundColor: Color(0xFFFBFBFB),
                body: SafeArea(
                    child: ListView(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 120),
                  children: [_mainContent()],
                )),
                floatingActionButton:
                    keyboardOpen ? SizedBox() : _buttonBottom(),
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.centerDocked),
          );
  }

  Widget _mainContent() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _backButton(),
          _titleProject(),
          _caption(),
          _startDeadline(),
          _addPhoto(),
          SizedBox(height: 16),
          Container(
              height: 146,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: _image
                        ?.map<Widget>((e) => GestureDetector(
                            onTap: () {}, child: photoWidgetFromStorage(e)))
                        ?.toList() ??
                    [],
              )),
        ],
      ),
    );
  }

  Widget _backButton() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      child: GestureDetector(
        onTap: () {
          Get.to(MainPage());
        },
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 16),
          child: Row(
            children: [
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage("assets/btn_back_2.png"),
                )),
              ),
              SizedBox(width: 8),
              Text("Back", style: blueFontStyle4),
            ],
          ),
        ),
      ),
    );
  }

  TextEditingController titleProject = new TextEditingController();
  Widget _titleProject() {
    return Container(
        margin: EdgeInsets.fromLTRB(0, 16, 0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 0, 12),
                    child: Text("Title Project", style: blueFontStyle2),
                  ),
                  Container(
                    height: 45.0,
                    child: TextField(
                      controller: titleProject,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        errorText: _validateEmail
                            ? 'Inputan tidak\'bisa kosong'
                            : null,
                        hintText: "input title project",
                        hintStyle: TextStyle(
                          color: Color(0xFFD2D9DF),
                          fontSize: 12,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xffD2D9DF), width: 1.5),
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(30.0),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xffD2D9DF), width: 1.5),
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(30.0),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ));
  }

  TextEditingController caption = new TextEditingController();
  Widget _caption() {
    return Container(
        margin: EdgeInsets.fromLTRB(0, 16, 0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 0, 12),
                    child: Text("Description", style: blueFontStyle2),
                  ),
                  Container(
                    child: TextField(
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      controller: caption,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        errorText: _validateEmail
                            ? 'Inputan tidak\'bisa kosong'
                            : null,
                        hintText: "Input Description",
                        hintStyle: TextStyle(
                          color: Color(0xFFD2D9DF),
                          fontSize: 12,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xffD2D9DF), width: 1.5),
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(30.0),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xffD2D9DF), width: 1.5),
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(30.0),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ));
  }

  Widget _startDeadline() {
    return Container(
        margin: EdgeInsets.fromLTRB(0, 16, 0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 0, 12),
                    child: Text("Start - Deadline", style: blueFontStyle2),
                  ),
                  Container(
                    height: 45.0,
                    child: Container(
                        width: 400,
                        height: 45.0,
                        child: TextButton(
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(2, 0, 0, 0),
                                  child:
                                      Text(setDate(), style: blackFontStyle3),
                                ),
                              ),
                              GestureDetector(onTap: () {
                                pickDateRange(this.context);
                              })
                            ],
                          ),
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: BorderSide(
                                    color: Color(0xffD2D9DF), width: 1.5)),
                          )),
                        )),
                  )
                ],
              ),
            ),
          ],
        ));
  }

  Widget _addPhoto() {
    return Container(
        margin: EdgeInsets.fromLTRB(0, 16, 0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 0, 12),
                    child: Text("Photo", style: blueFontStyle2),
                  ),
                  Stack(
                    children: <Widget>[
                      Container(
                          width: 400,
                          height: 45.0,
                          child: TextButton(
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(2, 0, 0, 0),
                                child: Text(
                                    imageNameFile == ''
                                        ? "Upload Photo Here"
                                        : imageNameFile,
                                    style: blackFontStyle3),
                              ),
                            ),
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  side: BorderSide(
                                      color: Color(0xffD2D9DF), width: 1.5)),
                            )),
                          )),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                            width: 100,
                            height: 45.0,
                            child: RaisedButton(
                              textColor: Colors.white,
                              color: mainColor,
                              child: Stack(
                                children: <Widget>[
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text("Upload",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16)),
                                  ),
                                  GestureDetector(onTap: () {
                                    _showPicker(this.context);
                                  })
                                ],
                              ),
                              shape: new RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(18),
                                      topRight: Radius.circular(18))),
                            )),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ));
  }

  Widget _buttonBottom() {
    return Container(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
          child: RaisedButton(
            color: mainColor,
            onPressed: () {
              setState(() {
                if (!caption.text.isEmpty && !titleProject.text.isEmpty) {
                  //   isLoadingTrue();
                  //   createProject(
                  //       titleProject.text,
                  //       caption.text,
                  //       DateFormat('yyyy-MM-dd')
                  //           .format(dateRange.start)
                  //           .toString(),
                  //       DateFormat('yyyy-MM-dd').format(dateRange.end).toString(),
                  //       _image);
                }
              });
            },
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(30))),
            child: Container(
              width: 400,
              height: 45,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
                child: Text(
                  "Publish Project",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget photoWidgetFromStorage(File file) {
    return Column(
      children: [
        Container(
          height: 100,
          width: 110,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            image: DecorationImage(
                image: FileImage(File(file.path)), fit: BoxFit.cover),
          ),
        ),
        SizedBox(width: 12),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          child: GestureDetector(
            onTap: () {
              setState(() {
                _image.remove(file);
              });
            },
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 4),
              child: Row(
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage("assets/btn_delete_x.png"),
                    )),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
