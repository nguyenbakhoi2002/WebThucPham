using AspNetCoreHero.ToastNotification.Abstractions;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.VisualStudio.Web.CodeGenerators.Mvc.Controller;
using Newtonsoft.Json.Linq;
using System;
using System.Security.Claims;
using WebThucPham.Extension;
using WebThucPham.Helpper;
using WebThucPham.Models;
using WebThucPham.ModelViews;

namespace WebThucPham.Controllers
{
    [Authorize]
    public class AccountsController : Controller
    {
        private readonly DbMarketsContext _context;
        public INotyfService _notyfService { get; }
        //in giá trị ra console.log
        private readonly ILogger<AccountsController> _logger;
        
        public AccountsController(DbMarketsContext context, INotyfService notyfService, ILogger<AccountsController> logger)
        {
            _context = context;
            _notyfService = notyfService;
            _logger = logger;
        }
        public IActionResult Index()
        {
            return View();
        }
        [HttpGet]
        [AllowAnonymous]
        public IActionResult ValidatePhone(string Phone)
        {
            try
            {
                var khachhang = _context.Customers.AsNoTracking().SingleOrDefault(x => x.Phone.ToLower() == Phone.ToLower());
                if (khachhang != null)
                    return Json(data: "Số điện thoại : " + Phone + "đã được sử dụng");

                return Json(data: true);

            }
            catch
            {
                return Json(data: true);
            }
        }
        [HttpGet]
        [AllowAnonymous]
        public IActionResult ValidateEmail(string Email)
        {
            try
            {
                var khachhang = _context.Customers.AsNoTracking().SingleOrDefault(x => x.Email.ToLower() == Email.ToLower());
                if (khachhang != null)
                    return Json(data: "Email : " + Email + " đã được sử dụng");
                return Json(data: true);
            }
            catch
            {
                return Json(data: true);
            }
        }
        [Route("tai-khoan-cua-toi.html", Name = "Dashboard")]
        public IActionResult Dashboard()
        {
            var taikhoanID = HttpContext.Session.GetString("CustomerId");
            if (taikhoanID != null)
            {
                var khachhang = _context.Customers.AsNoTracking().SingleOrDefault(x => x.CustomerId == Convert.ToInt32(taikhoanID));
                if (khachhang != null)
                {
                    var lsDonHang = _context.Orders
                        .Include(x => x.TransactStatus)
                        .AsNoTracking()
                        .Where(x => x.CustomerId == khachhang.CustomerId)
                        .OrderByDescending(x => x.OrderDate)
                        .ToList();
                    ViewBag.DonHang = lsDonHang;
                    return View(khachhang);
                }

            }
            return RedirectToAction("Login");
        }
        [HttpGet]
        [AllowAnonymous]
        [Route("dang-ky.html", Name = "DangKy")]
        public IActionResult DangkyTaiKhoan()
        {
            return View();
        }

