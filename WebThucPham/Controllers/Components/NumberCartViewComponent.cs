using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using WebThucPham.Extension;
using WebThucPham.ModelViews;

namespace WebThucPham.Controllers.Components
{
    public class NumberCartViewComponent : ViewComponent
    {
        public IViewComponentResult Invoke()
        {
            var cart = HttpContext.Session.Get<List<CartItem>>("GioHang");
            return View(cart);
        }
    }
}
