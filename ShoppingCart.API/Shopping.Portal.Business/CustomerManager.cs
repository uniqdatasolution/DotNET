using HDFC.Core.Logging;
using Shopping.Portal.Data.Interface;
using Shopping.Portal.Model;
using System.Collections.Generic;

namespace Shopping.Portal.Business
{
    public class CustomerManager
    {
        private readonly ICustomerRepository _portalRepository;
        public CustomerManager(ICustomerRepository portalRepository)
        {
            _portalRepository = portalRepository;
        }
       
        public DataValidationModel<object> CustometInsertOrUpdate(CustomerIUModel customer)
        {
            NLogManager.Info("CustomerManager - Customer Insert Or Update");
            return _portalRepository.CustometInsertOrUpdate(customer);
        }

       

        public SuccessModel<LoginResponseModel> ValidateCustomer(LoginMaster loginUser)
        {
            NLogManager.Info("CustomerManager - Validating customer");
            return _portalRepository.ValidateCustomer(loginUser);
        }

    }
}
