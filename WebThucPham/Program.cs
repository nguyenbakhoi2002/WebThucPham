using AspNetCoreHero.ToastNotification;
using AspNetCoreHero.ToastNotification.Notyf.Models;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.EntityFrameworkCore;
using System.Text.Encodings.Web;
using System.Text.Unicode;
using WebThucPham.Models;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddControllersWithViews();

// add thêm
builder.Services.AddNotyf(config => { config.DurationInSeconds = 10; config.IsDismissable = true; config.Position = NotyfPosition.BottomRight; });
//
var connectionString = builder.Configuration.GetConnectionString("DbMarketsContext");
builder.Services.AddDbContext<DbMarketsContext>(x => x.UseSqlServer(connectionString));
//builder.Services.AddScoped<PhanLoaiRepository, PhanLoai>();

//AddSession
builder.Services.AddSession();


//
builder.Services.AddAuthentication(CookieAuthenticationDefaults.AuthenticationScheme).AddCookie(p =>
{
    p.Cookie.Name = "UserLoginCookie";
    p.ExpireTimeSpan = TimeSpan.FromDays(1);
    p.AccessDeniedPath = "/";
    //
    p.LoginPath = "/dang-nhap.html";
    
    //p.AccessDeniedPath = "/";
});
//


// tiếng việt
builder.Services.AddSingleton<HtmlEncoder>(HtmlEncoder.Create(allowedRanges: new[] { UnicodeRanges.All }));
// end add thêm
var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}

app.UseHttpsRedirection();
app.UseStaticFiles();


//
app.UseSession();
//
app.UseRouting();
//
app.UseAuthentication();
//
app.UseAuthorization();

app.UseEndpoints(endpoints =>
{
    endpoints.MapControllerRoute(
      name: "areas",
      pattern: "{area:exists}/{controller=Home}/{action=Index}/{id?}"
    );
});
app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}");

app.Run();
