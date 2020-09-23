
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
    public class MasterController : ControllerBase
    {

        private readonly MasterManager _portalManager;
        private readonly IHostingEnvironment _hostingEnvironment;
        private readonly IConfiguration _config;

        public MasterController(
           MasterManager portalManager,
               IHostingEnvironment hostingEnvironment,
                   IConfiguration config)
        {
            _portalManager = portalManager;
            _hostingEnvironment = hostingEnvironment;
            _config = config;
        }
        [HttpGet]
        [Route("MasterAPI/GetColorList")]
        public SuccessModel<List<ColorMaster>> GetColorList()
        {
            return _portalManager.GetColorList();
        }

        [HttpGet]
        [Route("MasterAPI/GetSizeList")]
        public SuccessModel<List<SizeMaster>> GetSizeList()
        {
            return _portalManager.GetSizeList();
        }

        [HttpGet]
        [Route("MasterAPI/GetBrandList")]
        public SuccessModel<List<BrandMaster>> GetBrandList()
        {
            return _portalManager.GetBrandList();
        }



    }
}