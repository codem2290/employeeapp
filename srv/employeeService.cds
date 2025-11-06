using {employee.demo.app as model } from '../db/employeeModel';

service EmployeeSampleService {
    entity Employees as projection on model.Employees;
    entity FamilyMembers as projection on model.FamilyMembers;
}