        [HttpPost]
        [AllowAnonymous]
        [Route("dang-ky.html", Name = "DangKy")]
        public async Task<IActionResult> DangkyTaiKhoan(RegisterViewModel taikhoan)
        {
            try
            {
                  //ModelState là một đối tượng trong ASP.NET Core được sử dụng để giám sát trạng thái hợp lệ của các thuộc tính
                  //trên một model khi đang được gửi từ client lên server.
                  //ModelState.IsValid là một thuộc tính boolean, cho biết liệu các thuộc tính trong model có hợp lệ hay không.
                  //Nếu có lỗi được phát hiện trên model, ModelState.IsValid sẽ trả về giá trị false, ngược lại nếu không có lỗi, nó sẽ trả về giá trị true.
                if (ModelState.IsValid)
                {
                    //lấy chuỗi mã hóa bất kỳ
                    string salt = Utilities.GetRandomKey();
                    Customer khachhang = new Customer
                    {
                        FullName = taikhoan.FullName,
                        Phone = taikhoan.Phone.Trim().ToLower(),
                        Email = taikhoan.Email.Trim().ToLower(),
                        //mã hóa
                        Password = (taikhoan.Password + salt.Trim()).ToMD5(),
                        Active = true,
                        Salt = salt,
                        CreateDate = DateTime.Now 
                    };
                    //Account account = new Account
                    //{
                    //    FullName = taikhoan.FullName,
                    //    Phone = taikhoan.Phone.Trim().ToLower(),
                    //    Email = taikhoan.Email.Trim().ToLower(),
                    //    //mã hóa
                    //    Password = (taikhoan.Password + salt.Trim()).ToMD5(),
                    //    Active = true,
                    //    Salt = salt,
                    //    CreateDate = DateTime.Now,
                    //    RoleId = 2
                    //};
                    try
                    {
                        _context.Add(khachhang);
                        //_context.Add(account);
                        await _context.SaveChangesAsync();
                        //Lưu Session MaKh
                        HttpContext.Session.SetString("CustomerId", khachhang.CustomerId.ToString());
                        var taikhoanID = HttpContext.Session.GetString("CustomerId");

                        //Identity
                        var claims = new List<Claim>
                        {
                            new Claim(ClaimTypes.Name,khachhang.FullName),
                            new Claim("CustomerId", khachhang.CustomerId.ToString())
                        };
                        ClaimsIdentity claimsIdentity = new ClaimsIdentity(claims, "login");
                        ClaimsPrincipal claimsPrincipal = new ClaimsPrincipal(claimsIdentity);
                        await HttpContext.SignInAsync(claimsPrincipal);
                        _notyfService.Success("Đăng ký thành công");
                        return RedirectToAction("Dashboard", "Accounts");
                    }
                    catch
                    {
                        _notyfService.Error("Đăng ký thất bại");

                        return RedirectToAction("DangkyTaiKhoan", "Accounts");

                    }
                }
                else
                {
                    return View(taikhoan);
                }
            }
            catch
            {
                return View(taikhoan);
            }
        }
        [AllowAnonymous]
        [Route("dang-nhap.html", Name = "DangNhap")]
        public IActionResult Login(string returnUrl=null)
        {
            var taikhoanID = HttpContext.Session.GetString("CustomerId");
            if (taikhoanID != null)
            {
                return RedirectToAction("Dashboard", "Accounts");
            }
            return View();
        }
        [HttpPost]
        [AllowAnonymous]
        [Route("dang-nhap.html", Name = "DangNhap")]
        public async Task<IActionResult> Login(LoginViewModel customer)
        {
            
            try
            {
                if (ModelState.IsValid)
                {
                    bool isEmail = Utilities.IsValidEmail(customer.UserName);
                    if (!isEmail) return View(customer);
                    //kiểm tra xem khách hàng có tồn tại hay không
                    var khachhang = _context.Customers.AsNoTracking().SingleOrDefault(x => x.Email.Trim() == customer.UserName);
                    

                    if (khachhang == null)
                    {
                        _notyfService.Error("Tài khoản không tồn tại");

                        return RedirectToAction("DangkyTaiKhoan");
                    }
                    string pass = (customer.Password + khachhang.Salt.Trim()).ToMD5();
                    if (khachhang.Password != pass)
                    {
                        _notyfService.Error("Thông tin đăng nhập chưa chính xác");
                        return View(customer);
                    }
                    //kiem tra xem account co bi disable hay khong

                    if (khachhang.Active == false)
                    {
                        _notyfService.Error("tài khoản đã dừng hoạt động");
                        return View(customer);
                    }

                    //Luu Session MaKh
                    HttpContext.Session.SetString("CustomerId", khachhang.CustomerId.ToString());
                    var taikhoanID = HttpContext.Session.GetString("CustomerId");

                    //Identity
                    var claims = new List<Claim>
                    {
                        new Claim(ClaimTypes.Name, khachhang.FullName),
                        new Claim("CustomerId", khachhang.CustomerId.ToString())
                    };
                    ClaimsIdentity claimsIdentity = new ClaimsIdentity(claims, "login");
                    ClaimsPrincipal claimsPrincipal = new ClaimsPrincipal(claimsIdentity);
                    await HttpContext.SignInAsync(claimsPrincipal);
                    _notyfService.Success("Đăng nhập thành công");
                    //return RedirectToAction("Dashboard", "Accounts");
                    if (string.IsNullOrEmpty(customer.ReturnUrl))
                    {
                        return RedirectToAction("Dashboard", "Accounts");
                    }
                    else
                    {
                        return Redirect(customer.ReturnUrl);
                    }
                }
                //else
                //{
                //    _notyfService.Success("lỗi");
                //}
            }
            catch
            {
                _notyfService.Error("đăng nhập thất bại");
                return RedirectToAction("DangkyTaiKhoan", "Accounts");
            }
            return View(customer);
        }
        [HttpGet]
        [Route("dang-xuat.html", Name = "DangXuat")]
        public IActionResult Logout()
        {
            HttpContext.SignOutAsync();
            HttpContext.Session.Remove("CustomerId");
            return RedirectToAction("Index", "Home");
        }

        [HttpPost]
        public IActionResult ChangePassword(ChangePasswordViewModel model)
        {
            try
            {
                var taikhoanID = HttpContext.Session.GetString("CustomerId");
                //kiểm tra xem đã đăng nhập chưa, nếu chưa => trang login
                if (taikhoanID == null)
                {
                    return RedirectToAction("Login", "Accounts");
                }
                if (ModelState.IsValid)
                {
                    //isValid đã bắt lỗi cấu hình trong ChangePasswordViewModel
                    // độ dài tối thiểu
                    // pw và confirm pw phải giống nhau
                    var taikhoan = _context.Customers.Find(Convert.ToInt32(taikhoanID));
                    if (taikhoan == null) return RedirectToAction("Login", "Accounts");
                    var pass = (model.PasswordNow.Trim() + taikhoan.Salt.Trim()).ToMD5();
                    //nếu nhập mật khẩu hiện tại chính xác=> thay đổi mật khẩu
                    if(pass == taikhoan.Password)//dòng thêm
                    {
                        string passnew = (model.Password.Trim() + taikhoan.Salt.Trim()).ToMD5();
                        taikhoan.Password = passnew;
                        _context.Update(taikhoan);
                        _context.SaveChanges();
                        _notyfService.Success("Đổi mật khẩu thành công");
                        return RedirectToAction("Dashboard", "Accounts");
                    }
                }
            }
            catch
            {
                _notyfService.Error("Thay đổi mật khẩu không thành công");
                return RedirectToAction("Dashboard", "Accounts");
            }
            _notyfService.Error("Thay đổi mật khẩu không thành công");
            return RedirectToAction("Dashboard", "Accounts");
        }
    }
}
