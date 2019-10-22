using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;

namespace MyCalendar
{
    /// <summary>
    /// Visit için özet açıklama
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // Bu Web Hizmeti'nin, ASP.NET AJAX kullanılarak komut dosyasından çağrılmasına, aşağıdaki satırı açıklamadan kaldırmasına olanak vermek için.
    [System.Web.Script.Services.ScriptService]
    public class Visit : System.Web.Services.WebService
    {
        [WebMethod(EnableSession = true)]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public string FirmVisitUpdateEventResize(string id, string milliseconds)
        {
            string retval = "Yetkisiz İşlem";
            using (CEntities db = new CEntities())
            {
                int ID = Convert.ToInt32(id);
                Meeting rec = db.Meeting.Where(a => a.Id == ID).FirstOrDefault();
                if (rec != null)
                {
                    rec.DateEnd = rec.DateEnd.AddMilliseconds(Convert.ToDouble(milliseconds));
                    db.SaveChanges();
                    retval = "OK";
                }
                else
                {
                    retval = "Kayıt bulunamadı!";
                }
                return retval;
            }
        }




        [WebMethod(EnableSession = true)]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public string FirmVisitUpdateEventDrop(string id, string milliseconds, string days)
        {
            string retval = "Yetkisiz İşlem";
            using (CEntities db = new CEntities())
            {

                int mId = Convert.ToInt32(id);
                //List<Meeting> list = db.Meeting.Where(a => a.CustomerId == Convert.ToInt32(id)).ToList();
                Meeting m = db.Meeting.Where(a => a.Id == mId).FirstOrDefault();
                if (m != null)
                {

                    m.DateStart = m.DateStart.AddDays(Convert.ToInt32(days)).AddMilliseconds(Convert.ToDouble(milliseconds));
                    m.DateEnd = m.DateEnd.AddDays(Convert.ToInt32(days)).AddMilliseconds(Convert.ToDouble(milliseconds));
                    db.SaveChanges();
                    retval = "OK";
                }
                else
                {
                    retval = "Kayıt bulunamadı!";
                }
                return retval;
            }
        }

        [WebMethod(EnableSession = true)]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public List<NCalendar> GetVisitCalendar(string dateStart, string dateEnd)
        {
            List<NCalendar> retval = new List<NCalendar>();
            DateTime? dStart = null;
            DateTime? dEnd = null;
            if (!string.IsNullOrEmpty(dateStart))
            {
                dStart = Convert.ToDateTime(dateStart);
            }
            if (!string.IsNullOrEmpty(dateEnd))
            {
                dEnd = Convert.ToDateTime(dateEnd).AddDays(1);
            }


            List<VW_Meeting> list = null;
            using (CEntities db = new CEntities())
            {
                int UId = Convert.ToInt32(Session["UserID"]);
                DateTime ds = Convert.ToDateTime(dateStart);
                DateTime de = Convert.ToDateTime(dateEnd);
                list = db.VW_Meeting.Where(a => a.UserId == UId && a.DateStart >= ds && a.DateEnd <= de).ToList();
                foreach (var item in list)
                {
                    NCalendar tmp = new NCalendar();
                    tmp.id = item.Id;
                    tmp.title = item.CustomerName;
                    tmp.start = item.DateStart.ToString("yyyy-MM-dd HH:mm");
                    tmp.end = item.DateEnd.ToString("yyyy-MM-dd HH:mm");
                    tmp.editable = true;
                    if (item.MeetingDoneId == 1)
                    {
                        tmp.color = "#FFB752";//TURUNCU
                    }
                    else if (item.MeetingDoneId == 2)
                    {
                        tmp.color = "#87B87F";//YEŞİL
                    }
                    else
                    {
                        tmp.color = "#B74635";//KIRMIZI
                    }
                    retval.Add(tmp);
                }
            }
            return retval;
        }

        [WebMethod(EnableSession = true)]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public string NewVisit(string date, string duration, string customerID, string isMonth)
        {
            string retval = "NOK";
            DateTime dStart = Convert.ToDateTime(date);
            short dDuration = Convert.ToInt16(duration);
            using (CEntities db = new CEntities())
            {
                Meeting rec = new Meeting();
                rec.UserId = Convert.ToInt32(Session["UserID"]);
                rec.CustomerId = Convert.ToInt32(customerID);
                rec.DateStart = dStart;
                rec.DateEnd = dStart.AddMinutes(dDuration);
                rec.MeetingViaId = 1;
                rec.MeetingDoneId = 1;

                db.Meeting.Add(rec);
                db.SaveChanges();
            }
            retval = "OK";
            return retval;
        }









        [Serializable]
        public class NCalendar
        {
            public int id { get; set; }
            public string title { get; set; }
            public bool allDay { get; set; }
            public string start { get; set; }
            public string end { get; set; }
            public string color { get; set; }
            public string url { get; set; }
            public string description { get; set; }
            public bool? isVisited { get; set; }
            public bool editable { get; set; }
        }

    }
}
