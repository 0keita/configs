"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.updateClasspath = void 0;
const vscode = require("vscode");
const xml2js = require("xml2js");
const fs = require("fs");
/**
 * Updates .classpath file in project workspace.
 *
 * @param force If true, forces patch of .classpath file even if this is not a JavaFX project.
 * 				Used when `javafx-support.updateClasspath` command is manually called.
 */
function updateClasspath(force) {
    return __awaiter(this, void 0, void 0, function* () {
        const JDT_PATH = "org.eclipse.jdt.launching.JRE_CONTAINER/org.eclipse.jdt.internal.debug.ui.launcher.StandardVMType/JavaSE-1.8";
        const JAVAFX_ACCESSRULE = [
            { $: { kind: "accessible", pattern: "javafx/**" } },
            { $: { kind: "accessible", pattern: "com/sun/javafx/**" } }
        ];
        // fetch .classpath file
        const fileList = yield vscode.workspace.findFiles(".classpath");
        // don't continue if .classpath file doesn't exist
        if (fileList.length === 0) {
            console.warn("No .classpath file found");
            return;
        }
        // get .classpath file path
        const fileName = fileList[0].fsPath;
        // read file as string
        const fileData = fs.readFileSync(fileName, { encoding: 'utf-8' });
        // parse string into JSON object
        xml2js.parseString(fileData, (err, obj) => {
            // find <classpathentry> for JDT path
            const jdtEntry = obj.classpath.classpathentry.filter((x) => x.$.path === JDT_PATH)[0];
            // cancel if <classpathentry> for JDT path doesn't exist
            if (jdtEntry) {
                // if <accessrules> doesn't exist, add it
                if (!jdtEntry.accessrules) {
                    console.log("Updating .classpath...");
                    // remove old <classpathentry> from XML
                    const entryIndex = obj.classpath.classpathentry.indexOf(jdtEntry);
                    delete obj.classpath.classpathentry[entryIndex];
                    // add <accessrule> allowing usage of JavaFX
                    const newJdtEntry = { $: jdtEntry.$, attributes: jdtEntry.attributes, accessrules: [{ accessrule: JAVAFX_ACCESSRULE }] };
                    // push new <classpathentry> to JSON object
                    obj.classpath.classpathentry.push(newJdtEntry);
                    // build and write XML data to file
                    const newFileData = new xml2js.Builder().buildObject(obj);
                    fs.writeFileSync(fileName, newFileData);
                    vscode.window.showInformationMessage("JavaFX Support: Successfully updated project configuration");
                }
                else {
                    console.log("\".classpath\" already allows JavaFX access");
                }
            }
            else {
                console.log("Not a Java 8 project, skipping \".classpath\" patch...");
            }
        });
    });
}
exports.updateClasspath = updateClasspath;
//# sourceMappingURL=classpath.js.map