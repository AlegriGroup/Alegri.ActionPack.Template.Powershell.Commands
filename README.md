# Alegri.ActionPack.Template.Powershell.Commands

##Kurz Beschreibung
Das Aktionspaket Template ist ein Beispiel Powershell Modul um ein Aktionspaket für den [Action Flow tool](https://github.com/Campergue/Alegri.ActionFlow.PowerShell.Commands) zu erstellen.

Die Erweiterung erfolgt in zwei Bereiche. Zum einen die Aktionserweiterung in der XML Schema um ein gültige XML erstellen zu können. Die andere Erweiterung erfolgt in der Anbindung ihrer Aktion zu der Funktion die die eigentliche Aktion ausführt.

## Konventionen
Bitte halten Sie sich an die Konventionen um keine Namenskonflikten mit anderen Aktionspaketen zu bekommen. 
Kapseln Sie auch die Abhängigen Funktionen. Es erhöht die Wartbarkeit und trägt bei das man Abhänigkeiten besser ersetzen kann.
 
![image](https://cloud.githubusercontent.com/assets/6292190/21581253/1036197c-d02a-11e6-832d-161518664375.png)

## Beispiel für Manuelle Interaktion innerhalb einer Aktion
![image](https://cloud.githubusercontent.com/assets/6292190/21581214/edbdb5b4-d027-11e6-82d8-2a963877937e.png)

## Übersicht der Anpassungen für Ihr eigenes Aktionspaket

### Erstellung einer eigenen Schema Datei mit Ihren Action Objecten
![image](https://cloud.githubusercontent.com/assets/6292190/21581226/a2085998-d028-11e6-841a-0a11288102de.png)
  1. Verwenden Sie die Gleiche Schemabezeichnung, damit Sie in dem Schema des ActionFlow die Include Funktion nützen können.
  2. Das oberste Element muss den Namen ActionObject haben
  3. Hier definieren Sie ihre Aktionen. Beachten Sie bitte die Konventionen.

### Einbinden der eigenen Schema in das Schema des ActionFlowTool
![image](https://cloud.githubusercontent.com/assets/6292190/21581284/d9e95b20-d02b-11e6-913e-c9ad17e1cb4d.png)
  1. Hiermit binden Sie ihre eigene Aktionen Schema ein.

### Erstellen einer AP_[PaketName] Datei mit den Referenzen zu den Scripten mit den Aktionsimplementierungen
![image](https://cloud.githubusercontent.com/assets/6292190/21581323/f94a5db4-d02d-11e6-89ee-0ed2c4b2abc0.png)
  1. Bitte halten Sie sich an die Namenskonvention AP_[PaketName].ps1
  2. Bitte lagern Sie Ihre eigene Aktionen in eigene Skripte aus und binden Sie ihre Skripte hier ein.
  3. Erstellen Sie eine Funktion mit dem Namen Find-ActionInAP_[PaketName]
  4. Erstellen Sie eine Funktion mit dem Namen Start-ActionFromAP_[PaketName]
  5. Erstellen Sie eventuell eine Funktion mit den Namen Check-ExistFolderInAP_[PaketName]

### Einbau Ihrer Aktion in der Find-ActionInAP_[PaketName]
![image](https://cloud.githubusercontent.com/assets/6292190/21581343/fd35d22c-d02e-11e6-8420-29abd5ec4e01.png)
  1. Deklarieren Sie für jede Aktion eine Switch Case Anweisung und setzen den Return Wert auf True
  2. Sie müssen einen Boolean Wert zurückgeben. Damit prüft das AktionFlow Tool ob die Aktion in dem Paket vorhanden ist.

### Einbau Ihrer Aktion in der Start-ActionFromAP_[PaketName]
![image](https://cloud.githubusercontent.com/assets/6292190/21581348/4845ad96-d02f-11e6-80d2-f2de796b42d8.png)
  1. Holen Sie den Aktionsnamen aus dem XML Object
  2. Deklarieren Sie für jede Aktion eine Switch Case Anweisung und reichen das ActionObject einfach in ihre Implementierung durch.

### Einbau Ihres Standort Ordner in der Check-ExistFolderInAP_[PaketName]
![image](https://cloud.githubusercontent.com/assets/6292190/21581384/da8ecc2c-d030-11e6-9420-493fef23290e.png)
  1. Erstellen Sie eine Variable AP_[PaketName]_Folder_[FolderName] und verwenden Sie wie im Beispiel den Documents Bereich des Users gefolgt vom Ordern ActionFlow - AP_[PaketName] - [FolderName].
  2. Erstellen eine interne Folder Variable in der Check-ExistFolderInAP_[PaketName] Funktion.
  3. Erstellen eine PrüfVariable und fügen Sie es der ersten Überprüfung hinzu, ob überhaupt Ordner angelegt werden müssen.
  4. Erstellen Sie eine Prüfabfrage für ihren Ordner um zu prüfen ob dieser Ordern neu angelegt werden muss.[Updatefunktion]

### Einbau der AP_[PaketName] Datei in der Module Start Datei
![image](https://cloud.githubusercontent.com/assets/6292190/21581400/488b4f48-d031-11e6-8cac-2763da72949a.png)
  1. Binden Sie hier die AP_[PaketName] Datei ein.
  2. Sie können wie in diesem Beispiel einen Erfolgmeldung auf der Konsole ausgeben, damit Sie wissen dass das Modul eingebunden ist.
  3. Binden Sie die Erstellung der Standard Ordner ein. 

## Beispiel einer Aktion XML für das Action Flow Tool
![image](https://cloud.githubusercontent.com/assets/6292190/21581417/f323b120-d031-11e6-8b10-be4321404562.png)
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
Please keep to the conventions in order to avoid naming conflicts with other action packages.
Also encapsulate the dependent functions. It increases the maintainability and contributes to the replacement of dependencies.
 
![image](https://cloud.githubusercontent.com/assets/6292190/21581253/1036197c-d02a-11e6-832d-161518664375.png)

## Example of manual interaction within an action
![image](https://cloud.githubusercontent.com/assets/6292190/21581214/edbdb5b4-d027-11e6-82d8-2a963877937e.png)

## Overview of customizations for your own action package

### Create your own schema file with your action objects
![image](https://cloud.githubusercontent.com/assets/6292190/21581226/a2085998-d028-11e6-841a-0a11288102de.png)
  1. Use the same schema drawing so that you can use the include function in the ActionFlow schema.
  2. The top element must be named ActionObject
  3. Here you define your actions. Please note the conventions.

### Embed your own schema into the schema of the ActionFlowTool
![image](https://cloud.githubusercontent.com/assets/6292190/21581284/d9e95b20-d02b-11e6-913e-c9ad17e1cb4d.png)
  1. Use this to bind your own schema actions.

### Create an AP_[package_name] file containing the references to the scripts with the action implementations
![image](https://cloud.githubusercontent.com/assets/6292190/21581323/f94a5db4-d02d-11e6-89ee-0ed2c4b2abc0.png)
  1. Please refer to the naming convention AP_ [PackageName] .ps1
  2. Please add your own actions to your own scripts and include your scripts here.
  3. Create a function named Find-ActionInAP_[PackageName]
  4. Create a function named Start-ActionFromAP_[PackageName]
  5. Create a function named Check-ExistFolderInAP_[PackageName]

### EInstallation of your action in the Find-ActionInAP_[PackageName]
![image](https://cloud.githubusercontent.com/assets/6292190/21581343/fd35d22c-d02e-11e6-8420-29abd5ec4e01.png)
  1. Declare a switchcase statement for each action and set the return value to true
  2. You must return a Boolean value. The ActionFlow tool checks whether the action exists in the package

### Installation of your action in the Start-ActionFromAP_[PackageName]
![image](https://cloud.githubusercontent.com/assets/6292190/21581348/4845ad96-d02f-11e6-80d2-f2de796b42d8.png)
  1. Get the action name from the XML Object
  2. Declare a switchcase statement for each action and simply pass the ActionObject into its implementation.

### Installing your location folder in the Check-ExistFolderInAP_[PackageName]
![image](https://cloud.githubusercontent.com/assets/6292190/21581384/da8ecc2c-d030-11e6-9420-493fef23290e.png)
  1. Create a variable AP_ [PackageName] _Folder_ [FolderName], and then use the Documents section of the user followed by the OrderFormFlow - AP_ [PackageName] - [FolderName] folder.
  2. Create an internal folder variable in the check-ExistFolderInAP_ [PackageName] function.
  3. Create a check variable and add it to the first check to see if any folders need to be created.
  4. Create a check query for its folder to check if these folders have to be created again. [Update function]

### Install the AP_ [PackageName] file in the module startup file
![image](https://cloud.githubusercontent.com/assets/6292190/21581400/488b4f48-d031-11e6-8cac-2763da72949a.png)
  1. Insert the AP_ [PackageName] file here.
  2. As in this example, you can issue a success message on the console to let you know that the module is embedded.
  3. Bind the creation of the default folders.

## Example XML Action for Action Flow Tool
![image](https://cloud.githubusercontent.com/assets/6292190/21581417/f323b120-d031-11e6-8b10-be4321404562.png)
  1. Within the ActionConfigure element, you can save your action blocks.
  2. Within an action block, you define the individual actions. A block can be disabled by Ignore = true.
  3. You can define two types of actions within an action. A manual or automatic action. You can give your action a description as well as an ID in order to be able to distinguish between logging. You can also disable a single action to disable the IgnoreAttribute on True.
  4. In a manual task, only the action text is required. They give the user herewith a statement what this should do before the script continues. The user also has the possibility to cancel further actions.
  5. An automatic action is an action from an action package. The necessary input depends on the action. Further elements within the action may also be necessary. 
