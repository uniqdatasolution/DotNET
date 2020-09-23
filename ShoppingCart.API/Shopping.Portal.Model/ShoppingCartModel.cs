using System;
using System.Collections.Generic;
using System.Text;

namespace Shopping.Portal.Model
{
    public class ShoppingCartModel
    {
        public object CustomerId { get; set; } = default(Int64);
        public object ProductId { get; set; } = default(Int64);
        public string ProductName { get; set; }
        public object Quantity { get; set; } = default(int);

    }

  
}
