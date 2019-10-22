using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyCalendar
{
    public partial class CalendarDetail : System.Web.UI.Page
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
                    string meetId = Request.QueryString["ID"].ToString();

                    int UId = (Int32)Session["UserID"];

                    dplMeetingDone.Items.Insert(0, new ListItem("Choose meeting status", "0"));
                    dplMeetingDone.Items.Insert(1, new ListItem("Undefined", "1"));
                    dplMeetingDone.Items.Insert(2, new ListItem("Done", "2"));
                    dplMeetingDone.Items.Insert(3, new ListItem("Undone", "3"));

                    dplMeetingVia.Items.Insert(0, new ListItem("Choose meeting type", "0"));
                    dplMeetingVia.Items.Insert(1, new ListItem("Interview", "1"));
                    dplMeetingVia.Items.Insert(2, new ListItem("Phone", "2"));
                    dplMeetingVia.Items.Insert(3, new ListItem("E-Mail", "3"));

                    using (CEntities db = new CEntities())
                    {
                        Meeting meet = db.Meeting.Where(a => a.Id.ToString() == meetId).FirstOrDefault();
                        dplMeetingDone.SelectedValue = meet.MeetingDoneId.ToString();
                        dplMeetingVia.SelectedValue = meet.MeetingViaId.ToString();

                        lblDesc.Text = meet.Description;
                        lblWhom.Text = meet.Whom;

                        List<Customer> cuslist = db.Customer.Where(a => a.UserId == UId).ToList();
                        if (!cuslist.Any())
                        {
                            Response.Write("<script language='javascript'>window.alert('You have to register customers');window.location='AddCustomer.aspx';</script>");
                        }
                        dplCustomer.DataSource = cuslist;
                        dplCustomer.DataTextField = "Name";
                        dplCustomer.DataValueField = "Id";
                        dplCustomer.DataBind();
                    }

                    lblUsername.Text = Session["Username"].ToString();
                }
            }
        }
        protected void btnCalendarDetail_Click(object sender, EventArgs e)
        {
            using (CEntities db = new CEntities())
            {

                string meetId = Request.QueryString["ID"].ToString();

                Meeting meet = db.Meeting.Where(a => a.Id.ToString() == meetId).FirstOrDefault();

                if (meet != null)
                {
                    byte meetviaId = Convert.ToByte(dplMeetingVia.SelectedValue);
                    byte meetdoneId = Convert.ToByte(dplMeetingDone.SelectedValue);
                    int newCusId = Convert.ToInt16(dplCustomer.SelectedValue);
                    if (!string.IsNullOrEmpty(txtDateStart.Text) && !string.IsNullOrEmpty(txtDateEnd.Text)){
                        meet.DateStart = Convert.ToDateTime(txtDateStart.Text);
                        meet.DateEnd = Convert.ToDateTime(txtDateEnd.Text);
                    }
                    meet.CustomerId = newCusId;
                    meet.MeetingDoneId = meetdoneId;
                    meet.MeetingViaId = meetviaId;
                    meet.Description = txtDesc.Text;
                    meet.Whom = txtWhom.Text;
                    db.SaveChanges();

                    Response.Redirect("/Calendar.aspx");

                }
            }

        }

        protected void btnGoBackToMain_Click(object sender, EventArgs e)
        {
            Response.Redirect("/MainPage.aspx");
        }
    }
}