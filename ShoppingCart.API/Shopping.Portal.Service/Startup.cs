using HDFC.Core.Common;
using Shopping.Portal.Business;
using HDFC.WebCommon;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.IdentityModel.Tokens;
using Newtonsoft.Json.Serialization;
using System;
using Microsoft.OpenApi.Models;
using Microsoft.Extensions.Hosting;
using Shopping.Portal.Data.Interface;
using HDFC.Portal.Data;
using Shopping.Portal.Data;

namespace Shopping.Portal.Service
{
    public class Startup
    {
        readonly string CorsPolicy = "CorsPolicy";

        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        /// <summary>
        /// This method gets called by the runtime. Use this method to add services to the container.
        /// </summary>
        /// <param name="services"></param>
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddCors(options =>
            {
                options.AddPolicy(CorsPolicy,
                    builder =>
                    {
                        builder
                            .AllowAnyHeader()
                            .AllowAnyMethod()
                            .WithOrigins("http://localhost:3000", "http://localhost:4200")
                            .AllowCredentials();
                    });
            });

            services.AddSingleton<IHttpContextAccessor, HttpContextAccessor>();
            services.AddTransient<ICustomerRepository, CustomerRepository>();            
            services.AddTransient<IProductRepository, ProductRepository>();
            services.AddTransient<ICategoryRepository, CategoryRepository>();
            services.AddTransient<IMasterRepository, MasterRepository>();
            services.AddTransient<IShoppingCartRepository, ShoppingCartRepository>();


            services.AddTransient<CustomerManager>();
            services.AddTransient<ProductManager>();
            services.AddTransient<CategoryManager>();
            services.AddTransient<MasterManager>();
            services.AddTransient<ShoppingCartManager>();
            
            
            //services.AddTransient<PortalManager>();
            //services.AddMemoryCache();
            services.AddSession(options =>
            {
                options.IdleTimeout = TimeSpan.FromMinutes(20);
            });

            services.AddSwaggerGen(c =>
            {
                c.SwaggerDoc("v1", new OpenApiInfo { Title = "Shopping API", Version = "v1" });
            });

            //services.AddCors(options =>
            //{
            //    options.AddPolicy("_myAllowSpecificOrigins",
            //    builder =>
            //    {
            //        builder.AllowAnyOrigin()
            //                            .AllowAnyHeader()
            //                            .AllowAnyMethod();
            //    });
            //});

            //services.AddCors(c =>
            //{
            //    c.AddPolicy("AllowOrigin", options => options.WithOrigins("http://localhost:4200"));
            //});

            services.AddCors();


            services.AddMvc(
                config =>
                {
                    config.Filters.Add(typeof(MvcExceptionHandler));
                    //config.Filters.Add(typeof(WebApiErrorHandlerAttribute));
                }).AddJsonOptions(opt =>
                {
                    var resolver = opt.SerializerSettings.ContractResolver;
                    if (resolver != null)
                    {
                        var res = resolver as DefaultContractResolver;
                        res.NamingStrategy = null;  // <<!-- this removes the camelcasing
                    }
                });
            //JWT Token Start

            services.AddAuthorization(auth =>
            {
                auth.AddPolicy("Bearer", new AuthorizationPolicyBuilder()
                    .AddAuthenticationSchemes(JwtBearerDefaults.AuthenticationScheme‌​)
                    .RequireAuthenticatedUser().Build());
            });

            services.AddAuthentication(options =>
            {
                options.DefaultScheme = JwtBearerDefaults.AuthenticationScheme;
            })
            .AddJwtBearer(options =>
            {
                options.TokenValidationParameters = new TokenValidationParameters
                {
                    ValidateIssuer = true,
                    ValidateAudience = true,
                    ValidateLifetime = true,
                    ValidateIssuerSigningKey = true,
                    ValidIssuer = Configuration["JsonWebToken:Issuer"],
                    ValidAudience = Configuration["JsonWebToken:Issuer"],
                    IssuerSigningKey = new SymmetricSecurityKey(Convert.FromBase64String(Configuration["JsonWebToken:Key"]))
                };
            });
            services.AddMvc();

            //END


            //services.Configure<RequestLocalizationOptions>(options =>
            //{
            //    options.DefaultRequestCulture = new Microsoft.AspNetCore.Localization.RequestCulture("en-US");
            //    CultureInfo cultureInfo = new CultureInfo("en-US");
            //    cultureInfo.DateTimeFormat.ShortDatePattern = ConfigHelper.AppSetting("DateFormat", CommonConstants.AppSettings);
            //    options.SupportedCultures = new List<CultureInfo> { cultureInfo };
            //});
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, Microsoft.AspNetCore.Hosting.IHostingEnvironment env)
        {
            app.UseDefaultFiles();
            app.UseStaticFiles();

            app.UseSwagger();
            app.UseSwaggerUI(c =>
            {
                c.SwaggerEndpoint("/swagger/v1/swagger.json", "Astro API V1");
                c.RoutePrefix = string.Empty;
            });

            NLog.GlobalDiagnosticsContext.Set("defaultConnection", ConfigHelper.AppSetting("PORTAL_LOG", CommonConstants.connectionStrings));

            NLog.LogManager.LoadConfiguration(env.ContentRootPath + "\\NLog.config");
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
                //CultureInfo cultureInfo = new CultureInfo("en-US");
                //cultureInfo.DateTimeFormat.ShortDatePattern = ConfigHelper.AppSetting("DateFormat", CommonConstants.AppSettings);
                //app.UseRequestLocalization(new RequestLocalizationOptions()
                //{
                //    DefaultRequestCulture = new Microsoft.AspNetCore.Localization.RequestCulture(cultureInfo, cultureInfo),
                //    SupportedCultures = new List<CultureInfo>() { cultureInfo },
                //    SupportedUICultures = new List<CultureInfo>() { cultureInfo }
                //});
                app.UseSession();

                //app.UseCors("_myAllowSpecificOrigins");

                app.UseCors(builder => builder
                    .AllowAnyOrigin()
                    .AllowAnyMethod()
                    .AllowAnyHeader()
                    .AllowCredentials());
                app.UseAuthentication();



                //app.UseStaticFiles();// For the wwwroot folder

                //app.UseStaticFiles(new StaticFileOptions
                //{
                //    FileProvider = new PhysicalFileProvider(
                //                Path.Combine(Directory.GetCurrentDirectory(),
                //                "Attachments")),
                //    RequestPath = "/Attachments"
                //});



                ////Enable directory browsing
                //app.UseDirectoryBrowser(new DirectoryBrowserOptions
                //{
                //    FileProvider = new PhysicalFileProvider(
                //                Path.Combine(Directory.GetCurrentDirectory(), "Attachments")),
                //    RequestPath = "/Attachments"
                //});

             

                app.UseMvc();
                app.UseCors(CorsPolicy);
                //app.UseEndpoint(endpoints =>
                //{
                //    endpoints.MapControllers();
                //    endpoints.MapHub<CallHub>("/coolmessages");
                //})
            }
        }
    }
}
