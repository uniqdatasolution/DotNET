using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Shopping.Portal.Business;
using Shopping.Portal.Model;
using HDFC.Core.Common;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;



// For more information on enabling MVC for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace Shopping.Portal.Service.Controllers
{
    [ApiController]
    public class ProductController : ControllerBase
    {


        private readonly ProductManager _productManager;
        private readonly IHostingEnvironment _hostingEnvironment;
        private readonly IConfiguration _config;

        public ProductController(
            ProductManager productManager,
            IHostingEnvironment hostingEnvironment,
            IConfiguration config
            )
        {
            _productManager = productManager;
            _hostingEnvironment = hostingEnvironment;
            _config = config;
        }





        [HttpGet]
        [Route("ProductAPI/GetProductById/{productId}")]
        public SuccessModel<object> GetProductById(int productId)
        {
            return _productManager.GetProductById(productId);
        }


    
        [HttpGet]
        [Route("ProductAPI/GetProductByCategory")]
        public SuccessModel<object> GetProductByCategory(int categoryId)
        {
            return _productManager.GetProductByCategory(categoryId);
        }
    }
}
