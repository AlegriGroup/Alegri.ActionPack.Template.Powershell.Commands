# Alegri.ActionPack.Template.Powershell.Commands

##Kurz Beschreibung
Das Aktionspaket Template ist ein Beispiel Powershell Modul um ein Aktionspaket für den [Action Flow tool](https://github.com/Campergue/Alegri.ActionFlow.PowerShell.Commands) zu erstellen.

Die Erweiterung erfolgt in zwei Bereiche. Zum einen die Aktionserweiterung in der XML Schema um ein gültige XML erstellen zu können. Die andere Erweiterung erfolgt in der Anbindung ihrer Aktion zu der Funktion die die eigentliche Aktion ausführt.

Ebenfalls im Beispiel enthalten, ist das einbauen einer manuellen Interaktion innerhalb einer Aktion.
![image](https://cloud.githubusercontent.com/assets/6292190/21508246/d2f36ee6-cc7f-11e6-9d6e-4155b2453a7a.png)

## Übersicht der Anpassungen für Ihr eigenes Aktionspaket
* Erstellung einer eigenen Schema Datei mit Ihren Action Objecten
![image](https://cloud.githubusercontent.com/assets/6292190/21508101/43014124-cc7e-11e6-9d0d-f36c77fbe1aa.png)
  1. Verwenden Sie die Gleiche Schemabezeichnung, damit Sie in dem Schema des ActionFlow die Include Funktion nützen können.
  2. Das oberste Element muss den Namen ActionObject haben
  3. Hier definieren Sie ihre Aktionen. Um keine Konflikte mit anderen Paketen zu bekommen, halten Sie sich an die Namenskonvention AP_[Paket]_[Aktion]
* Einbinden der eigenen Schema in das Schema des ActionFlowTool
![image](https://cloud.githubusercontent.com/assets/6292190/21508476/a28aef70-cc81-11e6-92ba-490330e155d7.png)
  1. Hiermit binden Sie ihre eigene Aktionen Schema ein.
* Erstellen einer AktionPackage[Paket] Datei mit den Referenzen zu den Scripten mit den Aktionsimplementierungen
![image](https://cloud.githubusercontent.com/assets/6292190/21508600/97a86f32-cc82-11e6-803e-f0dcc4c68c5e.png)
  1. Bitte halten Sie sich an die Namenskonvention ActionPackage[Paket].ps1
  2. Bitte lagern Sie Ihre eigene Aktionen in eigene Skripte aus und binden Sie ihre Skripte hier ein.
  3. Erstellen Sie eine Funktion mit dem Namen Find-ActionInActionPackage[Paket]
  4. Erstellen Sie eine Funktion mit dem Namen Start-ActionFromActionPackage[Paket]
* Einbau Ihrer Aktion in der Find-ActionInActionPackage[Paket]
![image](https://cloud.githubusercontent.com/assets/6292190/21508762/e8cde71a-cc83-11e6-96aa-a727c8505f7d.png)
  1. Deklarieren Sie für jede Aktion eine Switch Case Anweisung und setzen den Return Wert auf True
  2. Sie müssen einen Boolean Wert zurückgeben. Damit prüft das AktionFlow Tool ob die Funktion in dem Paket vorhanden ist.
* Einbau Ihrer Aktion in der Start-ActionFromActionPackage[Paket]
![image](https://cloud.githubusercontent.com/assets/6292190/21509057/e3b9b946-cc85-11e6-9ddf-c09c06fdc4a5.png)
  1. Holen Sie den Aktionsnamen aus dem XML Object
  2. Deklarieren Sie für jede Aktion eine Switch Case Anweisung und reichen das ActionObject einfach in ihre Implementierung durch

## Beispiel einer Aktion XML für das Action Flow Tool
![image](https://cloud.githubusercontent.com/assets/6292190/21509295/dc3e2330-cc87-11e6-8de2-dc5ffe5d596f.png)
  1. Innerhalb des ActionConfigure Element können Sie ihre Aktionsblöcke hinterlegen. 
  2. Innerhalb eines Aktionsblock definieren Sie die einzelnen Aktionen. Ein Block kann durch Ignore = true deaktiviert werden. 
  3. Innerhalb einer Aktion können Sie zwei Arten von Aktionen hinterlegen. Ein Manuelle oder Automatische Aktion. Sie können ihre Aktion eine Beschreibung sowie einer ID vergeben um beim Logging besser unterscheiden zu können. Sie können auch eine einzelne Aktion durch setzen des Ignore Attribute auf True deaktivieren.
  4. In einem Manuellen Task ist nur die Eingabe des Aktionstext notwendig. Sie geben dem User hiermit eine Anweisung was dieser machen soll bevor das Skript weiterläuft. Der User hat auch die Möglichkeit die weiteren Aktionen abzubrechen.
  5. Eine Automatische Aktion stellt eine Aktion aus einem Aktion Paket dar. Die notwendigen Eingabe hängt von der jeweiligen Aktion ab. Es können auch weitere Elemente innerhalb der Aktion notwendig sein. 
  
---

##Short Description
The action pack template is a sample Powershell module to create an action package for the 
[Action Flow tool](https://github.com/Campergue/Alegri.ActionFlow.PowerShell.Commands).

The expansion is in two areas. On the one hand the action extension in the XML schema to create a valid XML. The other extension takes place in the connection of its action to the function which carries out the actual action.

Also included in the example is the incorporation of a manual interaction within an action.
![image](https://cloud.githubusercontent.com/assets/6292190/21508246/d2f36ee6-cc7f-11e6-9d6e-4155b2453a7a.png)

## Overview of customizations for your own action pack
* Create your own schema file with your action objects
![image](https://cloud.githubusercontent.com/assets/6292190/21508101/43014124-cc7e-11e6-9d0d-f36c77fbe1aa.png)
  1. Use the same schema drawing so that you can use the include function in the ActionFlow schema.
  2. The top element must have the name ActionObject
  3. Here you define your actions. To avoid conflicts with other packages, follow the naming convention AP_ [package] _ [action]
* Include your own schema in the schema of the ActionFlowTool
![image](https://cloud.githubusercontent.com/assets/6292190/21508476/a28aef70-cc81-11e6-92ba-490330e155d7.png)
  1. Use this to bind your own schema actions.
* Create an ActionPackage [package] file containing the references to the scripts with the action implementations
![image](https://cloud.githubusercontent.com/assets/6292190/21508600/97a86f32-cc82-11e6-803e-f0dcc4c68c5e.png)
  1. Please refer to the name convention ActionPackage [package] .ps1
  2. Please add your own actions to your own scripts and include your scripts here.
  3. Create a function called Find-ActionInActionPackage [package]
  4. Create a function called Start-ActionFromActionPackage [package]
* Include your action in the Find-ActionInActionPackage [Template]
![image](https://cloud.githubusercontent.com/assets/6292190/21508762/e8cde71a-cc83-11e6-96aa-a727c8505f7d.png)
  1. Declare a switchcase statement for each action and set the return value to true
  2. You must return a Boolean value. The ActionFlow tool checks whether the function exists in the package.
* Include your action in the Startup ActionFromActionPackage [Template]
![image](https://cloud.githubusercontent.com/assets/6292190/21509057/e3b9b946-cc85-11e6-9ddf-c09c06fdc4a5.png)
  1. Get the action name from the XML Object
  2. Declare a switchcase statement for each action and simply pass the ActionObject into its implementation

## Example of an Action Flow Tool XML
![image](https://cloud.githubusercontent.com/assets/6292190/21509295/dc3e2330-cc87-11e6-8de2-dc5ffe5d596f.png)
  1. Within the ActionConfigure element, you can save your action blocks.
  2. Within an action block, you define the individual actions. A block can be disabled by Ignore = true.
  3. You can define two types of actions within an action. A manual or automatic action. You can give your action a description as well as an ID in order to be able to distinguish between logging. You can also disable a single action to disable the IgnoreAttribute on True.
  4. In a manual task, only the action text is required. They give the user herewith a statement what this should do before the script continues. The user also has the possibility to cancel further actions.
  5. An automatic action is an action from an action package. The necessary input depends on the action. Further elements within the action may also be necessary.
