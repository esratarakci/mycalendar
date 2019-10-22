using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyCalendar
{
    public partial class Register : System.Web.UI.Page
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

        }
        protected void RegisterBt_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Username.Text) && !string.IsNullOrEmpty(Password.Text) && !string.IsNullOrEmpty(Password2.Text) && !string.IsNullOrEmpty(Email.Text))
            {
               
                using (CEntities db = new CEntities())
                {
                    Users reg = new Users();
                  
                    reg.Email = Email.Text;
                    reg.Username = Username.Text;
                    if (Password.Text.Equals(Password2.Text))

                    {
                        reg.Password = Password.Text;
                        db.Users.Add(reg);
                       
                        
                        db.SaveChanges();
                        Response.Write("<script language='javascript'>window.alert('You successfully registered');window.location='MainPage.aspx';</script>");
                    }

                    else
                    {
                        lblMessagePass.Text = "Your passwords are not matching";
                    }
                   

                }
            }
            else
            {
                lblMessage.Text = "Fields should be filled";
            }

        }
    }
}
