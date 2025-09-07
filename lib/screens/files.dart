import 'package:flutter_webrtc/flutter_webrtc.dart';

import '/barrel1.dart';

class FileExplorer extends StatefulWidget {
  const FileExplorer({super.key});
  @override
  _FileExplorerState createState() => _FileExplorerState();
}

class _FileExplorerState extends State<FileExplorer> {
  late List<String> projectFiles = [];

  late List<String> tempProjectFiles = [];
  final GlobalKey newProject = GlobalKey();
  @override
  void initState() {
    super.initState();
    _loadProjects();
  }

  Future<void> _loadProjects() async {
    projectFiles = await getProjectList();
    setState(() {
      tempProjectFiles = projectFiles;
    });
  }

  TextEditingController projectDescription = TextEditingController();
  TextEditingController projectName = TextEditingController();
  TextEditingController inputPath = TextEditingController();
  TextEditingController outputPath = TextEditingController();
  TextEditingController objects = TextEditingController();
  TextEditingController mood = TextEditingController();
  TextEditingController scene = TextEditingController();
  TextEditingController lighting = TextEditingController();
  TextEditingController searchProject = TextEditingController();
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
                              showDragHandle: true,
                              useSafeArea: false,
                              isScrollControlled: true,
                              isDismissible: true,
                              enableDrag: true,
                              context: context,
                              builder: (context) {
                                return _newProject(
                                    projectFiles,
                                    projectName,
                                    inputPath,
                                    outputPath,
                                    projectDescription,
                                    projectDescriptionHistory,
                                    newProject);
                              },
                            );
                          }
                          setState(() {});
                        },
                        label: Text("New Project"),
                      ),
                    ),
                  ),
                  Divider(),
                  Flexible(
                    flex: 1,
                    fit: FlexFit.loose,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: TextField(
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.search),
                            prefixIconColor:
                                Theme.of(context).colorScheme.onPrimary,
                            labelText: "search",
                            labelStyle: TextStyle(
                                color:
                                    Theme.of(context).colorScheme.onPrimary)),
                        controller: searchProject,
                        onChanged: (value) {
                          setState(() {
                            tempProjectFiles = projectFiles
                                .where((file) => file
                                    .toLowerCase()
                                    .contains(value.toLowerCase()))
                                .toList();
                          });
                        },
                      ),
                    ),
                  ),
                  Divider(),
                  Flexible(
                    flex: 3,
                    fit: FlexFit.loose,
                    child: Container(
                      decoration: BoxDecoration(
                          //border: Border.all(color: Colors.blue, width: 2),
                          ),
                      child: _projectList(tempProjectFiles),
                    ),
                  ),
                  Divider(),
                ],
              ),
            ),
            VerticalDivider(),
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
                          //border: Border.all(color: Colors.red, width: 2),
                          ),
                    ),
                  ),
                ],
              ),
            ),
            VerticalDivider(),
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
                          //border: Border.all(color: Colors.green, width: 2),
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
        Flexible(
          fit: FlexFit.tight,
          child: ListView.builder(
            itemCount: projectFiles.length,
            itemBuilder: (context, int index) {
              return LayoutBuilder(
                // ignore: non_constant_identifier_names
                builder: (context, Constraints) {
                  double width1 = Constraints.maxWidth;
                  return Wrap(
                    children: [
                      Row(
                        children: [
                          Flexible(
                            flex: 6,
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 2),
                              child: TextButton.icon(
                                onPressed: () {
                                  print("hi");
                                },
                                icon: Icon(Icons.folder_open),
                                style: ButtonStyle(
                                  foregroundColor: WidgetStateProperty.all(
                                      Theme.of(context).colorScheme.onPrimary),
                                  minimumSize: WidgetStateProperty.all(
                                    Size(width1, 40),
                                  ),
                                  shape: WidgetStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(0),
                                    ),
                                  ),
                                ),
                                label: Text(
                                  projectFiles[index],
                                ),
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            fit: FlexFit.tight,
                            child: Container(
                              child: PopupMenuButton(
                                onSelected: (value) {
                                  if (value == 0) {
                                    _handleDeleteProject(projectFiles[index]);
                                    setState(() {});
                                  } else if (value == 1) {
                                  } else if (value == 2) {}
                                },
                                iconSize: 20,
                                icon: Icon(Icons.more_vert),
                                iconColor:
                                    Theme.of(context).colorScheme.onPrimary,
                                itemBuilder: (context) => [
                                  PopupMenuItem(
                                      value: 2,
                                      child: TextButton.icon(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        label: Text("Re-analyze"),
                                        icon: Icon(Icons.refresh),
                                        style: ButtonStyle(
                                          foregroundColor:
                                              WidgetStateProperty.all(
                                                  Theme.of(context)
                                                      .colorScheme
                                                      .onPrimary),
                                        ),
                                      )),
                                  PopupMenuItem(
                                      value: 1,
                                      child: TextButton.icon(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        label: Text("Edit"),
                                        icon: Icon(Icons.edit),
                                        style: ButtonStyle(
                                          foregroundColor:
                                              WidgetStateProperty.all(
                                                  Theme.of(context)
                                                      .colorScheme
                                                      .onPrimary),
                                        ),
                                      )),
                                  PopupMenuItem(
                                    value: 0,
                                    child: TextButton.icon(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      style: ButtonStyle(
                                        foregroundColor:
                                            WidgetStateProperty.all(
                                                Theme.of(context)
                                                    .colorScheme
                                                    .onPrimary),
                                      ),
                                      icon: Icon(Icons.delete),
                                      label: Text("Delete"),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
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
      List<String> projectList,
      TextEditingController projectName,
      TextEditingController inputPath,
      TextEditingController outputPath,
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
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter a name";
                  } else if (projectList
                      .map((e) => e.toLowerCase())
                      .contains(value.toLowerCase())) {
                    return "Already Exists";
                  } else {
                    return null;
                  }
                },
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

            //submit button
            Container(
              padding: EdgeInsets.all(5),
              child: ElevatedButton(
                onPressed: () {
                  final form = newProject.currentState as FormState?;
                  if (form == null) {
                    setState(() {
                      // Perform any necessary state updates here
                      print("add name");
                    });
                  } else if (form?.validate() ?? true) {
                    setState(() {
                      // Handle the "already exists" case appropriately
                      print("exists");
                    });
                  } else {
                    _handleNewProject(
                        projectName, inputPath, outputPath, projectDesciption);
                  }
                  setState(() {});
                  Navigator.of(context).pop();
                  projectName.clear();
                  inputPath.clear();
                  outputPath.clear();
                  projectDesciption.clear();
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

  void _handleNewProject(
      TextEditingController projectName,
      TextEditingController inputPath,
      TextEditingController outputPath,
      TextEditingController projectDesciption) async {
    await addProjectList(projectName.text, inputPath.text, outputPath.text,
        projectDesciption.text);
    await _loadProjects();
    setState(() {});
  }

  void _handleDeleteProject(String projectName) async {
    await deleteProjectList(projectName);
    await _loadProjects();
  }
  //final
}
