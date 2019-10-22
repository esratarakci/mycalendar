using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyCalendar
{
    public partial class ListMeeting : System.Web.UI.Page
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

                    List_Meetings();
                }
            }
        }
        private List<VW_Meeting> List_Meetings()
        {
            List<VW_Meeting> list = null;
           
            using (CEntities db = new CEntities())
            {
                int UId = (Int32)Session["UserID"];
               list = db.VW_Meeting.Where(a => a.UserId == UId).ToList();
            }

            rpt_demo.DataSource = list;
            rpt_demo.DataBind();
            return list;
        }

        protected void AddNewMeet_Click(object sender, EventArgs e)
        {
            Response.Redirect("/AddMeeting.aspx");
        }


        protected void Repeater_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Delete")
            {
                using (CEntities db = new CEntities())
                {
                    int id = Convert.ToInt32(e.CommandArgument);
                    Meeting meet = db.Meeting.Where(a => a.Id == id).FirstOrDefault();
                    if (meet != null)
                    {
                        db.Meeting.Remove(meet);
                        db.SaveChanges();
                    }
                    List_Meetings();
                }
            }
        }

        protected void Search_Click(object sender, EventArgs e)
        {

            List<VW_Meeting> list = null;

            using (CEntities db = new CEntities())
            {
                list = db.VW_Meeting.Where(a => a.CustomerName == txtSearch.Text).ToList();
            }

            rpt_demo.DataSource = list;
            rpt_demo.DataBind();
        }
    }
}