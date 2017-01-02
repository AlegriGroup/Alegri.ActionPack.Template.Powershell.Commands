# Alegri.ActionPack.Template.Powershell.Commands

##Kurz Beschreibung
Das Aktionspaket Template ist ein Beispiel Powershell Modul um ein Aktionspaket für den [Action Flow tool](https://github.com/Campergue/Alegri.ActionFlow.PowerShell.Commands) zu erstellen.

Die Erweiterung erfolgt in zwei Bereiche. Zum einen die Aktionserweiterung in der XML Schema um ein gültige XML erstellen zu können. Die andere Erweiterung erfolgt in der Anbindung ihrer Aktion zu der Funktion die die eigentliche Aktion ausführt.

## Konventionen
Bitte halten Sie sich an die Konventionen um zum einen keine Namenskonflikten mit anderen Aktionspaketen zu bekommen und zum anderen wird die Konvention bei der geplanten Automatischen Dokumentationsgenererierung und den geplanten Action Flow UI als Basis rangezogen. 
Kapseln Sie auch die abhängigen Funktionen. Es erhöht die Wartbarkeit und trägt bei das man Abhängigkeiten besser ersetzen kann.
 
![image](https://github.com/Campergue/Alegri.ActionPack.Template.Powershell.Commands/blob/master/AlegriActionPackTemplate/AlegriActionPackTemplate/Documentation/ActionFlowNamenskonvention.png)

### Funktionsnamen
#### Find- und Start- Funktion Schnittstelle zum AktionFlowTool
Find-ActionInAP_[ActionPackName]
Start-ActionFromAP_[ActionPackName]
#### Startfunktion einer Aktion
Start-AP_[ActionPackName]_[ActionName]
#### Funktionsname für Aufruf einer Externen Funktion
Use-AP_[ActionPackName]_[ExternModulShortName]_[ExternFunctionName]
#### Funktionsname für Aufruf einer Internen Funktion
[[Approved Verbs](https://technet.microsoft.com/en-us/library/ms714428.aspx)]-AP_[ActionPackName]_[FunctionName]

### Aktionsnamen
AP_[ActionPackName]_[ActionName]

### Standard Ordner
#### Variable
$Global:AP_[ActionPackName]_Folder_[FolderName]
#### Wert 
$env:USERPROFILE\Documents\ActionFlow\AP_[ActionPackName]\[FolderName]

### Abhängigkeitsdateinamen
DependentFunction.ps1

### Namenskonvention Globale Variable
$Global:AP_[ActionPackName]_[VariableName]

### Ordnerstruktur innerhalb des Projekts
![image](https://github.com/Campergue/Alegri.ActionPack.Template.Powershell.Commands/blob/master/AlegriActionPackTemplate/AlegriActionPackTemplate/Documentation/Ordnerstruktur.png)
  1.Geben Sie hier alle Bilder die sie in der Dokumentation verwenden.
  2.Geben Sie hier alle verwendete Powershell Skripte die Sie für das Modul verwenden
  3.Geben Sie hier alle XML Files wie z.B. Test bzw. Beispiel Actions Files
  4.Geben Sie hier alle XML Schema die zur Generierung der Aktion XML nötig sind.

## Beispiel für Manuelle Interaktion innerhalb einer Aktion
![image](https://github.com/Campergue/Alegri.ActionPack.Template.Powershell.Commands/blob/master/AlegriActionPackTemplate/AlegriActionPackTemplate/Documentation/BeispielAufrufmanuelleAktion.png)

## Übersicht der Anpassungen für Ihr eigenes Aktionspaket

### Erstellung einer eigenen Schema Datei mit Ihren Action Objecten
![image](https://github.com/Campergue/Alegri.ActionPack.Template.Powershell.Commands/blob/master/AlegriActionPackTemplate/AlegriActionPackTemplate/Documentation/EinbauEigeneAktionInSchema.png)
  1. Verwenden Sie die Gleiche Schemabezeichnung, damit Sie in dem Schema des ActionFlow die Include Funktion nützen können.
  2. Das oberste Element muss den Namen ActionObject haben
  3. Hier definieren Sie ihre Aktionen. Beachten Sie bitte die Konventionen.

### Einbinden der eigenen Schema in das Schema des ActionFlowTool
![image](https://github.com/Campergue/Alegri.ActionPack.Template.Powershell.Commands/blob/master/AlegriActionPackTemplate/AlegriActionPackTemplate/Documentation/EinbindenEigeneSchema.png)
  1. Hiermit binden Sie ihre eigene Aktionen Schema ein.

### Erstellen einer AP_[PaketName] Datei mit den Referenzen zu den Scripten mit den Aktionsimplementierungen
![image](https://github.com/Campergue/Alegri.ActionPack.Template.Powershell.Commands/blob/master/AlegriActionPackTemplate/AlegriActionPackTemplate/Documentation/ErstellenEinerAP_PaketNameDatei.png)
  1. Erstellen Sie eine Datei mit dem Namen AP_[ActionPackName].ps1
  2. Sollten Sie eigene Ordner benötigen, definieren Sie es an dieser Stelle.
  3. Stellen Sie Globale Variable für die anderen Anwendungen bereit, definieren Sie es an dieser Stelle.
  4. Bitte lagern Sie Ihre eigene Aktionen in eigene Skripte aus und binden Sie ihre Skripte hier ein.
  5. Erstellen Sie eine Funktion mit dem Namen Find-ActionInAP_[PaketName]
  6. Erstellen Sie eine Funktion mit dem Namen Start-ActionFromAP_[PaketName]
  7. Erstellen Sie eventuell eine Funktion mit den Namen Check-ExistFolderInAP_[PaketName]

### Einbau Ihrer Aktion in der Find-ActionInAP_[PaketName]
![image](https://github.com/Campergue/Alegri.ActionPack.Template.Powershell.Commands/blob/master/AlegriActionPackTemplate/AlegriActionPackTemplate/Documentation/EinbauIhrerAktionInFindActionFunction.png)
  1. Deklarieren Sie für jede Aktion eine Switch Case Anweisung und setzen den Return Wert auf True
  2. Sie müssen einen Boolean Wert zurückgeben. Damit prüft das AktionFlow Tool ob die Aktion in dem Paket vorhanden ist.

### Einbau Ihrer Aktion in der Start-ActionFromAP_[PaketName]
![image](https://github.com/Campergue/Alegri.ActionPack.Template.Powershell.Commands/blob/master/AlegriActionPackTemplate/AlegriActionPackTemplate/Documentation/EinbauIhrerAktioninStartActionFunktion.png)
  1. Holen Sie den Aktionsnamen aus dem XML Object
  2. Deklarieren Sie für jede Aktion eine Switch Case Anweisung und reichen das ActionObject einfach in ihre Implementierung durch.

### Einbau Ihres Standort Ordner in der Check-ExistFolderInAP_[PaketName]
![image](https://github.com/Campergue/Alegri.ActionPack.Template.Powershell.Commands/blob/master/AlegriActionPackTemplate/AlegriActionPackTemplate/Documentation/EinbauStandardOrdner.png)
  1. Erstellen Sie eine Variable AP_[PaketName]_Folder_[FolderName] und verwenden Sie wie im Beispiel den Documents Bereich des Users gefolgt vom Ordern ActionFlow - AP_[PaketName] - [FolderName].
  2. Erstellen eine interne Folder Variable in der Check-ExistFolderInAP_[PaketName] Funktion.
  3. Erstellen eine PrüfVariable und fügen Sie es der ersten Überprüfung hinzu, ob überhaupt Ordner angelegt werden müssen.
  4. Erstellen Sie eine Prüfabfrage für ihren Ordner um zu prüfen ob dieser Ordern neu angelegt werden muss.[Updatefunktion]

### Einbau der AP_[PaketName] Datei in der Module Start Datei
![image](https://github.com/Campergue/Alegri.ActionPack.Template.Powershell.Commands/blob/master/AlegriActionPackTemplate/AlegriActionPackTemplate/Documentation/EinbauInModulStartDatei.png)
  1. Tragen Sie hier ihr Paketname ein.
  2. Binden Sie hier die AP_[PaketName] Datei ein.
  3. Sie können wie in diesem Beispiel einen Erfolgmeldung auf der Konsole ausgeben, damit Sie wissen dass das Modul eingebunden ist.
  4. Falls Sie eigene Standard Ordner brauchen, binden Sie die Erstellung der Standard Ordner ein. 

## Beispiel einer Aktion XML für das Action Flow Tool
![image](https://github.com/Campergue/Alegri.ActionPack.Template.Powershell.Commands/blob/master/AlegriActionPackTemplate/AlegriActionPackTemplate/Documentation/Beispiel einer Aktion XML.png)
  1. Innerhalb des ActionConfigure Element können Sie ihre Aktionsblöcke hinterlegen. 
  2. Innerhalb eines Aktionsblock definieren Sie die einzelnen Aktionen. Ein Block kann durch Ignore = true deaktiviert werden. 
  3. Innerhalb einer Aktion können Sie zwei Arten von Aktionen hinterlegen. Ein Manuelle oder Automatische Aktion. Sie können ihre Aktion eine Beschreibung sowie einer ID vergeben um beim Logging besser unterscheiden zu können. Sie können auch eine einzelne Aktion durch setzen des Ignore Attribute auf True deaktivieren.
  4. In einem Manuellen Task ist nur die Eingabe des Aktionstext notwendig. Sie geben dem User hiermit eine Anweisung was dieser machen soll bevor das Skript weiterläuft. Der User hat auch die Möglichkeit die weiteren Aktionen abzubrechen.
  5. Eine Automatische Aktion stellt eine Aktion aus einem Aktion Paket dar. Die notwendigen Eingabe hängt von der jeweiligen Aktion ab. Es können auch weitere Elemente innerhalb der Aktion notwendig sein. 
  
---

##Short Description
The Template action pack is a sample Powershell module to create an action pack for the [Action Flow tool](https://github.com/Campergue/Alegri.ActionFlow.PowerShell.Commands).

The expansion is in two areas. On the one hand the action extension in the XML schema to create a valid XML. The other extension takes place in the connection of its action to the function which carries out the actual action.

## Conventions
Please keep to the conventions in order to avoid naming conflicts with other action packages. On the other hand, the convention will be used as a basis for the planned automatic documentation generation and the planned ActionFlow UI.
Also encapsulate the dependent functions. It increases the maintainability and helps to replace dependencies better.
 
![image](https://github.com/Campergue/Alegri.ActionPack.Template.Powershell.Commands/blob/master/AlegriActionPackTemplate/AlegriActionPackTemplate/Documentation/ActionFlowNamenskonvention.png)

### Function names
#### Find and Start function Interface to the ActionFlowTool
Find-ActionInAP_[ActionPackName]
Start-ActionFromAP_[ActionPackName]
#### Start function of an action
Start-AP_[ActionPackName]_[ActionName]
#### Function name for calling an external function
Use-AP_[ActionPackName]_[ExternModulShortName]_[ExternFunctionName]
#### Function name for calling an internal function
[[Approved verbs](https://technet.microsoft.com/en-us/library/ms714428.aspx)]-AP_[ActionPackName]_[FunctionName]

### Action names
AP_[ActionPackName]_[ActionName]

### Default folder
#### variable
$Global:AP_[ActionPackName]_Folder_[FolderName]
#### Value
$Env:USERPROFILE\Documents\ActionFlow\AP_[ActionPackName]\[FolderName]

### dependency file names
DependentFunction.ps1

### Name Conventions Global Variable
$Global:AP_[ActionPackName]_[VariableName]

### Folder structure within the project
![Image](https://github.com/Campergue/Alegri.ActionPack.Template.Powershell.Commands/blob/master/AlegriActionPackTemplate/AlegriActionPackTemplate/Documentation/folder.png)
  1.Enter the pictures you use in the documentation.
  2.Enter the Powershell scripts you are using for the module
  3.Enter all XML files, such as Test or example actions files
  4.Enter the XML schema needed to generate the XML action.

## Example of manual interaction within an action
![image](https://github.com/Campergue/Alegri.ActionPack.Template.Powershell.Commands/blob/master/AlegriActionPackTemplate/AlegriActionPackTemplate/Documentation/BeispielAufrufmanuelleAktion.png)

## Overview of customizations for your own action package

### Create your own schema file with your action objects
![image](https://github.com/Campergue/Alegri.ActionPack.Template.Powershell.Commands/blob/master/AlegriActionPackTemplate/AlegriActionPackTemplate/Documentation/EinbauEigeneAktionInSchema.png)
  1. Use the same schema drawing so that you can use the include function in the ActionFlow schema.
  2. The top element must be named ActionObject
  3. Here you define your actions. Please note the conventions.

### Embed your own schema into the schema of the ActionFlowTool
![image](https://github.com/Campergue/Alegri.ActionPack.Template.Powershell.Commands/blob/master/AlegriActionPackTemplate/AlegriActionPackTemplate/Documentation/EinbindenEigeneSchema.png)
  1. Use this to bind your own schema actions.

### Create an AP_[package_name] file containing the references to the scripts with the action implementations
![image](https://github.com/Campergue/Alegri.ActionPack.Template.Powershell.Commands/blob/master/AlegriActionPackTemplate/AlegriActionPackTemplate/Documentation/ErstellenEinerAP_PaketNameDatei.png)
   1. Create a file named AP_ [ActionPackName] .ps1
   2. If you need your own folders, define it at this point.
   3. Provide global variables for the other applications, define it at this point.
   4. Please add your own actions to your own scripts and include your scripts here.
   5. Create a function named Find-ActionInAP_ [PackageName]
   6. Create a function named Start-ActionFromAP_ [PackageName]
   7. If necessary, create a function named Check-ExistFolderInAP_ [PackageName]

### EInstallation of your action in the Find-ActionInAP_[PackageName]
![image](https://github.com/Campergue/Alegri.ActionPack.Template.Powershell.Commands/blob/master/AlegriActionPackTemplate/AlegriActionPackTemplate/Documentation/EinbauIhrerAktionInFindActionFunction.png)
  1. Declare a switchcase statement for each action and set the return value to true
  2. You must return a Boolean value. The ActionFlow tool checks whether the action exists in the package

### Installation of your action in the Start-ActionFromAP_[PackageName]
![image](https://github.com/Campergue/Alegri.ActionPack.Template.Powershell.Commands/blob/master/AlegriActionPackTemplate/AlegriActionPackTemplate/Documentation/EinbauIhrerAktioninStartActionFunktion.png)
  1. Get the action name from the XML Object
  2. Declare a switchcase statement for each action and simply pass the ActionObject into its implementation.

### Installing your location folder in the Check-ExistFolderInAP_[PackageName]
![image](https://github.com/Campergue/Alegri.ActionPack.Template.Powershell.Commands/blob/master/AlegriActionPackTemplate/AlegriActionPackTemplate/Documentation/EinbauStandardOrdner.png)
  1. Create a variable AP_ [PackageName] _Folder_ [FolderName], and then use the Documents section of the user followed by the OrderFormFlow - AP_ [PackageName] - [FolderName] folder.
  2. Create an internal folder variable in the check-ExistFolderInAP_ [PackageName] function.
  3. Create a check variable and add it to the first check to see if any folders need to be created.
  4. Create a check query for its folder to check if these folders have to be created again. [Update function]

### Install the AP_ [PackageName] file in the module startup file
![image](https://github.com/Campergue/Alegri.ActionPack.Template.Powershell.Commands/blob/master/AlegriActionPackTemplate/AlegriActionPackTemplate/Documentation/EinbauInModulStartDatei.png)
   1. Enter your package name.
   2. Include the AP_ [package_name] file.
   3. As in this example, you can issue a success message on the console so you know that the module is embedded.
   4. If you need your own default folders, bind the creation of the default folders.

## Example XML Action for Action Flow Tool
![image](https://github.com/Campergue/Alegri.ActionPack.Template.Powershell.Commands/blob/master/AlegriActionPackTemplate/AlegriActionPackTemplate/Documentation/Beispiel einer Aktion XML.png)
  1. Within the ActionConfigure element, you can save your action blocks.
  2. Within an action block, you define the individual actions. A block can be disabled by Ignore = true.
  3. You can define two types of actions within an action. A manual or automatic action. You can give your action a description as well as an ID in order to be able to distinguish between logging. You can also disable a single action to disable the IgnoreAttribute on True.
  4. In a manual task, only the action text is required. They give the user herewith a statement what this should do before the script continues. The user also has the possibility to cancel further actions.
  5. An automatic action is an action from an action package. The necessary input depends on the action. Further elements within the action may also be necessary. 
