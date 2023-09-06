sap.ui.define([
    "sap/m/MessageToast"
], function(MessageToast) {
    'use strict';

    return {
        setCurrency: function(oEvent) {
            MessageToast.show("Custom handler invoked.");
        }
    };
});
