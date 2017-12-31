using HtmlAgilityPack;
using SinavOlusturma.Data.ModelView;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using System.Web.Mvc;

namespace SinavOlusturma.Web.Controllers
{
    public class ExamController : Controller
    {
        public ActionResult Index()
        {
            ServicePointManager.Expect100Continue = true;
            ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12;
            string site = "https://www.wired.com";

            Uri url = new Uri(site);
            WebClient client = new WebClient();
            client.Encoding = Encoding.UTF8;
            string html = client.DownloadString(url);

            HtmlDocument doc = new HtmlDocument();
            doc.LoadHtml(html);

            var title = doc.DocumentNode.Descendants("h2").ToList(); // Get Titles

            List<Titles> titleList = new List<Titles>();
            Titles newTitle;

            var links = doc.DocumentNode.Descendants("a").ToList();
            List<string> linkList = new List<string>();

            string prev = "";

            foreach (var item in links)
            {
                if (item.Attributes["href"].Value.Contains("story"))
                {
                    if (prev != item.Attributes["href"].Value)
                    {
                        linkList.Add(item.Attributes["href"].Value);
                    }
                    prev = item.Attributes["href"].Value;
                }
            }


            for (int i = 0; i < 5; i++)
            {
                newTitle = new Titles();
                newTitle.Title = title[i].InnerText;
                newTitle.Link = site + linkList[i];

                titleList.Add(newTitle);
            }

            return View(titleList);
        }
    }
}