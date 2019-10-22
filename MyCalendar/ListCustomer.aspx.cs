using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyCalendar
{
    public partial class ListCustomer : System.Web.UI.Page
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
                cuslist = db.Customer.Where(a => a.UserId == UId).ToList();

            }
            rpt_demo.DataSource = cuslist;
            rpt_demo.DataBind();
            return cuslist;
        }

        protected void AddNewCus_Click(object sender, EventArgs e)
        {
            Response.Redirect("/AddCustomer.aspx");
        }

        

        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Delete")
            {
                using (CEntities db = new CEntities())
                {
                    int id = Convert.ToInt32(e.CommandArgument);
                    Customer cus = db.Customer.Where(a => a.Id == id).FirstOrDefault();
                    List<Meeting> meetlist = db.Meeting.Where(a => a.CustomerId == id).ToList();

                    
                    if (cus != null)
                    {
                        db.Customer.Remove(cus);
                        foreach(Meeting m in meetlist)
                        {
                            db.Meeting.Remove(m);

                        }

                        db.SaveChanges();
                    }
                    List_Customers();
                }
            }
        }
    }
}
