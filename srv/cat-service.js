const fs = require('fs');
const papa = require('papaparse');

module.exports = srv => {
    srv.on('sleep', async () => {
        try {
            const query = 'Call "sleep"()';
            const res = await cds.run(query);
            console.log(res);
            return true;
        } catch(e) {
            console.error(e);
            return false;
        }
    });

    srv.on('setCurrencyFilter', async req => {
        const currencyCode = req.data?.currency;
        const internalId = req.user?.id;

        if (!currencyCode || !internalId) return req.error('Missing data for creation.');

        const filter = [ { internalId, currencyCode } ];
        
        await UPSERT(filter).into(srv.entities.GlobalCurrencyFilter)
    });

    srv.on('saveCurrencyTablesToDisk', async () =>  {
        const db = await cds.connect.to("db");
        const { TCURF, TCURN, TCURR, TCURV, TCURX } = db.entities('currencies');

        // Query data from the tables
        const dataTCURF = await SELECT.from(TCURF);
        const dataTCURN = await SELECT.from(TCURN);
        const dataTCURR = await SELECT.from(TCURR);
        const dataTCURV = await SELECT.from(TCURV);
        const dataTCURX = await SELECT.from(TCURX);

        // Convert data to CSV format
        const csvTCURF = papa.unparse(dataTCURF);
        const csvTCURN = papa.unparse(dataTCURN);
        const csvTCURR = papa.unparse(dataTCURR);
        const csvTCURV = papa.unparse(dataTCURV);
        const csvTCURX = papa.unparse(dataTCURX);

        // Save CSV files to local disk
        fs.writeFileSync('TCURF.csv', csvTCURF);
        fs.writeFileSync('TCURN.csv', csvTCURN);
        fs.writeFileSync('TCURR.csv', csvTCURR);
        fs.writeFileSync('TCURV.csv', csvTCURV);
        fs.writeFileSync('TCURX.csv', csvTCURX);
        return true;
    });
}