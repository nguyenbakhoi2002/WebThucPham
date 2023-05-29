using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using WebThucPham.Models;

namespace WebThucPham.Controllers
{
    public class SearchController : Controller
    {
        private readonly DbMarketsContext _context;
        public SearchController(DbMarketsContext context)
        {
            _context = context;
        }
        [HttpPost]
        public IActionResult FindProduct(string keyword)
        {
            List<Product> ls = new List<Product>();
            List<Product> ls1 = new List<Product>();
            ls1 = _context.Products.AsNoTracking()
                                  .Include(a => a.Cat)
                                  .OrderBy(x => x.ProductId)
                                  .ToList();
            if (string.IsNullOrEmpty(keyword) || keyword.Length < 1)
            {
                return PartialView("ListProductsSearchPartial", ls1);
            }
            ls = _context.Products.AsNoTracking()
                                  .Include(a => a.Cat)
                                  .Where(x => x.ProductName.Contains(keyword))
                                  .OrderBy(x => x.ProductName)
                                  .ToList();
            //ls = _context.Products.AsNoTracking()
            //                      .Include(a => a.Cat)
            //                      .Where(x => x.ProductName.Contains(keyword))
            //                      .OrderByDescending(x => x.ProductName)
            //                      .Take(10)
            //                      .ToList();
            if (ls == null)
            {
                return PartialView("ListProductsSearchPartial", null);
            }
            else
            {
                return PartialView("ListProductsSearchPartial", ls);
            }
        }
        public IActionResult Index()
        {
            return View();
        }
    }

}
