using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(ERPWeb.Startup))]
namespace ERPWeb
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
