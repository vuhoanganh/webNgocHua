using System;
using System.Linq;
using NgocHua.Model;
using NgocHua.Repository;

namespace NgocHua
{
    public partial class TaoTaiKhoan : System.Web.UI.Page
    {
        private readonly UserRepository _spRepository = new UserRepository();
        private int _id;

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        
        protected void OnServerClick(object sender, EventArgs e)
        {
            var repo = new UserRepository();

            var user = new TaiKhoan
            {
                Address = txtAddress.Value,
                Description = txtAddress.Value,
                Email = txtEmail.Value,
                Fullname = txtTen.Value,
                IsAdmin = false,
                Password = txtPassword.Value,
                Phone = txtPhone.Value,
                Username = txtUsername.Value.ToLower()
            };
            if (!CheckValidation(user, repo))
                return;

            repo.Add(user);
            ShowError("Tạo tài khoản thành công");
        }

        private bool CheckValidation(TaiKhoan user, UserRepository repo)
        {
            if (string.IsNullOrEmpty(user.Email))
            {
                ShowError("Vui lòng nhập địa chỉ Email");
                return false;
            }
            if (string.IsNullOrEmpty(user.Username))
            {
                ShowError("Vui lòng nhập tên đăng nhập");
                return false;
            }
            var checkUser = repo.FindByName(user.Username);
            if (checkUser != null && checkUser.Id > 0)
            {
                ShowError("Tên đăng nhập đã có người sử dụng. Vui lòng chọn tên khác");
                return false;
            }
            if (string.IsNullOrEmpty(user.Password))
            {
                ShowError("Vui lòng nhập mật khẩu");
                return false;
            }
            if (string.IsNullOrEmpty(user.Fullname))
            {
                ShowError("Vui lòng nhập Họ tên");
                return false;
            }
            if (user.Password != txtCPassword.Value)
            {
                ShowError("Mật khẩu xác nhận không giống nhau. Vui lòng nhập lại.");
                return false;
            }
            
            return true;
        }

        public void ShowError(string message)
        {
            RadWindowManager1.RadAlert(message, null, 120, "Message", null, "/Images/infoAlert.png");
        }

    }
}