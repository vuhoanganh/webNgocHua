using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(NgocHua.Startup))]
namespace NgocHua
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
