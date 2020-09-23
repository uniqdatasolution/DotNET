using System;
using System.Collections.Generic;
using System.Text;

namespace Shopping.Portal.Model
{
    public class ProductModel
    {
        public Int64 ProductId { get; set; }
        public int CategoryId { get; set; }
        public int SupplierId { get; set; }
        public string ProductName { get; set; }
        public string ProductCode { get; set; }
        public string ProductDescription { get; set; }
        public string ProductImage { get; set; }
        public decimal ProductPrice { get; set; }
        public int AvailableQuantity { get; set; }
        public string UoM { get; set; }
        public decimal Discount { get; set; }
        public decimal Ranking { get; set; }
        public int UnitOnStock { get; set; }
        public int UnitOnOrder { get; set; }
        public bool IsActive { get; set; }
        public bool IsDeleted { get; set; }
        public Int64 CreatedBy { get; set; }
        public DateTime CreatedDate { get; set; }
        public Int64 ModifiedBy { get; set; }
        public DateTime ModifiedDate { get; set; }
        public string SupplierName { get; set; }
        public string CategoryName { get; set; }
    }


}
