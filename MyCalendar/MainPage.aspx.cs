using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyCalendar
{
    public partial class MainPage : System.Web.UI.Page
    {
        public bool ISLOGIN
        {
            get
            {
                bool tmpIsLogin = false;
                if (Session["UserID"] != null)
                {
                    int ID = 0;
                    if (int.TryParse(Session["UserID"].ToString(), out ID))
                    {
                        if (ID > 0)
                        {
                            tmpIsLogin = true;
                        }
                    }
                }
                return tmpIsLogin;
            }
            //set
            //{
            //    Session["UserID"] = value;
            //}
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (!ISLOGIN)
                {
                    Response.Redirect("/Login.aspx");
                }
                else
                {
                    lblUsername.Text = Session["Username"].ToString();
                    using(CEntities db = new CEntities())
                    {
                        DateTime dts = DateTime.Now.Date;
                        DateTime dte = DateTime.Now.Date.AddDays(2);
                        int UId = Convert.ToInt16(Session["UserID"]);


                        List<VW_Meeting> rec = db.VW_Meeting.Where(a => a.DateStart >= dts && a.DateStart < dte && a.UserId == UId).ToList();
                        rpt_demo.DataSource = rec;
                        rpt_demo.DataBind();
                    }


                    //yada
                    //using (CEntities db = new CEntities())
                    //{
                    //    int UserID = Convert.ToInt32(Session["UserID"]);
                    //    Users rec = db.Users.Where(a => a.Id == UserID).FirstOrDefault();
                    //    if (rec != null)
                    //    {
                    //        lblUserName.Text = rec.Username;
                    //    }
                    //}

                }
            }
        }
    }
}