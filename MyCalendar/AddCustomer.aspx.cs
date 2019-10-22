using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyCalendar
{
    public partial class AddCustomer : System.Web.UI.Page
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
                }
            }
        }

        protected void AddCust_Click(object sender, EventArgs e)
        {
            using (CEntities db = new CEntities())
            {
                if (!string.IsNullOrEmpty(NameTxt.Text) && !string.IsNullOrEmpty(PhoneTxt.Text))

                {
                    Customer cus = new Customer();

                    cus.UserId = (int)Session["UserID"];
                    cus.Name = NameTxt.Text;
                    cus.Mail = MailTxt.Text;
                    cus.Phone = PhoneTxt.Text;
                    cus.Adress = AddressTxt.Text;

                    db.Customer.Add(cus);
                    db.SaveChanges();


                    Response.Write("<script language='javascript'>window.alert('Customer is added');window.location='ListCustomer.aspx';</script>");
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
