const cds = require('@sap/cds');
const { message } = require('@sap/cds/lib/log/cds-error');
const { INSERT } = require('@sap/cds/lib/ql/cds-ql');
const { target } = require('@sap/cds/lib/ql/cds.ql-infer');
class EmployeeSampleService extends cds.ApplicationService {
    init() {
        let { Employees, LogEntryTable } = this.entities;
        this.before('UPDATE', Employees.drafts, (req) => {
            debugger;
            if(req.data?.email){
                let expression = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
                let output = expression.test(req.data?.email);
                if(output === false){
                    req.error({
                        target: 'email',
                        message: "Invalid Email Address"
                    });
                }
            }
        });

        this.on('READ', Employees,async (req) => {
            let data = await cds.run(req.query);
            return data;
        });

        this.after('CREATE', Employees.drafts, async (req) => {
            debugger;
        });

        this.after('CREATE', Employees, async (req) => {
           let created = await INSERT.into(LogEntryTable).entries([{
            desciption: "Employee entry added",
            tableName: "Employees"
           }]);
        });

        return super.init();
    }
}

module.exports = EmployeeSampleService;