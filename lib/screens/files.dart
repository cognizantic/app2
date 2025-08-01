//import 'package:path/path.dart';

import '/barrel1.dart';

class FileExplorer extends StatefulWidget {
  const FileExplorer({super.key});
  @override
  _FileExplorer createState() => _FileExplorer();
}

class _FileExplorer extends State<FileExplorer> {
  late List<FileSystemEntity> futurePath = [];
  @override
  void initState() {
    super.initState();
    //futurePath = _getDrives();
  }

  late List<FileSystemEntity> currentPath = [];
  late String displayPath = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Files")),
      drawer: AppBar1(
        text2disp: 'Files',
      ),
      body: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              IconButton(
                  onPressed: () async {
                    if (currentPath.isNotEmpty) {
                      currentPath.removeLast();
                    } else {
                      futurePath = await _getDrives();
                    }
                    setState(() {
                      displayPath = (_currentFolder(currentPath)).isEmpty
                          ? "start1"
                          : _currentFolder(currentPath);
                    });
                  },
                  icon: Icon(Icons.arrow_back)),
              Text(displayPath),
            ],
          ),
        ),
        drawer: Drawer(),
        body: ListView.builder(
            itemCount: futurePath.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Icon(Icons.folder),
                title: Text(futurePath[index].toString()),
                onTap: () async {
                  currentPath.add(futurePath[index]);
                  futurePath = await _getFileList(_currentFolder1(currentPath));
                  setState(() {
                    print(futurePath);
                    displayPath = _currentFolder(currentPath);
                  });
                },
              );
            }),
      ),
    );
  }

  Future<List<FileSystemEntity>> _getFileList(String filePath) async {
    final directory = Directory(filePath);
    if (directory.existsSync()) {
      var temp1 = directory.listSync(recursive: false).toList();
      print(temp1);
      return temp1;
    } else {
      print('no directory found');
      return [];
    }
  }

  Future<List<FileSystemEntity>> _getDrives() async {
    List<FileSystemEntity> finalList = [];
    const driveList = [
      'A:',
      'B:',
      'C:',
      'D:',
      'E:',
      'F:',
      'G:',
      'H:',
      'I:',
      'J:',
      'K:',
      'L:',
      'M:',
      'N:',
      'O:',
      'P:',
      'Q:',
      'R:',
      'S:',
      'T:',
      'U:',
      'V:',
      'W:',
      'X:',
      'Y:',
      'Z:'
    ];
    for (final letter in driveList) {
      final drive = Directory('$letter\\');
      if (drive.existsSync()) {
        finalList.add(drive);
      }
    }
    return finalList;
  }

  String _currentFolder(List<FileSystemEntity> currentPath) {
    print(currentPath);
    var temp1 = currentPath.map((e) => e.path).join('\\');
    print(temp1);
    return temp1;
  }

  String _currentFolder1(List<FileSystemEntity> currentPath) {
    print(currentPath);
    print(currentPath.length);
    //var temp1 = currentPath.map((e) => e.path).join('\\');
    var temp1 = currentPath[(currentPath.length) - 1].toString();
    print(temp1);
    return temp1;
  }
}
