sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'com/acc/invoice/test/integration/FirstJourney',
		'com/acc/invoice/test/integration/pages/InvoicesList',
		'com/acc/invoice/test/integration/pages/InvoicesObjectPage'
    ],
    function(JourneyRunner, opaJourney, InvoicesList, InvoicesObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('com/acc/invoice') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheInvoicesList: InvoicesList,
					onTheInvoicesObjectPage: InvoicesObjectPage
                }
            },
            opaJourney.run
        );
    }
);