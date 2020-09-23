using System;
using System.Collections.Generic;
using System.Text;

namespace Shopping.Portal.Model
{
      
        public class CustomerIUModel
    {
        public object CustomerId { get; set; } = default(int);
        public object LoginUserName { get; set; }
        public string LoginPassword { get; set; }
        public object FirstName { get; set; }
        public object LastName { get; set; }
        public object Address1 { get; set; } = string.Empty;
        public object Address2 { get; set; } = string.Empty;
        public object CityId { get; set; } = default(int);
        public object StateId { get; set; } = default(int);
        public object CountryId { get; set; } = default(int);
        public object PinCode { get; set; } = string.Empty;
        public object ContactEmail { get; set; } = string.Empty;
        public object ContactMobile { get; set; } = string.Empty;
        public object WalletBalance { get; set; } = default(decimal);
        public object NoOfMinChat { get; set; } = default(decimal);
        public object NoOfMinCall { get; set; } = default(decimal);
        public object IsActive { get; set; } = true;
        public object IsDeleted { get; set; } = false;
        public object CreatedBy { get; set; } = default(int);
        public object CreatedDate { get; set; } = DateTime.Now;
        public object ModifiedBy { get; set; } = default(int);
        public object ModifiedDate { get; set; } = DateTime.Now;

        public object SocialAppId { get; set; }

        public object SocialAppType { get; set; }

    }
}
