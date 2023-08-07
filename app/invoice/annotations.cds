using adobe as service from '../../srv/service';

annotate service.Clients {
    name        @title: '{i18n>name}';
    lastname    @title: '{i18n>lastname}';
    companyName @title: '{i18n>companyName}';
};

annotate service.Responsibles with {
    name  @title: '{i18n>responsibleName}';
    phone @title: '{i18n>responsiblePhone}';
};

annotate service.EmittedBy with {
    companyName    @title: '{i18n>companyNameEmitted}';
    building         @title: '{i18n>building}';
    address        @title: '{i18n>address}';
    phone          @title: '{i18n>phone}';
    representative @title: '{i18n>representative}';
};

annotate service.Countries with {
    name @title: '{i18n>country}';
};

annotate service.Invoices with {
    invoceNumber @title: '{i18n>invoceNumber}';
    date         @title: '{i18n>date}';
    dueDate      @title: '{i18n>dueDate}';
};

annotate service.InvoiceDetails with {
    detail @title: '{i18n>detail}';
    price  @title: '{i18n>price}';
};


annotate service.Invoices with @UI: {
    HeaderInfo                   : {
        $Type         : 'UI.HeaderInfoType',
        TypeName      : '{i18n>invoice}',
        TypeNamePlural: '{i18n>invoices}',
        TypeImageUrl  : 'sap-icon://monitor-payments',
    },
    Facets                       : [
        {
            $Type : 'UI.ReferenceFacet',
            Target: '@UI.FieldGroup#clientCompanyName'
        },
        {
            $Type : 'UI.ReferenceFacet',
            Target: '@UI.FieldGroup#emittedBy'
        },
        {
            $Type : 'UI.ReferenceFacet',
            Target: '@UI.FieldGroup#invoiceDetail'
        },
        {
            $Type: 'UI.ReferenceFacet',
            Target: '@UI.FieldGroup#bottom'
        }
    ],
    HeaderFacets                 : [{
        $Type : 'UI.ReferenceFacet',
        Target: '@UI.FieldGroup#invoice',
        Label : '{i18n>invoice}'
    }],
    FieldGroup #clientCompanyName: {
        $Type: 'UI.FieldGroupType',
        Label: 'Client detail',
        Data : [
            {Value: client.companyName},
            {Value: client.desc}
        ]
    },
    FieldGroup #emittedBy        : {
        $Type: 'UI.FieldGroupType',
        Data : [
            {Value: emittedBy.companyName},
            {Value: emittedBy.building},
            {Value: emittedBy.address},
            {Value: emittedBy.country.name},
            {Value: emittedBy.phone},
            {Value: emittedBy.representative}
        ]
    },
    FieldGroup #invoice          : {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                Value                    : invoceNumber,
                Criticality              : 5,
                CriticalityRepresentation: #WithoutIcon,
            },
            {Value: date},
            {Value: responsible.name},
            {Value: responsible.lastname},
            {Value: responsible.phone},
        ]
    },
    // ConnectedFields #price   : {
    //     $Type   : 'UI.ConnectedFieldsType',
    //     Template: '{price} {currency}',
    //     Data    : {
    //         price   : {
    //             $Type: 'UI.DataField',
    //             Value: invoiceDetail.price

    //         },
    //         currency: {
    //             $Type: 'UI.DataField',
    //             Value: invoiceDetail.currency.symbol
    //         }
    //     },
    // },
    FieldGroup #invoiceDetail    : {
        $Type: 'UI.FieldGroupType',
        Label: '{i18n>invoiceDetail}',
        Data : [
            {Value: invoiceDetail.detail},
            {Value: invoiceDetail.price},
            {Value: desc},
            {Value: dueDate}
        // {
        //     $Type : 'UI.DataFieldForAnnotation',
        //     Target: '@UI.ConnectedFields#price'
        // }
        //{Value: invoiceDetail.price}
        // {
        //     $Type : 'UI.DataFieldForAnnotation',
        //     Target: '@UI.FieldGroup#currency'
        // }
        ]
    },
    FieldGroup #bottom : {
        $Type : 'UI.FieldGroupType',
        Data:[
            //{Value: }
        ]
    },
    // FieldGroup #currency     : {
    //     $Type: 'UI.FieldGroupType',
    //     Data : [
    //         {Value: invoiceDetail.price},
    //         {Value: ' '},
    //         {Value: invoiceDetail.currency.symbol}
    //     ]
    // },
    LineItem                     : [
        {
            Value                    : invoceNumber,
            Criticality              : 5,
            CriticalityRepresentation: #WithoutIcon
        },
        {Value: client.name},
        {Value: client.lastname},
    ],
};
