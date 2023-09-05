namespace bydMetadata;

entity Currency {
    key Code: String;
    __replication_delete__ : Boolean default false;
    Description: String;    
}