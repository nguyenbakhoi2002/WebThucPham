using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using AspNetCoreHero.ToastNotification.Abstractions;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using WebThucPham.Areas.Admin.Models;
using WebThucPham.Extension;
using WebThucPham.Helpper;
using WebThucPham.Models;
using WebThucPham.Models.Authenlication;
using X.PagedList;

namespace WebThucPham.Areas.Admin.Controllers
{
    [Area("Admin")]
    [Authentication]
    [Authentication_Ad]

    public class AdminAccountsController : Controller
    {
        private readonly DbMarketsContext _context;
        public INotyfService _notyfService { get; }
        public AdminAccountsController(DbMarketsContext context, INotyfService notyfService)
        {
            _context = context;
            _notyfService = notyfService;
        }

        // GET: Admin/AdminAccounts
        public async Task<IActionResult> Index(int? page)
        {
            ViewData["QuyenTruyCap"] = new SelectList(_context.Roles, "RoleId", "Description");
            //
            List<SelectListItem> lsTrangThai = new List<SelectListItem>();
            lsTrangThai.Add(new SelectListItem() { Text = "Active", Value = "1" });
            lsTrangThai.Add(new SelectListItem() { Text = "Block", Value = "0" });
            ViewData["lsTrangThai"] = lsTrangThai;
            //
            var pageSize = 20;
            var pageNumber = page == null || page < 0 ? 1 : page.Value;
            var lstAccounts = _context.Accounts.Include(a => a.Role).AsNoTracking().OrderBy(x => x.AccountId);
            PagedList<Account> models = new PagedList<Account>(lstAccounts, pageNumber, pageSize);

            ViewBag.CurrentPage = pageNumber;
            return View(models);
            //
            
            //var dbMarketsContext = _context.Accounts.Include(a => a.Role);
            //return View(await dbMarketsContext.ToListAsync());
        }

        // GET: Admin/AdminAccounts/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null || _context.Accounts == null)
            {
                return NotFound();
            }

            var account = await _context.Accounts
                .Include(a => a.Role)
                .FirstOrDefaultAsync(m => m.AccountId == id);
            if (account == null)
            {
                return NotFound();
            }

            return View(account);
        }

        // GET: Admin/AdminAccounts/Create
        public IActionResult Create()
        {
            ViewData["QuyenTruyCap"] = new SelectList(_context.Roles, "RoleId", "RoleName");
            //ViewData["RoleId"] = new SelectList(_context.Roles, "RoleId", "RoleId");
            return View();
        }

        // POST: Admin/AdminAccounts/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("AccountId,Phone,Email,Password,Salt,Active,FullName,RoleId,LastLogin,CreateDate")] Account account)
        {
            ///
            if (ModelState.IsValid)
            {
                string salt = Utilities.GetRandomKey();
                account.Salt = salt;
                account.Password = (account.Password + salt.Trim()).ToMD5();
                account.CreateDate = DateTime.Now;
                //account.RoleId = 1;
                //
                _context.Add(account);
                await _context.SaveChangesAsync();
                _notyfService.Success("tạo mới thành công");
                return RedirectToAction(nameof(Index));
            }
            _notyfService.Error("tạo mới thất bại");
            ViewData["QuyenTruyCap"] = new SelectList(_context.Roles, "RoleId", "RoleName", account.RoleId);
            return View(account);
        }
        //thay đổi mật khẩu
        public IActionResult ChangePassword()
        {
            ViewData["QuyenTruyCap"] = new SelectList(_context.Roles, "RoleId", "RoleName");
            return View();
        }

        [HttpPost]
        public IActionResult ChangePassword(ChangePasswordViewModel model)
        {
            if (ModelState.IsValid)
            {
                var taikhoan = _context.Accounts.AsNoTracking().SingleOrDefault(x => x.Email == model.Email);
                if (taikhoan == null) return RedirectToAction("Login", "Accounts");
                var pass = (model.PasswordNow.Trim() + taikhoan.Salt.Trim()).ToMD5();
                {
                    string passnew = (model.Password.Trim() + taikhoan.Salt.Trim()).ToMD5();
                    taikhoan.Password = passnew;
                    taikhoan.LastLogin = DateTime.Now;
                    _context.Update(taikhoan);
                    _context.SaveChanges();
                    _notyfService.Success("Đổi mật khẩu thành công");
                    return RedirectToAction("Login", "Accounts", new { Area = "Admin" });
                }
            }


            return View();
        }
        // GET: Admin/AdminAccounts/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null || _context.Accounts == null)
            {
                return NotFound();
            }

            var account = await _context.Accounts.FindAsync(id);
            if (account == null)
            {
                return NotFound();
            }
            ViewData["QuyenTruyCap"] = new SelectList(_context.Roles, "RoleId", "RoleName", account.RoleId);
            return View(account);
        }

        // POST: Admin/AdminAccounts/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("AccountId,Phone,Email,Password,Salt,Active,FullName,RoleId,LastLogin,CreateDate")] Account account)
        {
            if (id != account.AccountId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(account);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!AccountExists(account.AccountId))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }
            ViewData["QuyenTruyCap"] = new SelectList(_context.Roles, "RoleId", "RoleName", account.RoleId);
            return View(account);
        }

        // GET: Admin/AdminAccounts/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null || _context.Accounts == null)
            {
                return NotFound();
            }

            var account = await _context.Accounts
                .Include(a => a.Role)
                .FirstOrDefaultAsync(m => m.AccountId == id);
            if (account == null)
            {
                return NotFound();
            }

            return View(account);
        }

        // POST: Admin/AdminAccounts/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            if (_context.Accounts == null)
            {
                return Problem("Entity set 'DbMarketsContext.Accounts'  is null.");
            }
            var account = await _context.Accounts.FindAsync(id);
            if (account != null)
            {
                _context.Accounts.Remove(account);
            }
            
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool AccountExists(int id)
        {
          return (_context.Accounts?.Any(e => e.AccountId == id)).GetValueOrDefault();
        }
    }
}
