import 'package:isar/isar.dart';

part 'project_files.g.dart';

@collection
class NewProject {
  Id projectId = Isar.autoIncrement;
  late String projectName;
  late String projectDescription;
  late String inputFolder;
  late String outputFolder;
  late bool analysisCompleted;
  late int performanceLoadable;

  late List<FileToKeyValueArray> uncompletedFilePath;
  late List<FileToKeyValueArray> completedFilePath;
  late List<FileToKeyValueList> listOfKeysPerFile;

  late List<String> operationsToBeDone;
  late List<String> totalKeys;

  late int fileCount;
  late int completedFileCount;
  late int uncompletedFileCount;
}

@embedded
class FileToKeyValueArray {
  late String
      key; //store custom values with scope of within app backend instead of file path itself
  late String value; //store the file path
}

@embedded
class FileToKeyValueList {
  late String key; //use the custom name
  late List<String> value; //use the keys found in the file
}
