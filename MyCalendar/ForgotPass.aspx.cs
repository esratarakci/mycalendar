using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Text;
using System.Net;
using System.Data.SqlClient;
using System.Configuration;


namespace MyCalendar
{
    public partial class ForgotPass : System.Web.UI.Page
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

        }

        private void SendPasswordResetEmail(string Email, string Username, string UniqueId)
        {
            MailMessage mail = new MailMessage();
            mail.IsBodyHtml = true;
            mail.From = new MailAddress("mycalendar1919@gmail.com", "My Calendar");

            StringBuilder sbEmailBody = new StringBuilder();
            sbEmailBody.Append("Dear " + Username + "<br/></br>");
            sbEmailBody.Append("Please click on the following link to reset your password");
            sbEmailBody.Append("<br/>");
            sbEmailBody.Append("https://localhost:44332/ResetPassword.aspx?uid=" + UniqueId);
            sbEmailBody.Append("<br/><br/>");
            sbEmailBody.Append("<b>My Calendar Application<b>");
            mail.Body = sbEmailBody.ToString();

            mail.Subject = "Reset Password";
            mail.HeadersEncoding = Encoding.GetEncoding("ISO-8859-9");
            mail.SubjectEncoding = Encoding.GetEncoding("ISO-8859-9");
            mail.BodyEncoding = Encoding.GetEncoding("ISO-8859-9");
            mail.To.Add(new MailAddress(Email));

            SmtpClient client = new SmtpClient("smtp.gmail.com", 587);
            client.Credentials = new NetworkCredential("mycalendar1919@gmail.com", "ab12cd12");
            client.EnableSsl = true;
            client.Timeout = 30000;
            client.Send(mail);
            lblMessage.Text = "E-mail has been sent.";
           

        }

        protected void ResetPass_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(EMailTxt.Text))
            {
                using (CEntities db = new CEntities())
                {
                    Users rec = db.Users.Where(a => a.Email == EMailTxt.Text).FirstOrDefault();
                    if (rec != null)
                    {
                        rec.PasswordResetId = Guid.NewGuid();    
                        db.SaveChanges();
                        SendPasswordResetEmail(rec.Email, rec.Username, rec.PasswordResetId.ToString());
                      
                    }
                    else
                    {
                        Response.Write("<script>alert('User not found')</script>;");
                    }
                }
            }
        }

        protected void BtnGoBackToMain_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Login.aspx");
        }
    }
}