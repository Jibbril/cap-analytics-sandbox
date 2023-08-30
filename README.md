# Analytics sandbox
Sandbox for trying out the analytics tools of SAP HANA DB Cloud. Main source of information is [this](https://developers.sap.com/mission.hana-cloud-cap.html) tutorial.

## Steps to get started
- Using the SAP Business Application Studio, select `New project from template` and choose `CAP Project`
- In the features section, check the following: 
   - `CI/CD Pipeline Integration` 
   - `Configuration for  SAP HANA Deployment`
   - `MTA based SAP Business Technology Platform Deployment`
   - `Basic Sample Files`
- Generate the project and commit the result.
- Open the `SAP HANA PROJECTS` drawer below the file tree explorer.
- Under Database Connections, find your target container and press the green "bind" icon to the right
- In the options that appear at the top, select `Bind to an HDI container` and then `Create new service instance`. Give it a name and await creation.
- Press the deploy button (rocket) on the top level of the project you are targeting. So the level above `Database Connections`.
- At this point you should be able to create `.hdbcalculationview` files in your db folder. 
