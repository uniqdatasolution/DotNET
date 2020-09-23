using Shopping.Portal.Data.Interface;
using Shopping.Portal.Model;
using HDFC.Core.Logging;
using System;
using System.Collections.Generic;
using System.Text;

namespace Shopping.Portal.Business
{
    public class ShoppingCartManager
    {
        private readonly IShoppingCartRepository _ShoppingCartRepository;
        public ShoppingCartManager(IShoppingCartRepository ShoppingCartRepository)
        {
            _ShoppingCartRepository = ShoppingCartRepository;
        }
        public SuccessModel<List<ShoppingCartModel>> GetCartList(int customerId)
        {
            NLogManager.Info("ShoppingCartManager - GetCartList started");
            return _ShoppingCartRepository.GetCartList(customerId);
        }


        public SuccessModel<object> SaveCartItem(ShoppingCartModel shoppingCartModel)
        {
            NLogManager.Info("ShoppingCartManager - SaveCartItem started");
            return _ShoppingCartRepository.SaveCartItem(shoppingCartModel);
        }

        public SuccessModel<object> UpdateCartItem(ShoppingCartModel shoppingCartModel)
        {
            NLogManager.Info("ShoppingCartManager - SaveCartItem started");
            return _ShoppingCartRepository.UpdateCartItem(shoppingCartModel);
        }

        public SuccessModel<object> RemoveCartItem(int cartId)
        {
            NLogManager.Info("ShoppingCartManager - SaveCartItem started");
            return _ShoppingCartRepository.RemoveCartItem(cartId);
        }





    }
}
