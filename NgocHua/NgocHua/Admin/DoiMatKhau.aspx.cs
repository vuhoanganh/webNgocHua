﻿using System;
using System.Linq;
using NgocHua.Model;
using NgocHua.Repository;

namespace NgocHua.Admin
{
    public partial class DoiMatKhau : System.Web.UI.Page
    {
        private readonly UserRepository _spRepository = new UserRepository();
        private int _id;

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        
        protected void OnServerClick(object sender, EventArgs e)
        {
            var repo = new UserRepository();

            if (!CheckValidation())
                return;

            var user = repo.GetAll().FirstOrDefault(x => x.IsAdmin == true);
            user.Password = txtPassword.Value;

            repo.Update(user);
            ShowError("Đổi mật khẩu thành công");
        }

        private bool CheckValidation()
        {
            if (string.IsNullOrEmpty(txtPassword.Value))
            {
                ShowError("Vui lòng nhập mật khẩu mới");
                return false;
            }
            if (txtPassword.Value != txtCPassword.Value)
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