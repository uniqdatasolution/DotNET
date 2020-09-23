
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
    public class ShoppingCartController : ControllerBase
    {

        private readonly ShoppingCartManager _portalManager;
        private readonly IHostingEnvironment _hostingEnvironment;
        private readonly IConfiguration _config;

        public ShoppingCartController(
           ShoppingCartManager portalManager,
               IHostingEnvironment hostingEnvironment,
                   IConfiguration config)
        {
            _portalManager = portalManager;
            _hostingEnvironment = hostingEnvironment;
            _config = config;
        }
        [HttpGet]
        [Route("ShoppingCartAPI/GetCartList")]
        public SuccessModel<List<ShoppingCartModel>> GetCartList(int customerId)
        {
            return _portalManager.GetCartList(customerId);
        }

        [HttpPost]
        [Route("ShoppingCartAPI/SaveCartItem")]
        public SuccessModel<object> SaveCartItem(ShoppingCartModel shoppingCartModel)
        {
            return _portalManager.SaveCartItem(shoppingCartModel);
        }

        [HttpPost]
        [Route("ShoppingCartAPI/UpdateCartItem")]
        public SuccessModel<object> UpdateCartItem(ShoppingCartModel shoppingCartModel)
        {
            return _portalManager.UpdateCartItem(shoppingCartModel);
        }

        [HttpPost]
        [Route("ShoppingCartAPI/RemoveCartItem")]
        public SuccessModel<object> RemoveCartItem(int cartId)
        {
            return _portalManager.RemoveCartItem(cartId);
        }

      
    }
}