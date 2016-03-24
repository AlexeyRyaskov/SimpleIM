using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(SimpleIM.Startup))]
namespace SimpleIM
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
