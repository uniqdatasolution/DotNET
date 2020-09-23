using HDFC.Core.Common;
using Shopping.Portal.Business;
using Shopping.Portal.Model;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System;

namespace Shopping.Portal.Service.Controllers
{

    [ApiController]
    public class CustomerController : ControllerBase
    {
        private readonly CustomerManager _portalManager;
        //private readonly PortalManager _portalManager;
        public CustomerController(CustomerManager portalManager)
        {
            _portalManager = portalManager;
            // _portalManager = portalManager;
        }

        [HttpPost]
        [Route("CustomerAPI/ValidateCustomer")]
        public SuccessModel<LoginResponseModel> ValidateCustomer(LoginMaster loginUser)
        {
            return _portalManager.ValidateCustomer(loginUser);
        }

     
        [HttpPost]
        [Route("CustomerAPI/CustometInsertOrUpdate")]
        public DataValidationModel<object> CustometInsertOrUpdate(CustomerIUModel customer)
        {
            return _portalManager.CustometInsertOrUpdate(customer);
        }

    
    }
}