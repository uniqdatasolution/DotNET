
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Shopping.Portal.Business;
using Shopping.Portal.Model;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;


// For more information on enabling MVC for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace Shopping.Portal.Service
{
    [ApiController]
    public class CategoryController : ControllerBase
    {

        private readonly CategoryManager _portalManager;
        private readonly IHostingEnvironment _hostingEnvironment;
        private readonly IConfiguration _config;

        public CategoryController(
           CategoryManager portalManager,
               IHostingEnvironment hostingEnvironment,
                   IConfiguration config)
        {
            _portalManager = portalManager;
            _hostingEnvironment = hostingEnvironment;
            _config = config;
        }
        [HttpGet]
        [Route("CategoryAPI/GetCategoryList")]
        public SuccessModel<List<CategoryModel>> GetCategoryList()
        {
            return _portalManager.GetCategoryList();
        }

        [HttpGet]
        [Route("CategoryAPI/GetCategoryDetailsForDropDown")]
        public SuccessModel<CategoryInfoManageModel> GetCategoryDetailsForDP()
        {
            return _portalManager.GetCategoryDetailsForDP();
        }

        [HttpGet]
        [Route("CategoryAPI/GetCategoryById")]
        public SuccessModel<object> GetCategoryById(int categoryId)
        {
            return _portalManager.GetCategoryById(categoryId);
        }

     

        [HttpGet]
        [Route("CategoryAPI/GetCategoryListForCustomer")]
        public SuccessModel<List<CategoryModel>> GetCategoryListForCustomer()
        {
            return _portalManager.GetCategoryListForCustomer();
        }

        [HttpGet]
        [Route("CategoryAPI/GetCategoryByCategoryType")]
        public SuccessModel<object> GetCategoryByCategoryType(int categoryType)
        {
            return _portalManager.GetCategoryByCategoryType(categoryType);
        }


      

    }
}