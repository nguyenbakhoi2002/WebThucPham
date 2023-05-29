using AspNetCoreHero.ToastNotification.Abstractions;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Security.Claims;
using WebThucPham.Areas.Admin.Models;
using WebThucPham.Extension;
using WebThucPham.Models;
using WebThucPham.Models.Authenlication;

namespace WebThucPham.Areas.Admin.Controllers
{
    [Area("Admin")]
    
    //[Authorize]
    public class HomeController : Controller
    {
        [Authentication]
        public IActionResult Index()
        {
            return View();
        }
        
        
    }
}
