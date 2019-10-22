using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyCalendar
{
    public partial class Meetings : System.Web.UI.Page
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
                        List<VW_Customer> cuslist = db.VW_Customer.Where(a => a.UserId == UId).ToList();
                        if (!cuslist.Any())
                        {
                            Response.Write("<script language='javascript'>window.alert('You have to register customers first');window.location='AddCustomer.aspx';</script>");
                        }
                        dplCustomer.DataSource = cuslist;
                        dplCustomer.DataTextField = "FullName";
                        dplCustomer.DataValueField = "Id";
                        dplCustomer.DataBind();

                    }
                }
            }

        }

        protected void AddMeeting_Click(object sender, EventArgs e)
        {
            using (CEntities db = new CEntities())
            {
                if (!string.IsNullOrEmpty(txtDateStart.Text) && !string.IsNullOrEmpty(txtduration.Text))

                {

                    int UId = (Int32)Session["UserID"];
                    Meeting meet = new Meeting();


                    byte meetviaId = Convert.ToByte(dplMeetingVia.SelectedValue);
                    byte meetdoneId = Convert.ToByte(dplMeetingDone.SelectedValue);
                    int newCusId = Convert.ToInt16(dplCustomer.SelectedValue);
                    int duration = Convert.ToInt32(txtduration.Text);

                    meet.UserId = UId;
                    meet.CustomerId = newCusId;
                    meet.DateStart = Convert.ToDateTime(txtDateStart.Text);
                    meet.DateEnd = meet.DateStart.AddMinutes(duration);
                    if(!string.IsNullOrEmpty(txtDesc.Text) && !string.IsNullOrEmpty(txtWhom.Text)) { 
                    meet.Description = txtDesc.Text;
                    meet.Whom = txtWhom.Text;
                    }
                    meet.MeetingViaId = meetviaId;
                    meet.MeetingDoneId = meetdoneId;


                    db.Meeting.Add(meet);
                    db.SaveChanges();


                    Response.Write("<script language='javascript'>window.alert('Meeting is created');window.location='ListMeeting.aspx';</script>");

                }
                else
                {
                    Response.Write("<script language='javascript'>alert('Fill the required information')</script>;");
                }
            }
        }


        protected void GoBackToMainBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("/MainPage.aspx");
        }


    }

}