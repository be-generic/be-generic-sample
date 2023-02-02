# Be-Generic Code Base Sample

### Description

This sample can be used as a guide to how Be-Generic Codeb Base can be used on a practical example of HR application.

### Installation

To install, first fork/clone repository and then follow these steps:
 - Prepare an empty database on MS SQL server (2016 or newer)
 - Open the sample solution in Visual Studio
 - Perform these operations in the opened solution in Visual Studio:
   - Revise connection string with correct database data in **BeGeneric** project in appsettings.json and appsettings.development.json
   - Right-click on **BeGenericDatabase** database project and select "Schema compare..." option. Then perform a schema compare with empty database and Update it
   - Copy contents of FillSampleData.sql file in **BeGenericDatabase** database project and paste and run it on the selected database
 - Enjoy the very easily made Be-Generic-based backend 😉
 
> **Warning**
>
> Build the solution **TWICE**. All the Models, DTO Models and Entity Framework context get created automatically, and Visual Studio will usually fail the first build. Usually pre-build scripts don't take long, but if they do and build always fails, check the connection string in the appsettings.json and appsettings.development.json


### License

be-generic is [fair-code](http://faircode.io) distributed under the
[**Sustainable Use License**](https://github.com/be-generic/be-generic/blob/main/LICENSE.md).

Additional information about the license model can be found in the
[docs](https://be-generic.com/).
