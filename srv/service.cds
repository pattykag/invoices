using {adobeforms as my} from '../db/data-model';

service adobe {
    entity Clients      as projection on my.Clients;
    entity Responsibles as projection on my.Responsibles;
    entity EmittedBy    as projection on my.EmittedBy;
    entity Invoices     as projection on my.Invoices;
}
