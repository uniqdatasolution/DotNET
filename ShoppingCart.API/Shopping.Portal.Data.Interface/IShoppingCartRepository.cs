using Shopping.Portal.Model;
using System;
using System.Collections.Generic;
using System.Text;

namespace Shopping.Portal.Data.Interface
{
    public interface IShoppingCartRepository
    {
        SuccessModel<object> SaveCartItem(ShoppingCartModel shoppingCartModel);
        SuccessModel<object> RemoveCartItem(int cartId);
        SuccessModel<object> UpdateCartItem(ShoppingCartModel shoppingCartModel);
        SuccessModel<List<ShoppingCartModel>> GetCartList(int customerId);
    }
}
