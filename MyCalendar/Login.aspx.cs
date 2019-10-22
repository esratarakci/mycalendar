using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace MyCalendar
{
    public partial class Login : System.Web.UI.Page
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
                if (ISLOGIN)
                {
                    Response.Redirect("/MainPage.aspx");
                }
                else if (Request.Cookies["Username"] != null && Request.Cookies["Password"] != null)
                {
                    txtLoginName.Text = Request.Cookies["Username"].Value;
                    txtPassword.Text = Request.Cookies["Password"].Value;
                    chkRememberMe.Checked = true;
                    GoLogin();
                }
                }
                
            
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            GoLogin();
        }


        private void GoLogin()
        {
            if (!string.IsNullOrEmpty(txtLoginName.Text) && !string.IsNullOrEmpty(txtPassword.Text))
            {
                using (CEntities db = new CEntities())
                {
                   Users rec = db.Users.Where(a => a.Email == txtLoginName.Text && a.Password == txtPassword.Text).FirstOrDefault();
                
                    if (rec!=null)
                    {
                        Session["UserID"] = rec.Id;
                        Session["Username"] = rec.Username;

                        if (chkRememberMe.Checked)
                        {
                            Response.Cookies["Username"].Value = txtLoginName.Text;
                            Response.Cookies["Password"].Value = txtPassword.Text;
                            Response.Cookies["Username"].Expires = DateTime.MaxValue;
                            Response.Cookies["Password"].Expires = DateTime.MaxValue;
                        }
                        else
                        {
                            Response.Cookies["Username"].Expires = DateTime.Now.AddDays(-1);
                            Response.Cookies["Password"].Expires = DateTime.Now.AddDays(-1);
                        }

                        Response.Redirect("/MainPage.aspx");
                    }
                   
                    
                    else
                    {
                        lblMessage.Text = "Could not found";
                        //Response.Write("<script>alert('Could not found')</script>;");

                    }


                    }
                }
            }
        

            private void Delete()
            {
                using (CEntities db = new CEntities())
                {
                    Users rec = db.Users.Where(a => a.Username == txtLoginName.Text && a.Password == txtPassword.Text).FirstOrDefault();
                    if (rec != null)
                    {
                        db.Users.Remove(rec);
                        db.SaveChanges();
                    }
                }
            }
            private void NewAdd()
            {
                using (CEntities db = new CEntities())
                {
                    Users rec = new Users();
                    rec.Email = "";
                    rec.Username = "";

                    db.Users.Add(rec);
                    db.SaveChanges();
                }
            }
            private Users GetByID(int id)
            {
                Users rec = null;
                using (CEntities db = new CEntities())
                {
                    id = 1;
                    rec = db.Users.Where(a => a.Id == id).FirstOrDefault();
                    if (rec != null)
                    {

                    }
                }
                return rec;
            }

            protected void ResetPassBtn_Click(object sender, EventArgs e)
            {

            }




            /*
    private List<Users> GetListByName(string name)
    {
       List<Users> list = null;
       using (CEntities db = new CEntities())
       {
           list = db.Users.Where(a => a.Name.Contains(name)).ToList();
       }
       return list;
    }
    */



        }
    }




