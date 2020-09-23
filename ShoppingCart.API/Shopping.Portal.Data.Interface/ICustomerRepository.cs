using System;
using System.Collections.Generic;
using Shopping.Portal.Model;

namespace Shopping.Portal.Data.Interface
{
    public interface ICustomerRepository
    {
        DataValidationModel<object> CustometInsertOrUpdate(CustomerIUModel customer);
 

        SuccessModel<LoginResponseModel> ValidateCustomer(LoginMaster loginUser);
       


    }
}
