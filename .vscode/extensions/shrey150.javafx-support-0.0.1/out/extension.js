"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.deactivate = exports.activate = void 0;
const vscode = require("vscode");
const classpath_1 = require("./classpath");
// called once per VSCode session when the plugin is launched
function activate(context) {
    console.log('"javafx-support" now active');
    // add command to VSCode
    let disposable = vscode.commands.registerCommand('javafx-support.updateClasspath', () => classpath_1.updateClasspath(true));
    context.subscriptions.push(disposable);
    // create file system watcher for .classpath file in project workspace
    const fileWatcher = vscode.workspace.createFileSystemWatcher("**/.classpath", false, false, false);
    // update config if .classpath file is created
    fileWatcher.onDidCreate(() => {
        console.log(".classpath file created.");
        classpath_1.updateClasspath();
    });
    // update config if .classpath file changes
    fileWatcher.onDidChange(() => {
        console.log(".classpath file changed.");
        classpath_1.updateClasspath();
    });
    // run extension logic
    classpath_1.updateClasspath();
}
exports.activate = activate;
// this method is called when your extension is deactivated
function deactivate() { }
exports.deactivate = deactivate;
//# sourceMappingURL=extension.js.map