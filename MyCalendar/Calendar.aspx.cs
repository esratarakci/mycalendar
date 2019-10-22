using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyCalendar
{
    public partial class Calendar : System.Web.UI.Page
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

                    List_Customers();
                }
            }
        }

        private List<Customer> List_Customers()
        {
            List<Customer> cuslist = null;
            using (CEntities db = new CEntities())
            {
                int UId = (Int32)Session["UserID"];
                cuslist = db.Customer.AsNoTracking().Where(a => a.UserId == UId).ToList();

            }
            rptCust.DataSource = cuslist;
            rptCust.DataBind();
            return cuslist;
        }
    }
}