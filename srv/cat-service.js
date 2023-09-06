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
        console.log("ja")
    })
}