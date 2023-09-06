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
    })
}