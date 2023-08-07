sap.ui.define(['sap/fe/test/ObjectPage'], function(ObjectPage) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ObjectPage(
        {
            appId: 'com.acc.invoice',
            componentId: 'InvoicesObjectPage',
            entitySet: 'Invoices'
        },
        CustomPageDefinitions
    );
});