sap.ui.define([
    "sap/m/Dialog",
    "sap/m/Select",
    "sap/m/Button",
    "sap/m/MessageToast",
    "sap/m/VBox"
], function(Dialog, Select, Button, MessageToast, VBox) {
    'use strict';

    return {
        setCurrency: function() {
            const model = this.getModel();
            const view = this.routing.getView();

            const select = new Select({
                width: "100%",
                items: [
                    {
                        key: 'USD',
                        text: 'USD',
                    },
                    {
                        key: 'GBP',
                        text: 'GBP',
                    },
                    {
                        key: 'SEK',
                        text: 'SEK',
                    },
                    {
                        key: 'NOK',
                        text: 'NOK',
                    },
                ]
            });

            const box = new VBox({
                items: [ select ]
            });
            box.addStyleClass("sapUiTinyMargin")

            const dialog = new Dialog({
                content: [ box ],
                buttons: [
                    new Button({
                        text: "Ok",
                        press: async () => {
                            const selectedCurrency = select.getSelectedKey();
                            // Make backend call
                            const context = model.bindContext("/setCurrencyFilter(...)");
                            context.setParameter("currency",selectedCurrency)
                            context.execute()
                                .then(() => MessageToast.show("Success!"))
                                .catch(() => MessageToast.show("Failure!"))
                        }
                    }),
                    new Button({
                        text: "Cancel",
                        press: () => dialog.close()
                    }),
                ]
            });

            view.addDependent(dialog);



            dialog.open();
        }
    };
});
