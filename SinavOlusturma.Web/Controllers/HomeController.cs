using SinavOlusturma.Business;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SinavOlusturma.Web.Controllers
{
    public class HomeController : Controller
    {
        ExamManager examManager = new ExamManager();

        public ActionResult Index()
        {
            return View(examManager.GetAllExam());
        }

        public ActionResult DeleteExam(Guid examID)
        {
            examManager.DeleteExamByID(examID);
            return RedirectToAction("Index");
        }
    }
}