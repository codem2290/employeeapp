namespace employee.demo.app;

using {
    managed,
    cuid
} from '@sap/cds/common';

aspect commonfields {
    name    : String(50);
    email   : String(50);
    address : String;
    phone   : String;
}

type age : Integer;

entity Employees : managed, commonfields {
    key employeeId  : UUID;
        // name        : String(50);
        // email       : String(50);
        // address     : String;
        designation : String(50);
        company     : String(50);
        age         : age
}

entity FamilyMembers : managed, cuid, commonfields {
    relationShip : String;
}
