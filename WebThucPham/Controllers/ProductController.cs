using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using WebThucPham.Models;
using X.PagedList;

namespace WebThucPham.Controllers
{
    public class ProductController : Controller
    {
        private readonly DbMarketsContext _context;
        public ProductController(DbMarketsContext context)
        {
            _context = context;
        }
        [Route("shop.html", Name = ("ShopProduct"))]

        public IActionResult Index(int page=1, int CatID = 0)
        {
            try
            {
                var pageNumber = page;
                //var pageNumber = page == null || page <= 0 ? 1 : page.Value;
                var pageSize = 5;
                //var lsTinDangs = _context.Products.AsNoTracking().OrderBy(x => x.DateCreated);
                //PagedList<Product> models = new PagedList<Product>(lsTinDangs, pageNumber, pageSize);
                //danh mục
                List<Product> lsProducts = new List<Product>();
                if (CatID != 0)
                {
                    lsProducts = _context.Products.AsNoTracking().Where(x => x.CatId == CatID).Include(x => x.Cat).OrderBy(x => x.ProductId).ToList();
                }
                else
                {
                    lsProducts = _context.Products.AsNoTracking().Include(x => x.Cat).OrderBy(x => x.ProductId).ToList();
                }
                //
                PagedList<Product> models = new PagedList<Product>(lsProducts.AsQueryable(), pageNumber, pageSize);

                ViewBag.CurrentCateID = CatID;

                ViewBag.CurrentPage = pageNumber;

                ViewData["DanhMuc"] = new SelectList(_context.Categories, "CatId", "CatName", CatID);

                return View(models);

                //
                //ViewBag.CurrentPage = pageNumber;
                //return View(models);
            }
            catch
            {
                return RedirectToAction("Index", "Home");
            }
        }
        public IActionResult Filtter(int CatID = 0)
        {
            var url = $"/shop.html?CatID={CatID}";
            if (CatID == 0)
            {
                url = $"/shop.html";
            }
            return Json(new { status = "success", redirectUrl = url });
        }

        //
        [Route("danhmuc/{Alias}", Name = ("ListProduct"))]

        public IActionResult List(string Alias, int page = 1)
        {
            try
            {
                var pageSize = 6;
                
                var danhmuc = _context.Categories.AsNoTracking().SingleOrDefault(x => x.Alias == Alias);

                var lsTinDangs = _context.Products
                    .AsNoTracking()
                    .Where(x => x.CatId == danhmuc.CatId)
                    .OrderBy(x => x.DateCreated);
                PagedList<Product> models = new PagedList<Product>(lsTinDangs, page, pageSize);
                ViewBag.CurrentPage = page;
                ViewBag.CurrentCat = danhmuc;
                return View(models);
            }
            catch
            {
                return RedirectToAction("Index", "Home");
            }


        }
        [Route("/{Alias}-{id}.html", Name = ("ProductDetails"))]
        public IActionResult Details(int id)
        {
            try
            {
                var product = _context.Products.Include(x => x.Cat).FirstOrDefault(x => x.ProductId == id);
                if (product == null)
                {
                    return RedirectToAction("Index");
                }
                var lsProduct = _context.Products
                    .AsNoTracking()
                    .Where(x => x.CatId == product.CatId && x.ProductId != id && x.Active == true)
                    .OrderBy(x => x.DateCreated)
                    .ToList();
                ViewBag.SanPham = lsProduct;
                return View(product);
            }
            catch
            {
                return RedirectToAction("Index", "Home");
            }


        }
    }
}
