using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LinQuiz
{
    public partial class AdminPanel : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);

                String nazwaUser;

                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }

                // Nazwa
                SqlCommand cmd1 = new SqlCommand("SELECT nazwa FROM uzytkownik WHERE nazwa=@nazwaSesja", con);
                cmd1.Parameters.AddWithValue("@nazwaSesja", Session["nazwa"].ToString());

                nazwaUser = (String)cmd1.ExecuteScalar();
                nazwaLabel.Text = nazwaUser;

                // Zamknij połączenie
                con.Close();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }

            try
            {
                if (!(Session["czy_admin"].Equals("1")))
                {
                    Response.Redirect("Login.aspx");
                }
            }
            catch
            {
                Response.Redirect("Login.aspx");
            }
        }
    }
}