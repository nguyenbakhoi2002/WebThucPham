using AspNetCoreHero.ToastNotification.Abstractions;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Security.Claims;
using WebThucPham.Areas.Admin.Models;
using WebThucPham.Extension;
using WebThucPham.Models;
using WebThucPham.ModelViews;
using LoginViewModel = WebThucPham.Areas.Admin.Models.LoginViewModel;

namespace WebThucPham.Areas.Admin.Controllers
{
    [Area("Admin")]

    public class DangNhapController : Controller
    {
        private readonly DbMarketsContext _context;
        public INotyfService _notyfService { get; }
        public DangNhapController(DbMarketsContext context, INotyfService notyfService)
        {
            _context = context;
            _notyfService = notyfService;
        }
        public IActionResult Index()
        {
            return View();
        }
        [AllowAnonymous]
        [Route("login.html", Name = "Login")]
        public IActionResult AdminLogin(string returnUrl = null)
        {
            
            ViewBag.tb = "Bạn cần đăng nhập bằng tài khoản quản trị";
            if(HttpContext.Session.GetString("DN")== "user")
            {
                ViewBag.tb = "Tài khoản của bạn không thể truy cập trang web," +
                            "nếu muốn tiếp tục bạn cần đăng nhập với tư cách là quản trị nếu muốn vào trang này";
            }

           var taikhoanID = HttpContext.Session.GetString("AccountId");
            if (taikhoanID != null) return RedirectToAction("Index", "Home", new { Area = "Admin" });
            ViewBag.ReturnUrl = returnUrl;
            return View();
        }
        [HttpPost]
        [AllowAnonymous]
        [Route("login.html", Name = "Login")]
        public async Task<IActionResult> AdminLogin(LoginViewModel model)
        {
            try
            {
                
                if (ModelState.IsValid)
                {

                    
                    Account kh = _context.Accounts.Include(p => p.Role).SingleOrDefault(p => p.Email.ToLower() == model.UserName.ToLower().Trim());

                    if (kh == null)
                    {
                        _notyfService.Error("Đăng nhập thất bại");
                        ViewBag.Error = "Thông tin đăng nhập chưa chính xác";
                        return View(model);

                    }
                    string pass = (model.Password + kh.Salt.Trim()).ToMD5();
                    // + kh.Salt.Trim()
                    if (kh.Password.Trim() != pass)
                    {
                        ViewBag.Error = "Thông tin đăng nhập chưa chính xác";
                        return View(model);
                    }
                    //đăng nhập thành công

                    //ghi nhận thời gian đăng nhập
                    kh.LastLogin = DateTime.Now;
                    _context.Update(kh);
                    await _context.SaveChangesAsync();
                    var role = kh.RoleId;
                    if (role == 2)
                    {
                        HttpContext.Session.SetString("DN", "user");
                        
                        _notyfService.Success("bạn đã đăng nhập với tư cách là nhân viên kĩ thuật");
                        return RedirectToAction("Index", "Home", new { area = "admin" });
                    }
                    else
                    {
                        HttpContext.Session.SetString("DN", kh.FullName.ToString());
                        HttpContext.Session.SetString("DNAd", kh.Role.RoleName.ToString());
                        _notyfService.Success("bạn đã đăng nhập với tư cách là Quản trị viên");
                        return RedirectToAction("Index", "Home", new { area = "admin" });

                    }

                    var taikhoanID = HttpContext.Session.GetString("AccountId");
                    //identity
                    //luuw seccion Makh
                    HttpContext.Session.SetString("AccountId", kh.AccountId.ToString());

                    //identity
                    //var userClaims = new List<Claim>
                    //{
                    //    new Claim(ClaimTypes.Name, kh.FullName),
                    //    new Claim(ClaimTypes.Email, kh.Email),
                    //    new Claim("AccountId", kh.AccountId.ToString()),
                    //    new Claim("RoleId", kh.RoleId.ToString()),
                    //    new Claim(ClaimTypes.Role, kh.Role.RoleName)
                    //};
                    //var grandmaIdentity = new ClaimsIdentity(userClaims, "User Identity");
                    //var userPrincipal = new ClaimsPrincipal(new[] { grandmaIdentity });
                    //await HttpContext.SignInAsync(userPrincipal);



                    //return RedirectToAction("Index", "Home", new { Area = "Admin" });
                }
            }
            catch
            {
                return RedirectToAction("adminlogin", "dangnhap", new { Area = "Admin" });
            }
            return RedirectToAction("AdminLogin", "dangnhap", new { Area = "Admin" });
        }
        //[Route("logout.html", Name = "Logout")]
        public IActionResult AdminLogout()
        {
            try
            {
                HttpContext.Session.Clear();

                HttpContext.SignOutAsync();

                return RedirectToAction("AdminLogin", "dangnhap", new { Area = "Admin" });
            }
            catch
            {
                return RedirectToAction("AdminLogin", "dangnhap", new { Area = "Admin" });
            }
        }
    }
}
