using System;
using Repository.Repository;

namespace NgocHua.Admin
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session.Remove("User");
        }

        protected void btnLogin_OnServerClick(object sender, EventArgs e)
        {
            var userRepo = new UserRepository();
            var user = userRepo.Login(inputEmail1.Value, inputPassword1.Value);
            if (user == null || user.Id == 0)
                return;

            Session["User"] = user.Id.ToString();
            Response.Redirect("Home");
        }
    }
}