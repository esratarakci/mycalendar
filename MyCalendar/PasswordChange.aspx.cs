using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyCalendar
{
    public partial class PasswordChange : System.Web.UI.Page
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

        [Obsolete]
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

                }
            }
        }

        protected void SavePassBtn_Click(object sender, EventArgs e)
        {

            if (!string.IsNullOrEmpty(CurrentPasswordTxt.Text) && !string.IsNullOrEmpty(NewPassTxt.Text) && !string.IsNullOrEmpty(ConfirmPassTxt.Text))
            {
                using (CEntities db = new CEntities())
                {
                    int userID = Convert.ToInt32(Session["UserID"]);
                    Users rec = db.Users.Where(a => a.Id == userID).FirstOrDefault();
                    if (rec != null)
                    {
                        if (rec.Password.Equals(CurrentPasswordTxt.Text))
                        {
                            if (NewPassTxt.Text.Equals(ConfirmPassTxt.Text))
                            {
                                rec.Password = NewPassTxt.Text;
                                db.SaveChanges();
                                Response.Write("<script>alert('Password is updated')</script>");
                                Response.Redirect("/Login.aspx");
                            }
                            else
                            {
                                Response.Write("<script>alert('Passwords are not matching')</script>");

                            }

                        }
                        else
                        {
                            Response.Write("<script>alert('Password is wrong')</script>");

                        }

                    }

                }

            }
        }

        protected void GoBackToMainBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("/MainPage.aspx");
        }
    }
}
