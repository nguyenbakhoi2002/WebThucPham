﻿using System.ComponentModel.DataAnnotations;

namespace WebThucPham.ModelViews
{
    public class ChangePasswordViewModel
    {
        //các attribute Display, Required, MinLength, Compare đều được định nghĩa trong namespace System.ComponentModel.DataAnnotations của .NET Framework
        [Key]
        public int CustomerId { get; set; }

        [Display(Name = "Mật khẩu hiện tại")]
        [Required(ErrorMessage = "Vui lòng nhập mật khẩu hiện tại")]
        public string PasswordNow { get; set; }

        [Display(Name = "Mật khẩu mới")]
        [Required(ErrorMessage = "Vui lòng nhập mật khẩu mới")]
        [MinLength(5, ErrorMessage = "Bạn cần đặt mật khẩu tối thiểu 5 ký tự")]
        public string Password { get; set; }

        [MinLength(5, ErrorMessage = "Bạn cần đặt mật khẩu tối thiểu 5 ký tự")]
        [Display(Name = "Nhập lại mật khẩu")]
        [Compare("Password", ErrorMessage = "Nhập lại mật khẩu không đúng")]
        public string ConfirmPassword { get; set; }
    }
}
