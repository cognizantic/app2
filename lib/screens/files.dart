import '/barrel1.dart';

class FileExplorer extends StatefulWidget {
  const FileExplorer({super.key});
  @override
  _FileExplorerState createState() => _FileExplorerState();
}

class _FileExplorerState extends State<FileExplorer> {
  late List<String> projectFiles = [];
  @override
  void initState() {
    super.initState();
    projectFiles = ['project 1', 'project 2'];
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
            Flexible(child: Column(children: [_projectList(projectFiles)])),
            //main content
            Flexible(child: Column(children: [])),
            //right side
            Flexible(child: Column(children: [])),
          ],
        ),
      ),
    );
  }

  Widget _projectList(List<String> projectFiles) {
    return Container(
      width: 200,
      child: Column(
        children: [
          Flexible(
            fit: FlexFit.tight,
            child: ListView.builder(
              itemCount: projectFiles.length,
              itemBuilder: (context, int index) {
                return Wrap(
                  //scrollDirection: Axis.horizontal,
                  children: [
                    TextButton.icon(
                      onPressed: () {},
                      label: Text(
                        projectFiles[index],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
