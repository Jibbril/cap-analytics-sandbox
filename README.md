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

## Steps to generate proxy views
After creating and deploying a `.hdbcalculationview` you need to create a proxy entity in the cap application to expose the view. This can be done by doing the following:
- Run the `hana-cli createModule` command in the root folder.
- From this command there is a `.env` file generated in the  `db` folder, move it to the root level of this repo.
- Run `hana-cli inspectView -v <your-view-name> -o cds`
- Take the resulting view that is printed to the console and add it to your root cds schema (Not under a namespace).
- Expose the view inside your service.
- Redeploy to the database using the HANA Projects drawer in the file explorer pane.
- The calculationview should now be accessible from the api.