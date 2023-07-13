class AppSettings {
  final String name;
  final String description;
  final String version;
  final String versionDisplay;
  final String packageName;
  final String firebaseURL;
  AppSettings({
    this.name = 'Firebase task Menanger',
    this.description = 'Sample Project',
    this.version = '1.0',
    this.versionDisplay = '1.0.0',
    this.packageName = 'com.menanger.task',
    this.firebaseURL = 'https://fir-task-menanger-default-rtdb.europe-west1.firebasedatabase.app',
  });
}
