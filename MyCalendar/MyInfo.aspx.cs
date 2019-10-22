using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyCalendar
{
    public partial class MyInfo : System.Web.UI.Page
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
            //changePassTxt.Text = "To change password: ";
            if (!Page.IsPostBack)
            {
                if (!ISLOGIN)
                {
                    Response.Redirect("/Login.aspx");
                }
                else
                {

                    lblUsernameTxt.Text = Session["Username"].ToString();
                    using (CEntities db = new CEntities())
                    {
                        int userID = Convert.ToInt32(Session["UserID"]);
                        Users rec = db.Users.Where(a => a.Id == userID).FirstOrDefault();
                        if (rec != null)
                        {
                            lblUsernameTxt.Text = rec.Username;
                            lblEMailTxt.Text = rec.Email;
                        }
                    }

                }
            }
        }

        protected void UpdateProfile_Click(object sender, EventArgs e)
        {
            using (CEntities db = new CEntities())
            {
                int userID = Convert.ToInt32(Session["UserID"]);

                Users rec = db.Users.Where(a => a.Id == userID).FirstOrDefault();
                if (rec != null)
                {
                    if (!string.IsNullOrEmpty(NewUsernameTxt.Text))
                    {

                        rec.Username = NewUsernameTxt.Text;
                        NewUsernameTxt.Text = "";
                        lblUsernameTxt.Text = rec.Username;
                    }
                    if (!string.IsNullOrEmpty(NewEMailTxt.Text))
                    {
                        rec.Email = NewEMailTxt.Text;
                        NewEMailTxt.Text = "";
                        lblEMailTxt.Text = rec.Email;

                    }

                    Response.Write("<script>alert('You updated your information successfully')</script>");
                    db.SaveChanges();
                    Session["Username"] = rec.Username;

                }
              
            }
        }


    }
}