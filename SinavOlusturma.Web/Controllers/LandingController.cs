using SinavOlusturma.Business;
using SinavOlusturma.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Mvc;

namespace SinavOlusturma.Web.Controllers
{
    public class LandingController : Controller
    {
        UserManager userManager = new UserManager();

        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public JsonResult LogIn(User user)
        {
            string result = userManager.LogIn(user);

            if (result == "Parola hatalı!" || result == "Kullanıcı bulunamadı!")
            {
                return Json(result);
            }
            else
            {
                Response.Cookies["UserId"].Value = result.ToString();
                Response.Cookies["UserId"].Expires = DateTime.Now.AddDays(1);

                HttpCookie lastVisit = new HttpCookie("LastVisit", DateTime.Now.ToString());
                lastVisit.Expires = DateTime.Now.AddDays(1);
                Response.Cookies.Add(lastVisit);

                return Json("True");
            }
        }

        public ActionResult LogOut()
        {
            Response.Cookies["UserId"].Value = null;
            Response.Cookies["UserId"].Expires = DateTime.Now.AddDays(-1);

            HttpCookie lastVisit = new HttpCookie("LastVisit", DateTime.Now.ToString());
            lastVisit.Expires = DateTime.Now.AddDays(1);
            Response.Cookies.Add(lastVisit);

            return RedirectToAction("Index", "Landing");
        }
    }
}