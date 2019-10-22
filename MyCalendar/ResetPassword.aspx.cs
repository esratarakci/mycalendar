using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyCalendar
{
    public partial class ResetPassword : System.Web.UI.Page
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
            string UId = Request.QueryString["uid"].ToString();

            if (String.IsNullOrEmpty(Request.QueryString["uid"]))
            {
                Response.Redirect("/Login.aspx");
            }
            else
            {
                using (CEntities db = new CEntities())
                {
                    Users rec = db.Users.Where(a => a.PasswordResetId.ToString() == UId).FirstOrDefault();
                    if (rec == null)
                    {
                        Response.AddHeader("The link is expired ", "URL=Login.aspx");

                    }
                }
            }
            
            
        }

        protected void UpdatePass_Click(object sender, EventArgs e)
        {
            string UId = Request.QueryString["uid"].ToString();

            if (!string.IsNullOrEmpty(ConfirmPassTxt.Text) && !string.IsNullOrEmpty(NewPassTxt.Text))
            {
               
                if (!ConfirmPassTxt.Text.Equals(NewPassTxt.Text))
                {
                    Response.Write("<script>alert('Passwords are not matching')</script>;");
                }
                else
                {
                    using (CEntities db = new CEntities())
                    {
                        Users rec = db.Users.Where(a => a.PasswordResetId.ToString() == UId).FirstOrDefault();
                        if (rec != null)
                        {
                            rec.Password = NewPassTxt.Text;
                            rec.PasswordResetId = null;
                            db.SaveChanges();
                            Session["UserID"] = rec.Id;
                            Session["Username"] = rec.Username;
                            Response.Redirect("/MainPage.aspx");

                        }

                    }
                }
            }
        }
    }
}
