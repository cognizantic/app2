import '/barrel1.dart';

class FileExplorer extends StatefulWidget {
  const FileExplorer({super.key});
  @override
  _FileExplorerState createState() => _FileExplorerState();
}

class _FileExplorerState extends State<FileExplorer> {
  late List<String> projectFiles = [];
  final GlobalKey newProject = GlobalKey();
  @override
  void initState() {
    super.initState();
    projectFiles = [];
  }

  TextEditingController projectDescription = TextEditingController();
  TextEditingController projectName = TextEditingController();
  TextEditingController inputPath = TextEditingController();
  TextEditingController outputPath = TextEditingController();
  TextEditingController objects = TextEditingController();
  TextEditingController mood = TextEditingController();
  TextEditingController scene = TextEditingController();
  TextEditingController lighting = TextEditingController();
  UndoHistoryController projectDescriptionHistory = UndoHistoryController();
  @override
  void dispose() {
    super.dispose();
    projectName.dispose();
    inputPath.dispose();
    outputPath.dispose();
    objects.dispose();
    mood.dispose();
    scene.dispose();
    lighting.dispose();
    projectDescription.dispose();
    projectDescriptionHistory.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Files")),
      drawer: const AppBar1(
        text2disp: 'Files',
      ),
      body: Container(
        child: Row(
          children: [
            //left side
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Column(
                children: [
                  Flexible(
                    flex: 1,
                    fit: FlexFit.loose,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: ElevatedButton.icon(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          if (context.mounted) {
                            showModalBottomSheet(
                              useSafeArea: true,
                              isScrollControlled: true,
                              isDismissible: false,
                              enableDrag: false,
                              context: context,
                              builder: (context) {
                                return _newProject(
                                    projectName,
                                    inputPath,
                                    outputPath,
                                    objects,
                                    mood,
                                    scene,
                                    lighting,
                                    projectDescription,
                                    projectDescriptionHistory,
                                    newProject);
                              },
                            );
                          }
                        },
                        label: Text("New Project"),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 3,
                    fit: FlexFit.loose,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue, width: 2),
                      ),
                      child: _projectList(projectFiles),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.yellow,
              thickness: 5,
            ),
            //main content
            Flexible(
              flex: 5,
              fit: FlexFit.tight,
              child: Column(
                children: [
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.red, width: 2),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.yellow,
              thickness: 5,
            ),
            //right side
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Column(
                children: [
                  Flexible(
                    flex: 2,
                    fit: FlexFit.tight,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.green, width: 2),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _projectList(List<String> projectFiles) {
    return Column(
      children: [
        Text("projects"),
        Flexible(
          fit: FlexFit.tight,
          child: ListView.builder(
            itemCount: projectFiles.length,
            itemBuilder: (context, int index) {
              return LayoutBuilder(
                builder: (context, Constraints) {
                  double width1 = Constraints.maxWidth;
                  return Wrap(
                    children: [
                      Container(
                        padding: EdgeInsets.all(2),
                        child: TextButton.icon(
                          onPressed: () {},
                          label: Text(
                            projectFiles[index],
                          ),
                          icon: Icon(Icons.folder),
                          style: ButtonStyle(
                            minimumSize: WidgetStateProperty.all(
                              Size(width1, 40),
                            ),
                            shape:
                                WidgetStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _newProject(
      TextEditingController projectName,
      TextEditingController inputPath,
      TextEditingController outputPath,
      TextEditingController objects,
      TextEditingController mood,
      TextEditingController scene,
      TextEditingController lighting,
      TextEditingController projectDesciption,
      UndoHistoryController projectDescriptionHistory,
      GlobalKey newProject) {
    return Form(
      key: newProject,
      child: Container(
        padding: EdgeInsets.all(30),
        //width: 300,
        child: Column(
          spacing: 10,
          children: [
            //project name
            Container(
              child: TextFormField(
                textAlign: TextAlign.center,
                controller: projectName,
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.abc),
                  labelText: 'Project name',
                  labelStyle: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                  floatingLabelStyle: TextStyle(
                    fontSize: 20,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
              ),
            ),
            //descrpition
            Container(
              child: TextField(
                controller: projectDesciption,
                undoController: projectDescriptionHistory,
                decoration: InputDecoration(
                  labelText: "Description",
                  labelStyle:
                      TextStyle(color: Theme.of(context).colorScheme.onPrimary),
                  floatingLabelStyle: TextStyle(
                    fontSize: 20,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                  suffixIcon: Icon(Icons.abc),
                ),
              ),
            ),
            //input folder path

            Container(
              child: TextFormField(
                textAlign: TextAlign.center,
                controller: inputPath,
                decoration: InputDecoration(
                  labelText: 'input folder',
                  labelStyle: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                  floatingLabelStyle: TextStyle(
                    fontSize: 20,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () async {
                      String? directoryPath =
                          await FilePicker.platform.getDirectoryPath();
                      if (directoryPath != null) {
                        setState(() {
                          inputPath.text = directoryPath;
                        });
                      }
                    },
                    icon: Icon(
                      Icons.folder,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                ),
              ),
            ),
            //output folder path

            Container(
              child: TextFormField(
                textAlign: TextAlign.center,
                controller: outputPath,
                decoration: InputDecoration(
                  labelText: 'output folder',
                  labelStyle: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                  floatingLabelStyle: TextStyle(
                    fontSize: 20,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () async {
                      String? directoryPath =
                          await FilePicker.platform.getDirectoryPath();
                      if (directoryPath != null) {
                        setState(() {
                          outputPath.text = directoryPath;
                        });
                      }
                    },
                    icon: Icon(
                      Icons.folder,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                ),
              ),
            ),
            //row idea
            Container(
              child: Row(
                spacing: 20,
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      spacing: 20,
                      children: [
                        Container(
                          child: Text('Objects:'),
                        ),
                        Container(),
                        //secne
                        Container(
                          child: Text(
                            'Scene Type:',
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      spacing: 20,
                      children: [
                        Container(
                          child: Text('Moods:'),
                        ),
                        Container(),
                        Container(),
                        //lighting
                        Container(
                          child: Text('Lighting Type:'),
                        ),
                        Container(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            //submit button
            Container(
              padding: EdgeInsets.all(5),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    _handleNewProject(projectName, inputPath, outputPath);
                  });
                  Navigator.of(context).pop();
                },
                child: Text("submit"),
              ),
            ),
            //cancel button
            Container(
              padding: EdgeInsets.all(5),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("cancel"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleNewProject(TextEditingController projectName,
      TextEditingController inputPath, TextEditingController outputPath) {}
  //final
}
