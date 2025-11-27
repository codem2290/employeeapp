sap.ui.define([
    "sap/m/MessageToast"
], function(MessageToast) {
    'use strict';

    return {
        /**
         * Generated event handler.
         *
         * @param oContext the context of the page on which the event was fired. `undefined` for list report page.
         * @param aSelectedContexts the selected contexts of the table rows.
         */
        onActivateEmployee: function(oContext, aSelectedContexts) {
            var action = "setEmployeeStatusActivated";
            var id = oContext.getObject().employeeId;
            var oParameters = {
                model: this.getModel(),
                parameterValues: [{
                    "name": "empID",
                    "value": id
                }],
                skipParameterDialog: true
            };
            this.editFlow.invokeAction(action, oParameters).then(function(response){
                this._controller.getExtensionAPI().refresh();
            }.bind(this)).catch(function(error){

            });
        }
    };
});
