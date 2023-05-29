using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;

namespace WebThucPham.Models.Authenlication
{
    public class Authentication : ActionFilterAttribute
    {
        public override void OnActionExecuted(ActionExecutedContext context)
        {
            if(context.HttpContext.Session.GetString("DN") == null)
            {
                context.Result = new RedirectToRouteResult(new RouteValueDictionary
                {
                    {"area", "admin" },
                    {"Controller" ,"DangNhap" },
                    {"Action" ,"adminlogin" }
                });
            }


        }
    }
}
