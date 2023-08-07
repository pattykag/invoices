using {
    managed,
    cuid,
    Country,
    Currency
} from '@sap/cds/common';

namespace adobeforms;

entity Clients : cuid {
    name        : String(30);
    lastname    : String(30);
    desc        : String(255);
    phone       : String(20);
    country     : Country;
    companyName : String(255);
}

entity EmittedBy : cuid {
    companyName    : String(255);
    address        : String(255);
    representative : String(100);
    country        : Country;
    phone          : String(20);
    building       : String(255);
    account        : String(50);
    payment        : Composition of many Payments
                         on payment.emittedBy = $self;
}

@cds.autoexpose
entity Payments : cuid {
    bank        : String(30);
    branch      : String(255);
    accountType : String(255);
    adress      : String(255);
    emittedBy   : Association to EmittedBy;
}

entity Invoices : managed { // ?$expand=invoiceDetail
    key invoceNumber  : String(20);
        desc          : String(255);
        //note2         : String(255);
        date          : Date;
        dueDate       : Date;
        client        : Association to many Clients;
        emittedBy     : Association to many EmittedBy;
        responsible   : Association to Responsibles;
        invoiceDetail : Composition of many InvoiceDetails
                            on invoiceDetail.invoice = $self;
}

@cds.autoexpose
entity InvoiceDetails : cuid { // to be accessed through Invoices only
    detail   : String(255);
    price    : Decimal(7, 2);
    currency : Currency;
    invoice  : Association to Invoices;
}

entity Responsibles : cuid {
    name     : String(30);
    lastname : String(30);
    phone    : String(20);
}
